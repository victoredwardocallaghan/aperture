--
--  Copyright (C) 2014 Edward O'Callaghan <eocallaghan@alterapraxis.com>
--

with Aperture;

package x86.IO is

   --
   --  Receive a byte from a given port.
   procedure Inb (Port : Aperture.Word16; Value : out Aperture.Byte);

   --
   --  Send a byte to a given port.
   procedure Outb (Port : Aperture.Word16; Value : Aperture.Byte);

   --
   --  Send a 16bit word to a given port
   procedure Outw (Port : Aperture.Word16; Value : Aperture.Word16);

end x86.IO;
