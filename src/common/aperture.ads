--
--  Copyright (C) 2014 Edward O'Callaghan <eocallaghan@alterapraxis.com>
--

--
--  Package provides common types and procedures to manipulate bit level data.
--

package Aperture is

   --
   --

   type Byte is mod 2**8;
   for Byte'Size use 8;

   type Word16 is mod 2**16;
   for Word16'Size use 16;

   type Word32 is mod 2**32;
   for Word32'Size use 32;

   type Word64 is mod 2**64;
   for Word64'Size use 64;

   type Word64_Pos is range 0 .. 63;

   --  Test if bit at a given position is set.
   function Bit_Test (Value : Word64; Pos : Word64_Pos) return Boolean;

   --  Set bit at a given position.
   procedure Bit_Set (Value : in out Word64; Pos : Word64_Pos);

   --  Clear bit at a given position.
   procedure Bit_Clear (Value : in out Word64; Pos : Word64_Pos);

end Aperture;
