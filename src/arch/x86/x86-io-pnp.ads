--
-- Copyright (C) 2014 Edward O'Callaghan <eocallaghan@alterapraxis.com>
--

package x86.IO.PNP is

  --
  -- Generic functions for PNP devices
  --

  procedure PNP_Write (Port : in Aperture.Word16;
                       Register : in Aperture.Byte;
                       Value : in Aperture.Byte);
  pragma Inline_Always (PNP_Write);

  function PNP_Read (Port : in Aperture.Word16;
                     Register : in Aperture.Byte) return Byte;
  pragma Inline_Always (PNP_Read);

  procedure PNP_Set_Logical_Device (Port : in Aperture.Word16);
  pragma Inline_Always (PNP_Set_Logical_Device);

  procedure PNP_Set_Enable (Port : in Aperture.Word16; Toggle : in Boolean);
  pragma Inline_Always (PNP_Set_Enable);

  function PNP_Is_Enabled (Port : in Aperture.Word16) return Boolean;
  pragma Inline_Always (PNP_Is_Enabled);

  procedure PNP_Set_IOBase (Port   : in Aperture.Word16;
                            Index  : in Aperture.Byte;
                            IOBase : in Aperture.Word16);
  pragma Inline_Always (PNP_Set_IOBase);

  procedure PNP_Set_IRQ (Port  : in Aperture.Word16;
                         Index : in Aperture.Byte;
                         IRQ   : in Aperture.Byte);
  pragma Inline_Always (PNP_Set_IRQ);

  procedure PNP_Set_DRQ (Port  : in Aperture.Word16;
                         Index : in Aperture.Byte;
                         DRQ   : in Aperture.Byte);
  pragma Inline_Always (PNP_Set_DRQ);

end x86.IO.PNP;
--
-- REMARKS: This /should be/ devicetree driven instead of passing parameters.
