--
-- Copyright (C) 2014 Edward O'Callaghan <eocallaghan@alterapraxis.com>
--

with Aperture.IO;
with x86.IO;

--
-- Connects HW_IO to the ISA specific implementation
--
package Aperture.HW_IO renames Aperture.IO;

--
-- Remark: This mapping should be compile-time configurable and thus generated.
--
