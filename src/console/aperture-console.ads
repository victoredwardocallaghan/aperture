--
-- Copyright (C) 2014 Edward O'Callaghan <eocallaghan@alterapraxis.com>
--

--
-- These generic components are output device specific.
-- As an example, console_serial.ads provides the concrete
-- implementation for a hardware UART.
--
generic

   -- Implementation of the console initialisation operation.
   with procedure Initialise;

   -- Implementation of the new line output operation.
   with procedure Output_New_Line;

   -- Implementation of the character output operation.
   with procedure Output_Char (Item : Character);

package Aperture.Console is

  --
  -- Initialise the console.
  -- XXX: we should not need to ever call this directly, this
  -- package should internally workout if init should be called
  -- for the first time and just do it..
  procedure Init;

  --
  -- Output a new line.
  procedure New_Line;

  --
  -- Output a given character
  procedure Put_Char (Item : Character);

  --
  -- Output a given string and append a new line.
  procedure Put_Line (Item : String);

  --
  -- Output a given string.
  procedure Put_String (Item : String);

  --
  -- TODO: procedures for printing Byte/Word16,Word32,Word64
  -- should this be a single polymorphic procedure, can that be done?

end Aperture.Console;
