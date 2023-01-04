# Copyright 2021-2022 Cypress Semiconductor Corporation
# SPDX-License-Identifier: Apache-2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

proc const {name value} {
    uplevel 1 [list set $name $value]
    uplevel 1 [list trace var $name w {error constant;} ]
}

set channelName stdout
if {[chan names ModusToolbox] eq "ModusToolbox"} {
    set channelName ModusToolbox
}

const SUCCESS 0
const ERROR 1
const ERROR_EQUAL_VALUES 2

const DAC_MIN_CLK_DIV 16
const DAC_MAX_CLK_DIV 1048575
const DAC_REGISTER_MAX_USIGN 4095.0
const DAC_VSS_MAX 2.20
const DAC_VOLT_MIN 0.30
const DAC_VOLT_MAX 2.50
const DAC_OFFSET_SIGN 1.40
const DAC_PATTERN_AMPLITUDE 62.0
const DAC_REGISTER_MAX_SIGN 2048.0
const DAC_MAX_FREQ 2000000
const MAX_SHIFT 7

const DAC_SHIFT_RIGHT 0
const DAC_SHIFT_LEFT 1

proc solve_ramp {} {
    if {$::argc != 5} {
        error "Ramp Solver requires 5 arguments:
        \tfloat desired_start_value_ramp_range
        \tfloat desired_stop_value_ramp_range
        \tfloat dac_peri_clock
        \tbool use_external_clock_ramp_check
        \tfloat desired_frequency (external_trigger_frequency_ramp_range or desired_frequency_ramp_range)"
        return $::ERROR
    }

    # inputs
    set gfloat_ramp_desired_start [lindex $::argv 0]
    set gfloat_ramp_desired_stop [lindex $::argv 1]
    set gint_peripheral_clk [lindex $::argv 2]
    set gcheck_use_ext_clock_ramp [lindex $::argv 3]
    set desired_frequency [lindex $::argv 4]
    set gint_ext_clk_ramp 0
    set gint_desired_clk_ramp 0
    if {$gcheck_use_ext_clock_ramp == true} {
        set gint_ext_clk_ramp [expr $desired_frequency]
    } else {
        set gint_desired_clk_ramp [expr $desired_frequency]
    }

    # outputs
    set temp_CalcFreqHz 0
    set temp_CalcStopRamp 0
    set temp_CalcStartRamp 0
    set bit_shift_count 0
    set dac_shift $::DAC_SHIFT_RIGHT
    set arg_StopRamp 0
    set arg_StartRamp 0
    set start_ramp 0
    set stop_ramp 0
    set config_not_posible 1
    set resolution_ramp 0

    # variables
    set negate false
    set clk_ph 0
    set temp_DesiredFreqHz 0
    set bit_shift_count 0
    set temp_steps 1
    set div_dac_clk 0

    if {$gfloat_ramp_desired_start == $gfloat_ramp_desired_stop} {
        puts $::channelName "param:config_not_posible=1"
        puts $::channelName "param:temp_CalcFreqHz=Error - Fix DRC"
        return $::ERROR_EQUAL_VALUES
    } elseif {$gfloat_ramp_desired_start > $gfloat_ramp_desired_stop} {
        #Falling ramp required
        set start_ramp [expr {round(($gfloat_ramp_desired_stop - $::DAC_VOLT_MIN) * ($::DAC_REGISTER_MAX_USIGN / $::DAC_VSS_MAX))}]
        set stop_ramp  [expr {round(($gfloat_ramp_desired_start - $::DAC_VOLT_MIN) * ($::DAC_REGISTER_MAX_USIGN / $::DAC_VSS_MAX))}]
        set negate true
    } else {
        #Rising ramp required
        set start_ramp [expr {round(($gfloat_ramp_desired_start - $::DAC_VOLT_MIN) * ($::DAC_REGISTER_MAX_USIGN / $::DAC_VSS_MAX))}]
        set stop_ramp [expr {round(($gfloat_ramp_desired_stop - $::DAC_VOLT_MIN) * ($::DAC_REGISTER_MAX_USIGN / $::DAC_VSS_MAX))}]
    }

    #Pre-configuration depending on the clock/trigger source
    if {$gcheck_use_ext_clock_ramp == true} {
        set clk_ph [expr $gint_peripheral_clk]
        set temp_DesiredFreqHz [expr $gint_ext_clk_ramp]

        set arg_StartRamp [expr $start_ramp]
        set arg_StopRamp [expr $stop_ramp]

        set temp_CalcStartRamp [expr ($start_ramp) * ($::DAC_VSS_MAX / $::DAC_REGISTER_MAX_USIGN ) + $::DAC_VOLT_MIN]
        set temp_CalcStopRamp [expr ($stop_ramp)*($::DAC_VSS_MAX / $::DAC_REGISTER_MAX_USIGN) + $::DAC_VOLT_MIN]
        set temp_steps [expr $stop_ramp - $start_ramp]
        set div_dac_clk [expr $::DAC_MIN_CLK_DIV]

        if {$negate == true} {
            #Shift start/stop for negative ramp
            set temp_ramp_start [expr $start_ramp]
            set start_ramp [expr $::DAC_REGISTER_MAX_USIGN - $stop_ramp]
            set stop_ramp  [expr $::DAC_REGISTER_MAX_USIGN - $temp_ramp_start]
            set temp_steps [expr $stop_ramp - $start_ramp]
        }

        if {$temp_steps > 0} {
            set temp_CalcFreqHz [expr {round($temp_DesiredFreqHz / $temp_steps)}]
            #Configuration possible
            set config_not_posible 0
        } else {
            #Configuration not possible
            set config_not_posible 1
            set temp_CalcFreqHz 1
        }
    } else {
        set clk_ph [expr $gint_peripheral_clk]
        set temp_DesiredFreqHz [expr $gint_desired_clk_ramp]

        if {$stop_ramp != $start_ramp} {
            set temp_steps [expr $stop_ramp - $start_ramp + 1]
            #Configuration possible
            set config_not_posible 0
        } else {
            set temp_steps 1
            #Not possible to configure
            set config_not_posible 1
        }
        set div_dac_clk [expr {round($clk_ph / ($temp_steps * $temp_DesiredFreqHz))}]
        if {$div_dac_clk < 1} {
            set div_dac_clk 1
        }
        set temp_CalcFreqHz [expr {round($clk_ph / $div_dac_clk)}]

        #Check if DAC clock divider is less than 2^20 - 1
        if {$config_not_posible == 0 } {
            if {$div_dac_clk < $::DAC_MAX_CLK_DIV} {
                if {$temp_CalcFreqHz <= $::DAC_MAX_FREQ} {
                    #Configuration Possible
                    set config_not_posible 0
                } else {
                    #Check if DAC frequency greater than 2 MHz
                    while {$temp_CalcFreqHz > $::DAC_MAX_FREQ} {
                        if {$temp_steps < 3} {
                            #Not possible to configure
                            set config_not_posible 1
                            break
                        } else {
                            if {$bit_shift_count < $::MAX_SHIFT} {
                                #Decrease scaling factor and re-calculate start and stop ramp
                                set dac_shift $::DAC_SHIFT_LEFT
                                set stop_ramp [expr $stop_ramp>>1]
                                set start_ramp [expr $start_ramp>>1]
                                incr bit_shift_count
                                #re-calculate clock divider based on change in steps
                                set temp_steps [expr $stop_ramp - $start_ramp + 1]
                                set div_dac_clk [expr {round($clk_ph / ($temp_steps * $temp_DesiredFreqHz))}]
                                if {$div_dac_clk < 1} {
                                    set div_dac_clk 1
                                }
                                set temp_CalcFreqHz [expr {round($clk_ph / $div_dac_clk)}]
                                #Configuration Possible
                                set config_not_posible 0
                            } else {
                                #Not possible to configure
                                set config_not_posible 1
                                break
                            }
                        }
                    }
                }
            }
        } else {
            while {$div_dac_clk > $::DAC_MAX_CLK_DIV} {
                if {$temp_steps > $::DAC_REGISTER_MAX_USIGN} {
                    #Not possible to configure
                    set config_not_posible 1
                    break
                } else {
                    if {$bit_shift_count < $::MAX_SHIFT} {
                        #Increase scaling factor and re-calculate start and stop ramp
                        set dac_shift $::DAC_SHIFT_RIGHT
                        set stop_ramp [expr $stop_ramp<<1]
                        set start_ramp [expr $start_ramp<<1]

                        if {[expr ($stop_ramp <= $::DAC_REGISTER_MAX_USIGN) && ($start_ramp <= $::DAC_REGISTER_MAX_USIGN)]}
                        {
                            incr bit_shift_count
                            #re-calculate clock divider based on change in steps
                            set temp_steps [expr $stop_ramp - $start_ramp + 1]
                            set div_dac_clk [expr {round($clk_ph / ($temp_steps * $temp_DesiredFreqHz))}]
                            set temp_CalcFreqHz [expr {round($clk_ph / $div_dac_clk)}]
                            #Configuration Possible
                            set config_not_posible 0
                        } else {
                            #Not possible to configure
                            set config_not_posible 1
                            break
                        }
                    } else {
                        #Not possible to configure
                        set config_not_posible 1
                        break
                    }
                }
            }
        }
    }

    set arg_StartRamp $start_ramp
    set arg_StopRamp $stop_ramp
    set temp_CalcFreqHz [expr {round($temp_CalcFreqHz / $temp_steps)}]
    if {$temp_CalcFreqHz < 1} {
        set config_not_posible 1
    }

    if {$dac_shift == $::DAC_SHIFT_RIGHT} {
        #Scaling factor increased by bit_shift_count, re-calculate start and stop ramp
        set temp_CalcStartRamp [expr (int($start_ramp) >> $bit_shift_count) * ($::DAC_VSS_MAX / $::DAC_REGISTER_MAX_USIGN) + $::DAC_VOLT_MIN]
        set temp_CalcStopRamp [expr (int($stop_ramp) >> $bit_shift_count) * ($::DAC_VSS_MAX / $::DAC_REGISTER_MAX_USIGN) + $::DAC_VOLT_MIN]
    } else {
        #Scaling factor decreased by bit_shift_count, re-calculate start and stop ramp
        set temp_CalcStartRamp [expr ($start_ramp << $bit_shift_count) * ($::DAC_VSS_MAX / $::DAC_REGISTER_MAX_USIGN) + $::DAC_VOLT_MIN]
        set temp_CalcStopRamp [expr ($stop_ramp << $bit_shift_count) * ($::DAC_VSS_MAX / $::DAC_REGISTER_MAX_USIGN) + $::DAC_VOLT_MIN]
    }

    if {[expr {($div_dac_clk < $::DAC_MIN_CLK_DIV) || ($div_dac_clk > $::DAC_MAX_CLK_DIV)}]} {
        set config_not_posible 1
    }

    if {$negate == true} {
        #Shift start/stop for negative ramp
        set temp_ramp_start $start_ramp
        set start_ramp [expr $::DAC_REGISTER_MAX_USIGN - $stop_ramp]
        set stop_ramp  [expr $::DAC_REGISTER_MAX_USIGN - $temp_ramp_start]
    }

    if {$config_not_posible != 1} {
        set temp_steps [expr $stop_ramp - $start_ramp + 1]
        set div_dac_clk [expr {round($clk_ph / ($temp_steps * $temp_DesiredFreqHz))}]
        set temp_CalcFreqHz [expr {round($clk_ph / ($temp_steps * $div_dac_clk))}]
    }

    set amplitude [expr {$temp_CalcStopRamp - $temp_CalcStartRamp}]
    set resolution_ramp [expr {(abs($amplitude * 1000.)/($stop_ramp-$start_ramp))}]

    if {1 == $config_not_posible} {
        puts $::channelName "param:config_not_posible=$config_not_posible"
        puts $::channelName "param:temp_CalcFreqHz=Error - Fix DRC"
        return $::ERROR
    } else {
        puts $::channelName "param:temp_CalcFreqHz=$temp_CalcFreqHz"
        puts $::channelName "param:temp_CalcStopRamp=$temp_CalcStopRamp"
        puts $::channelName "param:temp_CalcStartRamp=$temp_CalcStartRamp"
        puts $::channelName "param:bit_shift_count=$bit_shift_count"
        puts $::channelName "param:dac_shift=$dac_shift"
        puts $::channelName "param:negate=$negate"
        puts $::channelName "param:arg_StopRamp=$arg_StopRamp"
        puts $::channelName "param:arg_StartRamp=$arg_StartRamp"
        puts $::channelName "param:start_ramp=$start_ramp"
        puts $::channelName "param:stop_ramp=$stop_ramp"
        puts $::channelName "param:config_not_posible=$config_not_posible"
        puts $::channelName "param:resolution_ramp=$resolution_ramp"
    }

    return $::SUCCESS
}

solve_ramp