# MTB CAT3 XMC Library v4.1.0

Please refer to the [README](./README.md) and the XMCLib for [XMC1000](https://infineon.github.io/mtb-xmclib-cat3/xmc1_api_reference_manual/html/index.html)/[XMC4000](https://infineon.github.io/mtb-xmclib-cat3/xmc4_api_reference_manual/html/index.html) API Reference Manual for a complete description.

## What Changed?

### New personalities

- ACMP 1.0
- CAN 1.0
- [CCU4 2.0](https://infineon.github.io/mtb-xmclib-cat3/xmc4_api_reference_manual/html/page_personalities_reference.html#section_personality_ccu4)
- CCU8 1.0
- DAC 1.0
- DMA 1.0
- [DSD 1.0](https://infineon.github.io/mtb-xmclib-cat3/xmc4_api_reference_manual/html/page_personalities_reference.html#section_personality_dsd)
- EEPROM 1.0
- emUSB 1.0 - Designed to be used with emUSB-Device Middleware.
- emUSB_OS_Timer 1.0 - Designed to be used with emUSB-Device Middleware.
- ERU 1.0
- FCE 1.0
- [HRPWM 1.0](https://infineon.github.io/mtb-xmclib-cat3/xmc4_api_reference_manual/html/page_personalities_reference.html#section_personality_hrpwm)
- [POSIF 1.0](https://infineon.github.io/mtb-xmclib-cat3/xmc4_api_reference_manual/html/page_personalities_reference.html#section_personality_posif)
- RTC 1.0
- SPI 1.0
- VADC 1.0
- [WDT 1.0](https://infineon.github.io/mtb-xmclib-cat3/xmc4_api_reference_manual/html/page_personalities_reference.html#section_personality_wdt)

### Updated personalities

- [CCU4 1.0](https://infineon.github.io/mtb-xmclib-cat3/xmc4_api_reference_manual/html/page_personalities_reference.html#section_personality_ccu4)
- I2C 1.0 - Connectivity improvements
- UART 1.0 - Connectivity improvements

### Updated drivers

- [Common APIs to all peripherals (COMMON)](https://infineon.github.io/mtb-xmclib-cat3/xmc4_api_reference_manual/html/group___c_o_m_m_o_n.html)
- [Delta Sigma Demodulator (DSD)](https://infineon.github.io/mtb-xmclib-cat3/xmc4_api_reference_manual/html/group___d_s_d.html)
- [High Resolution PWM Unit (HRPWM)](https://infineon.github.io/mtb-xmclib-cat3/xmc4_api_reference_manual/html/group___h_r_p_w_m.html)
- [Position Interface Unit (POSIF)](https://infineon.github.io/mtb-xmclib-cat3/xmc4_api_reference_manual/html/group___p_o_s_i_f.html)
- [Real-time clock (RTC)](https://infineon.github.io/mtb-xmclib-cat3/xmc4_api_reference_manual/html/group___r_t_c.html)
- [System Control Unit(SCU)](https://infineon.github.io/mtb-xmclib-cat3/xmc4_api_reference_manual/html/group___s_c_u.html)
- [Watchdog driver (WDT)](https://infineon.github.io/mtb-xmclib-cat3/xmc4_api_reference_manual/html/group___w_d_t.html)

## Supported Software and Tools

This version of the XMCLib was validated for compatibility with the following Software and Tools:

| Software and Tools                                                            | Version |
| :---                                                                          | :----   |
| ModusToolbox&trade;                                                           |  3.0.0  |
| [core library](https://github.com/Infineon/core-lib)                          |  1.3.1  |
| [device-db](https://github.com/Infineon/device-db)                            |  4.0.3  |
| CMSIS-Core(M)                                                                 |  5.8.0  |
| GCC Compiler                                                                  | 10.3.1  |

## More information

Use the following links for more information, as needed:

* [XMCLib README](./README.md)
* [XMCLib for XMC1000 API Reference Manual](https://infineon.github.io/mtb-xmclib-cat3/xmc1_api_reference_manual/html/index.html)
* [XMCLib for XMC4000 API Reference Manual](https://infineon.github.io/mtb-xmclib-cat3/xmc4_api_reference_manual/html/index.html)
* [ModusToolbox Software Environment, Quick Start Guide, Documentation, and Videos](https://www.infineon.com/cms/en/design-support/tools/sdk/modustoolbox-software/)
* [ModusToolbox Device Configurator Tool Guide](https://www.infineon.com/dgdl/Infineon-ModusToolbox_Device_Configurator_4.0_User_Guide-UserManual-v01_00-EN.pdf?fileId=8ac78c8c8386267f0183a960bd41598f&utm_source=cypress&utm_medium=referral&utm_campaign=202110_globe_en_all_integration-files&redirId=180683)
* [Infineon XMC microcontrollers](https://www.infineon.com/cms/en/product/microcontroller/32-bit-industrial-microcontroller-based-on-arm-cortex-m/)
* [XMC1000 Family technical documentation](https://www.infineon.com/cms/en/product/microcontroller/32-bit-industrial-microcontroller-based-on-arm-cortex-m/32-bit-xmc1000-industrial-microcontroller-arm-cortex-m0/#!documents)
* [XMC4000 Family technical documentation](https://www.infineon.com/cms/en/product/microcontroller/32-bit-industrial-microcontroller-based-on-arm-cortex-m/32-bit-xmc4000-industrial-microcontroller-arm-cortex-m4/#!documents)

---
© Infineon Technologies, 2020-2022.
