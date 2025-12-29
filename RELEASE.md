# MTB CAT3 XMC Library v4.7.0

Please refer to the [README](./README.md) and the XMCLib for [XMC1000](https://infineon.github.io/mtb-xmclib-cat3/xmc1_api_reference_manual/html/index.html)/[XMC4000](https://infineon.github.io/mtb-xmclib-cat3/xmc4_api_reference_manual/html/index.html) API Reference Manual for a complete description.

## What Changed?

- Fixed CPU faults with enabled Prefetch Unit during startup sequence for low temperature range. Impacted devices: XMC44xx and XMC45xx.

### New personalities

- SPI 3.0 - In the new version was fixed the logic for Half-Duplex and Full-Duplex to ensure correct pin validation for DOUT and DIN.

### Updated drivers

- FLASH - Fixed a crash in XMC_FLASH_ProgramVerifyPage and XMC_FLASH_ErasePage on XMC1xxx devices that occurred during flash write/verify operations.
- FLASH and SCU - Fixed GCC Compiler 14.2.1 warnings for XMC1xxx devices.

## Supported Software and Tools

This version of the XMCLib was validated for compatibility with the following Software and Tools:

| Software and Tools                                                            | Version |
| :---                                                                          | :----   |
| ModusToolbox&trade;                                                           |  3.6.0  |
| [core library](https://github.com/Infineon/core-lib)                          |  1.6.0  |
| [device-db](https://github.com/Infineon/device-db)                            |  4.33.0 |
| CMSIS-Core(M)                                                                 |  6.1.0  |
| GCC Compiler                                                                  | 14.2.1  |

## More information

Use the following links for more information, as needed:

* [XMCLib README](./README.md)
* [XMCLib for XMC1000 API Reference Manual](https://infineon.github.io/mtb-xmclib-cat3/xmc1_api_reference_manual/html/index.html)
* [XMCLib for XMC4000 API Reference Manual](https://infineon.github.io/mtb-xmclib-cat3/xmc4_api_reference_manual/html/index.html)
* [ModusToolbox Software Environment, Quick Start Guide, Documentation, and Videos](https://www.infineon.com/cms/en/design-support/tools/sdk/modustoolbox-software/)
* [ModusToolbox Device Configurator Tool Guide](https://www.infineon.com/dgdl/Infineon-ModusToolbox_Device_Configurator_4.20_User_Guide-UserManual-v01_00-EN.pdf?fileId=8ac78c8c8d2fe47b018e0ea9a6727916)
* [Infineon XMC microcontrollers](https://www.infineon.com/cms/en/product/microcontroller/32-bit-industrial-microcontroller-based-on-arm-cortex-m/)
* [XMC1000 Family technical documentation](https://www.infineon.com/cms/en/product/microcontroller/32-bit-industrial-microcontroller-based-on-arm-cortex-m/32-bit-xmc1000-industrial-microcontroller-arm-cortex-m0/#!documents)
* [XMC4000 Family technical documentation](https://www.infineon.com/cms/en/product/microcontroller/32-bit-industrial-microcontroller-based-on-arm-cortex-m/32-bit-xmc4000-industrial-microcontroller-arm-cortex-m4/#!documents)

---
© Infineon Technologies, 2020-2025.
