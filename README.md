# ZYNQ Time-to-digital converter
High-resolution time-to-digital converter in the Red Pitaya Zynq-7010 SoC

**Performance**\
Core frequency: 350 MHz\
No. of delay line taps: 192 (configurable)\
Time resolution per channel: >11 ps\
Accuracy: <10 ppm\
DNL: -1 to +4.5 LSB\
INL: +0.5 to +8.5 LSB\
Measurement range: 47.9 ms\
Dead time: ~14 ns\
Max speed: ~70 MS/s

**FILES**

*TDC*\
Main project, containing the design of an AXI TDC core. Uses VHDL source files and 3 Vivado-configured Xilinx IPs (BRAM, BRAM Controller, AXI GPIO).\
Requires "MyPkg.vhd" to be included.

*AXI_TDC_IP*\
Vivado-created temporary project, used for packaging the TDC into an IP core.

*TDCsystem*\
Top level block design containing the Zynq PS and multiple TDC cores.\
Clocking: AXI interconnect expects 100 MHz. This is raised by MMCME to 350 MHz for the TDC cores.\
External ports: hit signal for each TDC channel.\
Module "testUnit" is a square wave generator for testing and can be removed.\
11-bit "trigger" signals on TDC channel IPs are optional and can be left unconnected. Used for inter-channel (START-STOP) measurements.\
A TDC channel core has a generic number of taps in the delay line, which must be a multiple of 12. Default is 192.

**EXTRA**
-> MyPkg.vhd
-> TDCServer2.c : Linux-based C program for the Zynq ARM core. Communicates with the TDC channels via "mmap" system call. Addresses are set in the Addres Editor of the TDCsystem project.
-> PLclock script: Contains bash commands for lowering the PL clock frequency from 125 to 100 MHz. Has to be executed before TDC implementation.
