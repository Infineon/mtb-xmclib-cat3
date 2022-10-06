# MTB CAT3 XMC Library v4.0.0

Please refer to the [README](./README.md) and the XMCLib for [XMC1000](https://infineon.github.io/mtb-xmclib-cat3/xmc1_api_reference_manual/html/index.html)/[XMC4000](https://infineon.github.io/mtb-xmclib-cat3/xmc4_api_reference_manual/html/index.html) API Reference Manual for a complete description.

## What Changed?

* Added support for the ModusToolbox 3.0.
* UDD and CMSIS-core removed from package. Now these are delivered as separate libraries.
* Added cy_toolchain_init() call into the startup code as required by the CLib FreeRTOS Support Library.

## Updated personalities

All clock personalities - clock accuracy parameter added.
I2C, UART - imposing restrictions on data connections to accept pins only.
Pin - expanded connectivity and settings for Hardware Controlled pin mode.
FDIVCLK - Updated to properly handle XMC1x00 devices which have no clock doubler block.

## Supported Software and Tools

This version of the XMCLib was validated for compatibility with the following Software and Tools:

| Software and Tools                                                            | Version |
| :---                                                                          | :----   |
| ModusToolbox&trade;                                                           |  3.0.0  |
| [core library](https://github.com/Infineon/core-lib)                          |  1.3.1  |
| [device-db](https://github.com/Infineon/device-db)                            |  4.0.2  |
| CMSIS-Core(M)                                                                 |  5.8.0  |
| GCC Compiler                                                                  | 10.3.1  |

## More information

Use the following links for more information, as needed:

* [XMCLib README](./README.md)
* [XMCLib for XMC1000 API Reference Manual](https://infineon.github.io/mtb-xmclib-cat3/xmc1_api_reference_manual/html/index.html)
* [XMCLib for XMC4000 API Reference Manual](https://infineon.github.io/mtb-xmclib-cat3/xmc4_api_reference_manual/html/index.html)
* [ModusToolbox Software Environment, Quick Start Guide, Documentation, and Videos](https://www.infineon.com/cms/en/design-support/tools/sdk/modustoolbox-software/)
* [ModusToolbox Device Configurator Tool Guide](https://www.cypress.com/ModusToolboxDeviceConfig)
* [Infineon XMC microcontrollers](https://www.infineon.com/cms/en/product/microcontroller/32-bit-industrial-microcontroller-based-on-arm-cortex-m/)
* [XMC1000 Family technical documentation](https://www.infineon.com/cms/en/product/microcontroller/32-bit-industrial-microcontroller-based-on-arm-cortex-m/32-bit-xmc1000-industrial-microcontroller-arm-cortex-m0/#!documents)
* [XMC4000 Family technical documentation](https://www.infineon.com/cms/en/product/microcontroller/32-bit-industrial-microcontroller-based-on-arm-cortex-m/32-bit-xmc4000-industrial-microcontroller-arm-cortex-m4/#!documents)

---
© Infineon Technologies, 2020-2022.
