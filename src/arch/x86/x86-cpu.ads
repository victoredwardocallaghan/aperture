--
--  Copyright (C) 2014 Edward O'Callaghan <eocallaghan@alterapraxis.com>
--

with Aperture;

package x86.CPU is

   --
   --  CPU specific constants

   --  Flags
   RFLAGS_CF_FLAG               : constant := 0;
   RFLAGS_ZF_FLAG               : constant := 6;
   RFLAGS_IF_FLAG               : constant := 9;

   CR0_PE_FLAG                  : constant := 0;
   CR0_PG_FLAG                  : constant := 0;

   CPUID_FEATURE_LOCAL_APIC     : constant := 9;
   CPUID_FEATURE_X2APIC         : constant := 21;

   --  MSR's
   IA32_APIC_BASE               : constant := 16#1b#;
   IA32_FEATURE_CONTROL         : constant := 16#3a#;
   IA32_PMC0                    : constant := 16#c1#;
   IA32_PMC1                    : constant := 16#c2#;
   IA32_PMC2                    : constant := 16#c3#;
   IA32_PMC3                    : constant := 16#c4#;
   IA32_PMC4                    : constant := 16#c5#;
   IA32_PMC5                    : constant := 16#c6#;
   IA32_PMC6                    : constant := 16#c7#;
   IA32_PMC7                    : constant := 16#c8#;
   IA32_PERFEVTSEL0             : constant := 16#186#;
   IA32_PERFEVTSEL1             : constant := 16#187#;
   IA32_PERFEVTSEL2             : constant := 16#188#;
   IA32_PERFEVTSEL3             : constant := 16#189#;
   IA32_MISC_ENABLE             : constant := 16#1a0#;
   IA32_EFER                    : constant := 16#c000_0080#;
   IA32_KERNEL_GSBASE           : constant := 16#c000_0102#;

   --
   --  CPU specific registers.
   type CPU_Registers_Type is
     record
       RAX : Aperture.Word64;
       RBX : Aperture.Word64;
       RCX : Aperture.Word64;
       RDX : Aperture.Word64;
       RDI : Aperture.Word64;
       RSI : Aperture.Word64;
       RBP : Aperture.Word64;
       R08 : Aperture.Word64;
       R09 : Aperture.Word64;
       R10 : Aperture.Word64;
       R11 : Aperture.Word64;
       R12 : Aperture.Word64;
       R13 : Aperture.Word64;
       R14 : Aperture.Word64;
       R15 : Aperture.Word64;
     end record;

   Null_CPU_Regs : constant CPU_Registers_Type;

   type MSR_Type is private;

   --  Size of one page (4K)
   Page_Size : constant := 4096;

   --
   --  Clear Interrupt Flag.
   procedure Cli;
   pragma Inline_Always (Cli);

   --
   --  Execute CPUID instruction.
   procedure CPUID
     (EAX : in out Aperture.Word32;
      EBX :    out Aperture.Word32;
      ECX : in out Aperture.Word32;
      EDX :    out Aperture.Word32);
   pragma Inline_Always (CPUID);

   --
   --  Halt the CPU.
   procedure Halt;
   pragma Inline_Always (Halt);

   --  Set Interrupt Flag.
   procedure Sti;
   pragma Inline_Always (Sti);

   --  Load Interrupt Descriptor Table (IDT) register.
   procedure Lidt (Address : Aperture.Word64);
   pragma Inline_Always (Lidt);

   --
   --  Panic.
   procedure Panic;
   pragma Inline_Always (Panic);

   --
   --  Return current value of given model specific register.
   function Get_MSR64 (Register : Aperture.Word32) return Aperture.Word64;
   pragma Inline_Always (Get_MSR64);

   --
   --  Return value of given MSR as low/high doublewords.
   procedure Get_MSR
     (Register :     Aperture.Word32;
      MSR      : out MSR_Type);
   pragma Inline_Always (Get_MSR);

   --
   --  Write specified quadword to given MSR.
   procedure Write_MSR64
     (Register : Aperture.Word32;
      Value    : Aperture.Word64);
   pragma Inline_Always (Write_MSR64);

   --
   --  Write specified low/high doublewords to given MSR.
   procedure Write_MSR
     (Register : Aperture.Word32;
      MSR      : MSR_Type);
   pragma Inline_Always (Write_MSR);

   --
   --  ..
   procedure Boot_CPU (BSP : out Boolean);
   pragma Inline_Always (Boot_CPU);

private

   Null_CPU_Regs : constant CPU_Registers_Type := CPU_Registers_Type'
     (RAX => 0,
      RBX => 0,
      RCX => 0,
      RDX => 0,
      RDI => 0,
      RSI => 0,
      RBP => 0,
      R08 => 0,
      R09 => 0,
      R10 => 0,
      R11 => 0,
      R12 => 0,
      R13 => 0,
      R14 => 0,
      R15 => 0);

   --
   --
   type MSR_Type is
     record
       Low  : Aperture.Word32;
       High : Aperture.Word32;
     end record;

end x86.CPU;
