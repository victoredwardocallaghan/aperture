--
-- Copyright (C) 2014 Edward O'Callaghan <eocallaghan@alterapraxis.com>
--

with Aperture; use Aperture;
with Aperture.IO; use Aperture.IO;

package body Driver.UART.UART8250IO is

  --
  -- Generic driver to support 8250, 16450, 16550, 16550A type UART's.
  --

  ----------------------------------------------------------------------
  --
  -- UART configuration details..

  -- FIXME typing??
  -- Base addresses
  -- type Bases is (0x3f8, 0x2f8, 0x3e8, 0x2e8);
  Base : constant := 16#3f8#; -- Bases[idx]

  -- Speed
  BaudRate_Default : constant := 115200;

  -- Nominal values
  BaudRate_ReferenceClock     : constant := 115200;
  BaudRate_Oversample         : constant := 1;

  -- Calculate divisor. Do not floor but round to nearest integer.
  function BaudRate_Divisor (BaudRate   : Integer;
                             RefClk     : Integer;
                             Oversample : Integer) return Integer
  is
  begin
    return (1 + (2 * RefClk) / (BaudRate * Oversample)) / 2;
  end BaudRate_Divisor;
  ----------------------------------------------------------------------

  ----------------------------------------------------------------------

  -- Expected character delay at 1200bps is 9ms for a working UART
  -- and no flow-control. Assume UART as stuck if shift register
  -- or FIFO takes more than 50ms per character to appear empty.
  --
  -- Estimated that inb() from UART takes 1 microsecond.
  SingleCharTimeout : constant := 50 * 1000;
  FIFOTimeout       : constant := 16 * SingleCharTimeout;

   --  Return True if the send buffer is empty.
  function UART8250_Can_Tx_Byte (Base_Port : Word16) return Boolean;

  function UART8250_Can_Tx_Byte (Base_Port : Word16) return Boolean
  is
    Data : Aperture.Byte;
  begin
    Inb(Port => Base_Port + UART_LSR, Value => Data);
    return (Data and UART_LSR_THRE) /= 0;
  end UART8250_Can_Tx_Byte;

  procedure UART8250_Tx_Byte (Base_Port : Word16; Data : Character)
  is
    Tick : Integer := SingleCharTimeout;
  begin
    while (Tick /= 0) and not UART8250_Can_Tx_Byte (Base_Port)
      loop
        Outb (Port => Base_Port + UART_TBR, Value => Character'Pos(Data));
        Tick := Tick - 1;
    end loop;
  end UART8250_Tx_Byte;

  procedure UART8250_Tx_Flush (Base_Port : Word16)
  is
    Tick : Integer := FIFOTimeout;
    Result : Aperture.Byte;
  begin
    loop
      Inb(Port => Base_Port + UART_LSR, Value => Result);
      exit when not (Tick and (Result and UART_LSR_TEMP));
      Tick := Tick - 1;
    end loop;
  end UART8250_Tx_Flush;

  procedure UART8250_UART_Init (Base_Port : Integer; Divisor : Integer)
  is
  begin
    -- Disable interrupts.
    Outb(Port => (Base_Port + UART_IER), Value => 16#00#);

    -- Enable FIFOs
    Outb(Port => (Base_Port + UART_FCR), Value => UART_FCR_FIFO_EN);

    -- Assert DTR and RTS so the other end is happy
    Outb(Port => (Base_Port + UART_MCR), Value => (UART_MCR_DTR or UART_MCR_RTS));

    -- DLAB on
    Outb(Port => (Base_Port + UART_LCR), Value => UART_LCR_DLAB);

    -- Set Baud Rate Divisor. 12 ==> 9600 Baud
    Outb(Port => (Base_Port + UART_DLL), Value => (Divisor and 16#FF#));
    Outb(Port => (Base_Port + UART_DLM), Value => (Shift_Right(Divisor, 8) and 16#FF#));

    -- Set to 3 for 8N1
    Outb(Port => (Base_Port + UART_LCR), Value => 16#03#);
  end UART8250_UART_Init;
  ----------------------------------------------------------------------

  ----------------------------------------------------------------------

  -- Initialise the serial port.
  procedure Init
  is
    Div  : Integer;
  begin
    Div := BaudRate_Divisor (BaudRate_Default,
                             BaudRate_ReferenceClock,
                             BaudRate_Oversample);
    UART8250_UART_Init (Base_Port => Base, Divisor => Div);
  end Init;

  -- Write a new line and linefeed.
  procedure New_Line
  is
  begin
    Put_Char (Item => Character'Val (10));
  end New_Line;

  -- Write a character.
  procedure Put_Char (Item : Character)
  is
  begin
    UART8250_Tx_Byte (Base_Port => Base, Data => Item);
    UART8250_Tx_Flush (Base_Port => Base);
  end Put_Char;
  ----------------------------------------------------------------------

end Driver.UART.UART8250IO;
