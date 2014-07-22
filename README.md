Aperture
========

High assurance implementation of firmware.

The implementation is split into three main components and one shim component:

1. bootblock
2. rom stage
3. ram stage
4. loader shim

## Bootblock

The bootblock is just enough machine assembler needed to bring the hardware up
sufficiently for the entry point of romstage to be executed.

The following shows the first-light hot path:

    >>> hw wakes up in 16 bit real mode ---> src/cpu/x86/16bit
                                                         |
         +----------------<------------------------------+ /entry16.inc
         |                                                 /reset16.inc
         v
         /-- hw is put into 32 bit protected mode --> src/cpu/x86/32bit
                                                      /entry32.inc

After the CPU is running in 32 bit protected mode we setup the CPU cache as as
a kind of ‘RAM’, known as ‘CAR’ or ‘Cache As RAM’. This allows us to have
enough of a execution enviroment to implement the rest of the romstage using a
high-level language such as Ada.

### AMD CAR implementation

This is described in BKDG under ‘general storage’.

Typically we need to:

1. turn on caching (in CR)
2. set up WB region at "random addr"
3. write to "random addr" something
4. use it

However, we need to switch off various speculative features via special MSR’s
in order to avoid cache evictions due to processor speculation.

One can check for evictions using performance counters as there are events for
L1->L2 and L2->RAM (which should not happen). The random addr needs to be
something which is fine for cache architecture it depends on if you plan to use
L1 or L2. Note that the AMD cache is exclusive.

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
