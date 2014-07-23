--
-- Copyright (C) 2014 Edward O'Callaghan <eocallaghan@alterapraxis.com>
--

package CAR_Main_Entry is

  --
  -- This is called by cache_as_ram.inc as the chosen entry point from CAR !!!
  procedure Cache_As_RAM_Main (Bist               : in Aperture.Word32;
                               CPU_Init_DetectEDX : in Aperture.Word32);
  --
  pragma Export (C, CAR_Main_Entry, "cache_as_ram_main");

end CAR_Main_Entry;
