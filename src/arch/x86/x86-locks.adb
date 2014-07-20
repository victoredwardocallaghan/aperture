--
-- Copyright (C) 2014 Edward O'Callaghan <eocallaghan@alterapraxis.com>
--

with System.Machine_Code;

package body x86.Locks is

  type Spin_Lock_Type is
    record
      Locked : Aperture.Byte;
    end record;

  Lock : Spin_Lock_Type;

  --
  --
  procedure x86_Spin_Lock
  is
    Result : Aperture.Byte;
  begin
    loop
      System.Machine_Code.Asm
        (Template => "mov $1, %%eax; lock xchgl %%eax, (%%edx); pause",
         Outputs  => (Aperture.Byte'Asm_Output ("=a", Result)),
         Inputs   => (System.Address'Asm_Input ("d", Lock.Locked'Address)));

      if Result = 0 then
         exit;
      end if;
    end loop;
  end x86_Spin_Lock;

  --
  --
  procedure x86_Unlock
  is
  begin
    System.Machine_Code.Asm
      (Template => "movq $0, %0",
       Outputs  => (Aperture.Byte'Asm_Output ("=m", Lock.Locked)),
       Volatile => True);
  end x86_Unlock;

begin
  Lock.Locked := 0;

end x86.Locks;
