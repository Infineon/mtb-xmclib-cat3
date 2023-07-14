# MTB CAT3 XMC Library v4.2.0

Please refer to the [README](./README.md) and the XMCLib for [XMC1000](https://infineon.github.io/mtb-xmclib-cat3/xmc1_api_reference_manual/html/index.html)/[XMC4000](https://infineon.github.io/mtb-xmclib-cat3/xmc4_api_reference_manual/html/index.html) API Reference Manual for a complete description.

## What Changed?

### Updated personalities

- All personalities - Updated the parameters naming and images location.
- emUSB - Removed the redundant code generation. Improved the DRC handling.
- emUSB OS Timer - Added a new field for the Interrupt Priority selection. Fixed the issue with the Service Request selection.
- CCU4 Global 1.0 - Fixed the generated interrupt handler and number macros.
- I2C 1.0 - Obsoleted the functionality cleanup.
- VADC-GROUP 1.0 -  Updated the connection visibility of Background Gating Input signal. Updated the generated gate and trigger signals configurational macros.
- WDT 1.0 - Updated the connection visibility of the Service Output signal.

### Updated drivers

- The SCU_CLK_DSLEEPCR_SYSSEL_Msk value of the CMSIS headers XMC4500.h, XMC4502.h, XMC4504.h, XMC4700.h, and XMC4800.h changed to 0x1UL.
- The DSLEEPCR register SYSSEL section <msb>  parameter changed to 0 for XMC4500.svd, XMC4700.svd, and XMC4800.svd.
- Updated the High Resolution PWM Unit (HRPWM) mapping file.
- Removed the change history from the source files.

## Supported Software and Tools

This version of the XMCLib was validated for compatibility with the following Software and Tools:

| Software and Tools                                                            | Version |
| :---                                                                          | :----   |
| ModusToolbox&trade;                                                           |  3.1.0  |
| [core library](https://github.com/Infineon/core-lib)                          |  1.3.1  |
| [device-db](https://github.com/Infineon/device-db)                            |  4.3.0  |
| CMSIS-Core(M)                                                                 |  5.8.0  |
| GCC Compiler                                                                  | 11.3.1  |

## More information

Use the following links for more information, as needed:

* [XMCLib README](./README.md)
* [XMCLib for XMC1000 API Reference Manual](https://infineon.github.io/mtb-xmclib-cat3/xmc1_api_reference_manual/html/index.html)
* [XMCLib for XMC4000 API Reference Manual](https://infineon.github.io/mtb-xmclib-cat3/xmc4_api_reference_manual/html/index.html)
* [ModusToolbox Software Environment, Quick Start Guide, Documentation, and Videos](https://www.infineon.com/cms/en/design-support/tools/sdk/modustoolbox-software/)
* [ModusToolbox Device Configurator Tool Guide](https://www.infineon.com/dgdl/Infineon-ModusToolbox_Device_Configurator_4.10_User_Guide-UserManual-v01_00-EN.pdf?fileId=8ac78c8c88704c7a0188a18bc3c94e70)
* [Infineon XMC microcontrollers](https://www.infineon.com/cms/en/product/microcontroller/32-bit-industrial-microcontroller-based-on-arm-cortex-m/)
* [XMC1000 Family technical documentation](https://www.infineon.com/cms/en/product/microcontroller/32-bit-industrial-microcontroller-based-on-arm-cortex-m/32-bit-xmc1000-industrial-microcontroller-arm-cortex-m0/#!documents)
* [XMC4000 Family technical documentation](https://www.infineon.com/cms/en/product/microcontroller/32-bit-industrial-microcontroller-based-on-arm-cortex-m/32-bit-xmc4000-industrial-microcontroller-arm-cortex-m4/#!documents)

---
© Infineon Technologies, 2020-2023.
