--
--  Copyright (C) 2014 Edward O'Callaghan <eocallaghan@alterapraxis.com>
--

--with Aperture.Text_IO;
with Aperture.Version;

-- XXX
with Aperture.Console;
with Aperture.Console_Serial;

package body CAR_Main_Entry is

   --
   --  Connects Text_IO to Serial Console output
   --
   package Debug is new Aperture.Console
     (Initialise      => Aperture.Console_Serial.Init,
      Output_New_Line => Aperture.Console_Serial.New_Line,
      Output_Char     => Aperture.Console_Serial.Put_Char);
   -- package Debug renames Aperture.Text_IO;

  --
  --  This is called by cache_as_ram.inc as the chosen entry point from CAR !!!
   procedure Cache_As_RAM_Main (Bist               : Aperture.Word32;
                                CPU_Init_DetectEDX : Aperture.Word32) is
   begin
      Debug.Init;
      Debug.Put_Line (Item => "Booting *** Aperture *** firmware "
                     & Aperture.Version.Version_String & " ("
                     & Standard'Compiler_Version & ").");

    --
    --  Do stuff???

--      Debug.Put_Line (Item => "<*> Bist = " & Aperture.Word32'Image (Bist));
--
--      Debug.Put_Line (Item => "<> CPU_Init_DetectEDX = "
--                     & Aperture.Word32'Image (CPU_Init_DetectEDX));

   end Cache_As_RAM_Main;

end CAR_Main_Entry;
