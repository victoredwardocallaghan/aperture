--
--  Copyright (C) 2014 Edward O'Callaghan <eocallaghan@alterapraxis.com>
--

with X86.IO;

  --  Receive a byte from a given port.
  --  Send a byte to a given port.
  --  Send a 16bit word to a given port
package Aperture.IO renames X86.IO;
