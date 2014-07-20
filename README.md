Aperture
========

High assurance implementation of firmware.

The implementation is split into three main components and one shim component:

 1.) bootblock
 2.) rom stage
 3.) ram stage
 4.) loader shim

## Bootblock

The bootblock is just enough machine assembler needed to bring the hardware up
sufficiently for the entry point of romstage to be executed.

## Rom Stage

The romstage is reasonable for the configuration of GPIO’s, possibly Super
I/O’s and the UART to gain serial diagnostic output. The romstage component
runs without access to main system memory yet and so jumps to the ramstage
component to initialise that.

## Ram Stage

Preforms system memory controller initialisation and training so that main
memory can be accessible and addressable in the usual way by the system CPU.

## Loader Shim

Provides enough runtime resources to execute a given loader such as, GRUB,
Linux and so on.
