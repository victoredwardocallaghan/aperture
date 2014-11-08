--
--  Copyright (C) 2014 Edward O'Callaghan <eocallaghan@alterapraxis.com>
--

package body Aperture is

   --
   --
   function Bit_Test (Value : Word64; Pos : Word64_Pos)
     return Boolean is
      Mask : Word64;
   begin
      Mask := 2**Natural (Pos);
      return ((Value and Mask) /= 0);
   end Bit_Test;

   --
   --
   procedure Bit_Set (Value : in out Word64; Pos : Word64_Pos) is
   begin
      Value := Value or (2**Natural (Pos));
   end Bit_Set;

   --
   --
   procedure Bit_Clear (Value : in out Word64; Pos : Word64_Pos) is
      Mask : Word64;
   begin
      Mask := not (2**Natural (Pos));
      Value := Value and Mask;
   end Bit_Clear;

end Aperture;
