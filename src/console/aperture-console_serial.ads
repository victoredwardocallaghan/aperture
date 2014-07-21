--
-- Copyright (C) 2014 Edward O'Callaghan <eocallaghan@alterapraxis.com>
--

with Driver.UART.UART8250IO;

  --
  -- Serial UART call outs to the actual device driver operations
  --
  package Aperture.Console_Serial renames Driver.UART.UART8250IO;

--
-- Remark: This mapping should be compile-time configurable and thus generated.
--
