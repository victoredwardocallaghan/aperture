--
-- Copyright (C) 2014 Edward O'Callaghan <eocallaghan@alterapraxis.com>
--

with Aperture.IO;
with x86.IO;

--
-- Connects HW_IO to the ISA specific implementation
--
package Aperture.HW_IO is new Aperture.IO
  (Inb   => x86.IO.Inb,
   Outb  => x86.IO.Outb,
   Outw  => x86.IO.Outw);

--
-- Remark: This mapping should be compile-time configurable and thus generated.
--
