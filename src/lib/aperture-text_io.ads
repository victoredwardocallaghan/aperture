--
--  Copyright (C) 2014 Edward O'Callaghan <eocallaghan@alterapraxis.com>
--

with Aperture.Console;
with Aperture.Console_Serial;

--
--  Connects Text_IO to Serial Console output
--
package Aperture.Text_IO is new Aperture.Console
  (Initialise      => Aperture.Console_Serial.Init,
   Output_New_Line => Aperture.Console_Serial.New_Line,
   Output_Char     => Aperture.Console_Serial.Put_Char);
--
--  Remark:
--  This mapping should be compile-time configurable and thus generated.
