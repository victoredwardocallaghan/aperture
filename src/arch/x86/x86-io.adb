--
-- Copyright (C) 2014 Edward O'Callaghan <eocallaghan@alterapraxis.com>
--

--
-- NOTICE: Machine specific implementation is non-portable! As such, this
-- implementation detail should be compile-time conditional depending on
-- target ISA.
--
with System.Machine_Code;

with Aperture; use Aperture;

package body x86.IO is

  --
  --
  procedure Inb (Port : in Aperture.Word16; Value : out Aperture.Byte)
  is
  begin
    System.Machine_Code.Asm
      (Template => "inb %1, %0",
       Inputs   => (Word16'Asm_Input ("d", Port)),
       Outputs  => (Byte'Asm_Output ("=a", Value)),
       Volatile => True);
  end Inb;

  --
  --
  procedure Outb (Port : in Aperture.Word16; Value : in Aperture.Byte)
  is
  begin
    System.Machine_Code.Asm
      (Template => "outb %0, %1",
       Inputs => (Byte'Asm_Input ("a", Value), Word16'Asm_Input ("d", Port)),
       Volatile => True);
  end Outb;

  --
  --
  procedure Outw (Port : in Aperture.Word16; Value : in Aperture.Word16)
  is
  begin
    System.Machine_Code.Asm
      (Template => "outw %0, %1",
       Inputs => (Word16'Asm_Input ("a", Value),
                  Word16'Asm_Input ("d", Port)),
       Volatile => True);
  end Outw;

end x86.IO;
