# MTB CAT3 XMC Library v4.5.0

Please refer to the [README](./README.md) and the XMCLib for [XMC1000](https://infineon.github.io/mtb-xmclib-cat3/xmc1_api_reference_manual/html/index.html)/[XMC4000](https://infineon.github.io/mtb-xmclib-cat3/xmc4_api_reference_manual/html/index.html) API Reference Manual for a complete description.

## What Changed?
- The two new memory variants (with 128 and 200 kB of flash) are added for XMC1100 device

### Updated personalities

- WTD 1.0 - fixed configurational structure upper/lower bound settings code generation.
- GPDMA-CH 1.0 and WTD 1.0 - updated extern function generation.
- PIN 1.0 - updated to prohibit GPIO functions configuration for ECAT personality in the mtb-xmc-ecat.
- CCU8 1.0 - fixed an issue with Multi-Channel Control parameter.
- ERU-OGU 1.0 - fixed the problem with non-availability signals.
- POSIF 1.0 - fixed an issue with Multi-Channel Pattern Update Set. 

### New personalities

- SPI 2.0 - In the new version was fixed an issue with an option to configure more than one slave select output.

### Updated drivers

- ETH_MAC - fixed a bug with incorrect address return in the XMC_ETH_MAC_GetAddress function. 

## Supported Software and Tools

This version of the XMCLib was validated for compatibility with the following Software and Tools:

| Software and Tools                                                            | Version |
| :---                                                                          | :----   |
| ModusToolbox&trade;                                                           |  3.4.0  |
| [core library](https://github.com/Infineon/core-lib)                          |  1.4.3  |
| [device-db](https://github.com/Infineon/device-db)                            |  4.21.0 |
| CMSIS-Core(M)                                                                 |  5.8.2  |
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
© Infineon Technologies, 2020-2025.
