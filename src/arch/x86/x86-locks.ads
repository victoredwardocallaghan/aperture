--
-- Copyright (C) 2014 Edward O'Callaghan <eocallaghan@alterapraxis.com>
--

package x86.Locks is

   --  Spin until lock is acquired.
   procedure x86_Spin_Lock;

   --  Unlock.
   procedure x86_Unlock;

end x86.Locks;
