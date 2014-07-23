--
--  Copyright (C) 2014 Edward O'Callaghan <eocallaghan@alterapraxis.com>
--

with Aperture.Text_IO;
with Aperture.Version;

package body CAR_Main_Entry is

   package Debug renames Aperture.Text_IO;

  --
  --  This is called by cache_as_ram.inc as the chosen entry point from CAR !!!
   procedure Cache_As_RAM_Main (Bist               : Aperture.Word32;
                                CPU_Init_DetectEDX : Aperture.Word32) is
   begin
      Debug.Put_Line (Item => "Booting *** Aperture *** firmware "
                     & Aperture.Version.Version_String & " ("
                     & Standard'Compiler_Version & ").");

    --
    --  Do stuff???

      Debug.Put_Line (Item => "<*> Bist = " & Aperture.Word32'Image (Bist));

      Debug.Put_Line (Item => "<> CPU_Init_DetectEDX = "
                     & Aperture.Word32'Image (CPU_Init_DetectEDX));

   end Cache_As_RAM_Main;

end CAR_Main_Entry;
