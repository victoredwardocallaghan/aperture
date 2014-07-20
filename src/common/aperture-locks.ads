--
-- Copyright (C) 2014 Edward O'Callaghan <eocallaghan@alterapraxis.com>
--

generic

  --  Spin until lock is acquired.
  with procedure Spin_Lock;

  --  Unlock.
  with procedure Unlock;
