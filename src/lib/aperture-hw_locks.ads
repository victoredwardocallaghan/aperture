--
-- Copyright (C) 2014 Edward O'Callaghan <eocallaghan@alterapraxis.com>
--

with Aperture.Locks;
with x86.Locks;

--
-- Connects HW_Locks to the ISA specific implementation
--
package Aperture.HW_Locks is new Aperture.Locks
  (Spin_Lock => x86.Locks.x86_Spin_Lock,
   Unlock    => x86.Locks.x86_Unlock);

--
-- Remark: This mapping should be compile-time configurable and thus generated.
--
