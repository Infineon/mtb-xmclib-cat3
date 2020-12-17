== INTRODUCTION ==

This is Early Access Software for XMC devices in ModusToolbox. This software
is made available for evaluation purposes only and is not recommended for
production development.

The XMC Peripheral Library (XMC Lib) consists of low-level drivers for the XMC product family peripherals.
It addition the Cortex Microcontroller Software Interface Standard (CMSIS) is included.
CMSIS provides a hardware abstraction layer for the Cortex-M processor series.
XMC Lib is built on top of CMSIS.

The following tool chains are supported:
- GNU GCC for ARM (gcc)

The following 32-Bit Industrial Microcontrollers based on ARM Cortex are supported:
- XMC4800 series
- XMC4700 series
- XMC4500 series
- XMC4400 series
- XMC4300 series
- XMC4200 series
- XMC4100 series
- XMC1400 series
- XMC1300 series
- XMC1200 series
- XMC1100 series

== USAGE ==

Several examples for the supported tool chains are provided that can serve as starting point.

To start a project from scratch follow the steps:
1. Copy the CMSIS, XMClib and Newlib folders into your project.
3. Add the following folders into the include paths of your project:
   - ${ProjName}/XMCLib/inc
   - ${ProjName}/CMSIS/Include
   - ${ProjName}/CMSIS/Infineon/XMC4400_series/Include
4. Select the device for which your compiling defining a preprocessor symbol, i.e. XMC4500_F144x1024
5. Include into your source the header files of the peripherals you want to use, i.e. #include "xmc_vadc.h"
6. Configure the peripheral and make use of the APIs described in the documentation.
