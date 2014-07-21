--
-- Copyright (C) 2014 Edward O'Callaghan <eocallaghan@alterapraxis.com>
--

with Aperture;

package x86.IO is

  --
  -- Receive a byte from a given port.
  procedure Inb (Port : in Aperture.Word16; Value : out Aperture.Byte);

  --
  -- Send a byte to a given port.
  procedure Outb (Port : in Aperture.Word16; Value : in Aperture.Byte);

  --
  -- Send a 16bit word to a given port
  procedure Outw (Port : in Aperture.Word16; Value : in Aperture.Word16);

end x86.IO;
