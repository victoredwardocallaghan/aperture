--
-- Copyright (C) 2014 Edward O'Callaghan <eocallaghan@alterapraxis.com>
--

package x86.IO.PCI is

  --
  -- Generic functions for PCI 'ported' I/O operations
  --

  function PCI_IO_Read8 (Port : in Aperture.Word16; Where : in Aperture.Byte)
    return Aperture.Byte;
  pragma Inline_Always (PCI_IO_Read8);

  function PCI_IO_Read16 (Port : in Aperture.Word16; Where : in Aperture.Byte)
    return Aperture.Word16;
  pragma Inline_Always (PCI_IO_Read16);

  function PCI_IO_Read32 (Port : in Aperture.Word16; Where : in Aperture.Byte)
    return Aperture.Word32;
  pragma Inline_Always (PCI_IO_Read32);


  procedure PCI_IO_Write8 (Port  : in Aperture.Word16;
                           Where : in Aperture.Byte;
                           Value : in Aperture.Byte);
  pragma Inline_Always (PCI_IO_Write8);

  procedure PCI_IO_Write16 (Port  : in Aperture.Word16;
                            Where : in Aperture.Byte;
                            Value : in Aperture.Word16);
  pragma Inline_Always (PCI_IO_Write16);

  procedure PCI_IO_Write32 (Port  : in Aperture.Word16;
                            Where : in Aperture.Byte;
                            Value : in Aperture.Word32);
  pragma Inline_Always (PCI_IO_Write32);

end x86.IO.PCI;
--
-- NOTES: romstage and bootblock should compile with the following mappings:
--
-- #if !CONFIG_MMCONF_SUPPORT_DEFAULT
-- #define pci_read_config8 	pci_io_read_config8
-- #define pci_read_config16	pci_io_read_config16
-- #define pci_read_config32	pci_io_read_config32
--
-- #define pci_write_config8 	pci_io_write_config8
-- #define pci_write_config16	pci_io_write_config16
-- #define pci_write_config32	pci_io_write_config32
-- #endif
