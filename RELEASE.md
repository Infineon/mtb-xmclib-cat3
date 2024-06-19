# MTB CAT3 XMC Library v4.4.0

Please refer to the [README](./README.md) and the XMCLib for [XMC1000](https://infineon.github.io/mtb-xmclib-cat3/xmc1_api_reference_manual/html/index.html)/[XMC4000](https://infineon.github.io/mtb-xmclib-cat3/xmc4_api_reference_manual/html/index.html) API Reference Manual for a complete description.

## What Changed?

### Updated personalities

- emUSB 1.0 - Updated to support OTG mode
- emUSB OS Timer 1.0 - Fixed the visibility - available only for devices with the USB
- SDMMC 1.0 - Fixed the visible attribute of the SR0 parameter
- I2C 1.0, SPI 1.0 and UART 1.0 - Updated the visible attributes of the Service Request parameters
- VADC 1.0 and VADC Group 1.0 - Added the code generation for the synchronization master group, fixed the min and max attributes of the Start Selection parameter
- CAN Node 1.0 - Fixed the default value of the Number of Objects in the List parameter

## Supported Software and Tools

This version of the XMCLib was validated for compatibility with the following Software and Tools:

| Software and Tools                                                            | Version |
| :---                                                                          | :----   |
| ModusToolbox&trade;                                                           |  3.2.0  |
| [core library](https://github.com/Infineon/core-lib)                          |  1.4.2  |
| [device-db](https://github.com/Infineon/device-db)                            |  4.15.0 |
| CMSIS-Core(M)                                                                 |  5.8.0  |
| GCC Compiler                                                                  | 11.3.1  |

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
© Infineon Technologies, 2020-2024.
