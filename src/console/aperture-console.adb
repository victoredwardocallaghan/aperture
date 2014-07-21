--
-- Copyright (C) 2014 Edward O'Callaghan <eocallaghan@alterapraxis.com>
--

package body Aperture.Console is

  --
  --
  procedure Init
  is
  begin
    Initialise;
  end Init;

  --
  --
  procedure New_Line
  is
  begin
    Output_New_Line;
  end New_Line;

  --
  --
  procedure Put_Char (Item : Character)
  is
  begin
    Output_Char (Item => Item);
  end Put_Char;

  --
  --
  procedure Put_Line (Item : String)
  is
  begin
    Put_String (Item => Item);
    New_Line;
  end Put_Line;

  --
  --
  procedure Put_String (Item : String)
  is
  begin
    for I in Item'Range loop
      Put_Char (Item => Item (I));
    end loop;
  end Put_String;

  --
  -- XXX..

end Aperture.Console;
