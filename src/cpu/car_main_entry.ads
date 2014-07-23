--
--  Copyright (C) 2014 Edward O'Callaghan <eocallaghan@alterapraxis.com>
--

with Aperture;

package CAR_Main_Entry is

  --
  --  This is called by cache_as_ram.inc as the chosen entry point from CAR !!!
   procedure Cache_As_RAM_Main (Bist               : Aperture.Word32;
                                CPU_Init_DetectEDX : Aperture.Word32);
   --
   pragma Export (C, Cache_As_RAM_Main, "cache_as_ram_main");
   pragma Inline_Always (Cache_As_RAM_Main);

end CAR_Main_Entry;
