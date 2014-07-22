--
-- Copyright (C) 2014 Edward O'Callaghan <eocallaghan@alterapraxis.com>
--

with Aperture.HW_IO; use Aperture.HW_IO;

package body x86.IO.PNP is

  procedure PNP_Write (Port : Aperture.Word16;
                       Register : Aperture.Byte;
                       Value : Aperture.Byte)
  is
  begin
    Outb (Port => Port, Value => Register);
    Outb (Port => (Port + 1), Value => Value);
  end PNP_Write;

  function PNP_Read (Port : Aperture.Word16;
                     Register : Aperture.Byte) return Byte
  is
    Data : Aperture.Byte;
  begin
    Outb (Port => Port, Value => Register);
    Inb (Port => (Port + 1), Value => Data);
    return Data;
  end PNP_Read;

  procedure PNP_Set_Logical_Device (Port : in Aperture.Word16)
  is
  begin
    PNP_Write (Port => Port, Index => 16#07#, Value => (Port and 16#ff#));
  end PNP_Set_Logical_Device;

  procedure PNP_Set_Enable (Port : in Aperture.Word16; Toggle : in Boolean)
  is
  begin
    PNP_Write (Port => Port, Index => 16#30#, Value => Toogle);
  end PNP_Set_Enable;

  function PNP_Is_Enabled (Port : in Aperture.Word16) return Boolean
  is
    Value : Aperture.Byte;
  begin
    Value := PNP_Read (Port => Port, Index => 16#30#);
    return (Value /= 0);
  end PNP_Is_Enabled;

  procedure PNP_Set_IOBase (Port   : in Aperture.Word16;
                            Index  : in Aperture.Byte;
                            IOBase : in Aperture.Word16)
  is
  begin
    PNP_Write (Port => Port, Index => Index, Value => (Shift_Right(IOBase, 8) and 16#ff#));
    PNP_Write (Port => Port, Index => (Index + 1), Value => (IOBase and 16#ff#));
  end PNP_Set_IOBase;

  procedure PNP_Set_IRQ (Port  : in Aperture.Word16;
                         Index : in Aperture.Byte;
                         IRQ   : in Aperture.Byte)
  is
  begin
    PNP_Write (Port => Port, Index => Index, Value => IRQ);
  end PNP_Set_IRQ;

  procedure PNP_Set_DRQ (Port  : in Aperture.Word16;
                         Index : in Aperture.Byte;
                         DRQ   : in Aperture.Byte)
  is
  begin
    PNP_Write (Port => Port, Index => Index, Value => (DRQ and 16#ff#));
  end PNP_Set_DRQ;

end x86.IO.PNP;
