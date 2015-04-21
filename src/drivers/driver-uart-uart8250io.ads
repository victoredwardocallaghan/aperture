--
--  Copyright (C) 2014 Edward O'Callaghan <eocallaghan@alterapraxis.com>
--

package Driver.UART.UART8250IO is

   --
   --  Generic driver to support 8250, 16450, 16550, 16550A type UART's.
   --

   --  Initialise the serial port.
   procedure Init;

   --  Write a new line and linefeed.
   procedure New_Line;

   --  Write a character.
   procedure Put_Char (Item : Character);

private

   --
   --  Special serial constants.

   --  Control
   UART_IER         : constant := 16#01#;
   UART_FCR         : constant := 16#02#;
   UART_FCR_FIFO_EN : constant := 16#01#;
   UART_MCR         : constant := 16#04#;
   UART_MCR_DTR     : constant := 16#01#; -- DTR
   UART_MCR_RTS     : constant := 16#02#; -- RTS
   UART_LCR         : constant := 16#03#;
   UART_LCR_DLAB    : constant := 16#80#; -- Divisor latch access bit
   UART_DLL         : constant := 16#00#;
   UART_DLM         : constant := 16#01#;

   --  Status
   UART_LSR         : constant := 16#05#;
   UART_LSR_THRE    : constant := 16#20#; -- Xmit holding register empty
   UART_LSR_TEMP    : constant := 16#40#; -- Xmitter empty
   UART_TBR         : constant := 16#00#; -- Data

end Driver.UART.UART8250IO;
