--
--  Copyright (C) 2014 Edward O'Callaghan <eocallaghan@alterapraxis.com>
--

with System.Machine_Code;
with Aperture; use Aperture;

package body X86.CPU is

   --
   --
   procedure Cli is
   begin
      System.Machine_Code.Asm
        (Template => "cli",
         Volatile => True);
   end Cli;

   --
   --
   procedure CPUID
     (EAX : in out Aperture.Word32;
      EBX :    out Aperture.Word32;
      ECX : in out Aperture.Word32;
      EDX :    out Aperture.Word32) is
   begin
      System.Machine_Code.Asm
        (Template => "cpuid",
         Inputs   => (Aperture.Word32'Asm_Input  ("a",  EAX),
                      Aperture.Word32'Asm_Input  ("c",  ECX)),
         Outputs  => (Aperture.Word32'Asm_Output ("=a", EAX),
                      Aperture.Word32'Asm_Output ("=b", EBX),
                      Aperture.Word32'Asm_Output ("=c", ECX),
                      Aperture.Word32'Asm_Output ("=d", EDX)),
         Volatile => True);
   end CPUID;

   --
   --
   procedure Halt is
   begin
      System.Machine_Code.Asm
        (Template => "hlt",
         Volatile => True);
   end Halt;

   --
   --
   procedure Sti is
   begin
      System.Machine_Code.Asm
         (Template => "sti",
          Volatile => True);
   end Sti;

   --
   --
   procedure Lidt (Address : Aperture.Word64) is
   begin
      System.Machine_Code.Asm
         (Template => "lidt (%0)",
          Inputs   => (Aperture.Word64'Asm_Input ("r", Address)),
          Volatile => True);
   end Lidt;

   --
   --
   procedure Panic is
   begin
      System.Machine_Code.Asm
        (Template => "ud2",
         Volatile => True);
   end Panic;

   -------------------------------------------
   --  The following (MSR) functions require the always_inline due
   --  to AMD
   --  function STOP_CAR_AND_CPU that disables cache as
   --  ram, the cache as ram stack can no longer be used. Called
   --  functions must be inlined to avoid stack usage. Also, the
   --  compiler must keep local variables register based and not
   --  allocated them from the stack. With gcc 4.5.0, some functions
   --  declared as inline are not being inlined. This patch forces
   --  these functions to always be inlined by adding the qualifier
   --  __attribute__((always_inline)) to their declaration.
   -------------------------------------------

   --
   --
   function Get_MSR64 (Register : Aperture.Word32)
     return Aperture.Word64 is
      MSR : MSR_Type;
   begin
      Get_MSR (Register => Register,
               MSR      => MSR);
      return 2**32 * Aperture.Word64 (MSR.High) +
                     Aperture.Word64 (MSR.Low);
   end Get_MSR64;

   --
   --
   procedure Get_MSR
      (Register :     Aperture.Word32;
       MSR      : out MSR_Type) is
   begin
      System.Machine_Code.Asm
        (Template => "rdmsr",
         Inputs   => (Aperture.Word32'Asm_Input ("c", Register)),
         Outputs  => (Aperture.Word32'Asm_Output ("=d", MSR.High),
                      Aperture.Word32'Asm_Output ("=a", MSR.Low)),
         Volatile => True);
   end Get_MSR;

   --
   --
   procedure Write_MSR64
      (Register : Aperture.Word32;
       Value    : Aperture.Word64) is
      MSR : MSR_Type;
   begin
      MSR.Low  := Aperture.Word32'Mod (Value);
      MSR.High := Aperture.Word32'Mod (Value / 2 ** 32);

      Write_MSR (Register => Register,
                 MSR      => MSR);
   end Write_MSR64;

   --
   --
   procedure Write_MSR
      (Register : Aperture.Word32;
       MSR      : out MSR_Type) is
   begin
      System.Machine_Code.Asm
         (Template => "wrmsr",
          Inputs   => (Aperture.Word32'Asm_Input ("a", MSR.Low),
                       Aperture.Word32'Asm_Input ("d", MSR.High),
                       Aperture.Word32'Asm_Input ("c", Register)),
          Volatile => True);
   end Write_MSR;

   procedure Boot_CPU (BSP : out Boolean) is
      MSR : MSR_Type;
   begin
      Get_MSR (Register => 16#1b#, MSR => MSR);
      BSP := (MSR.Low and 16#80#) /= 0;
   end Boot_CPU;

end X86.CPU;
