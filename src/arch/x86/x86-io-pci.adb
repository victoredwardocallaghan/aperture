--
-- Copyright (C) 2014 Edward O'Callaghan <eocallaghan@alterapraxis.com>
--

-- FIXME: Todo..

package body x86.IO.PCI is

  --
  -- Generic functions for PCI 'ported' I/O operations
  --

  function PCI_IO_Read8 (Port : in Aperture.Word16; Where : in Aperture.Byte)
    return Aperture.Byte
  is
  begin
    null;
  end PCI_IO_Read8;
-- {
-- 	unsigned addr;
-- #if !CONFIG_PCI_IO_CFG_EXT
-- 	addr = (dev>>4) | where;
-- #else
-- 	addr = (dev>>4) | (where & 0xff) | ((where & 0xf00)<<16); //seg == 0
-- #endif
-- 	outl(0x80000000 | (addr & ~3), 0xCF8);
-- 	return inb(0xCFC + (addr & 3));
-- }

  function PCI_IO_Read16 (Port : in Aperture.Word16; Where : in Aperture.Byte)
    return Aperture.Word16
  is
  begin
    null;
  end PCI_IO_Read16;
-- {
-- 	unsigned addr;
-- #if !CONFIG_PCI_IO_CFG_EXT
--         addr = (dev>>4) | where;
-- #else
--         addr = (dev>>4) | (where & 0xff) | ((where & 0xf00)<<16);
-- #endif
-- 	outl(0x80000000 | (addr & ~3), 0xCF8);
-- 	return inw(0xCFC + (addr & 2));
-- }

  function PCI_IO_Read32 (Port : in Aperture.Word16; Where : in Aperture.Byte)
    return Aperture.Word32
  is
  begin
    null;
  end PCI_IO_Read32;
-- {
-- 	unsigned addr;
-- #if !CONFIG_PCI_IO_CFG_EXT
--         addr = (dev>>4) | where;
-- #else
--         addr = (dev>>4) | (where & 0xff) | ((where & 0xf00)<<16);
-- #endif
-- 	outl(0x80000000 | (addr & ~3), 0xCF8);
-- 	return inl(0xCFC);
-- }


  procedure PCI_IO_Write8 (Port  : in Aperture.Word16;
                           Where : in Aperture.Byte;
                           Value : in Aperture.Byte)
  is
  begin
    null;
  end PCI_IO_Write8;
-- {
-- 	unsigned addr;
-- #if !CONFIG_PCI_IO_CFG_EXT
--         addr = (dev>>4) | where;
-- #else
--         addr = (dev>>4) | (where & 0xff) | ((where & 0xf00)<<16);
-- #endif
-- 	outl(0x80000000 | (addr & ~3), 0xCF8);
-- 	outb(value, 0xCFC + (addr & 3));
-- }

  procedure PCI_IO_Write16 (Port  : in Aperture.Word16;
                            Where : in Aperture.Byte;
                            Value : in Aperture.Word16)
  is
  begin
    null;
  end PCI_IO_Write16;
-- {
--         unsigned addr;
-- #if !CONFIG_PCI_IO_CFG_EXT
--         addr = (dev>>4) | where;
-- #else
--         addr = (dev>>4) | (where & 0xff) | ((where & 0xf00)<<16);
-- #endif
--         outl(0x80000000 | (addr & ~3), 0xCF8);
--         outw(value, 0xCFC + (addr & 2));
-- }

  procedure PCI_IO_Write32 (Port  : in Aperture.Word16;
                            Where : in Aperture.Byte;
                            Value : in Aperture.Word32)
  is
  begin
    null;
  end PCI_IO_Write32;
-- {
-- 	unsigned addr;
-- #if !CONFIG_PCI_IO_CFG_EXT
--         addr = (dev>>4) | where;
-- #else
--         addr = (dev>>4) | (where & 0xff) | ((where & 0xf00)<<16);
-- #endif
-- 	outl(0x80000000 | (addr & ~3), 0xCF8);
-- 	outl(value, 0xCFC);
-- }

end x86.IO.PCI;
