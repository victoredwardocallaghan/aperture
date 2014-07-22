OUTPUT_FORMAT("elf32-i386", "elf32-i386", "elf32-i386")
OUTPUT_ARCH(i386)

MEMORY {
	rom : ORIGIN = 0xffff0000, LENGTH = 64K
}

TARGET(binary)
SECTIONS
{

	/* Allocation reserves extra 16 bytes here. Alignment requirements
	 * may cause the total size of a section to change when the start
	 * address gets applied.
	 */
	ROMLOC_MIN = 0xffffff00 - (_erom - _rom + 16) - 4096;

	/* Symbol ap_sipi_vector must be aligned to 4kB to start AP CPUs
	 * with Startup IPI message without RAM.
	 */
	.bogus ROMLOC_MIN : {
		. = ALIGN(4096);
		ROMLOC = .;
	} >rom = 0xff

	/* This section might be better named .setup */
	.rom ROMLOC : {
		_rom = .;
		*(.text);
		*(.data);
		*(.data.*);
		*(.rodata.*);
		_erom = .;
	} >rom = 0xff

	/DISCARD/ : {
		*(.comment)
		*(.note)
		*(.comment.*)
		*(.note.*)
		*(.iplt)
		*(.rel.*)
		*(.igot.*)
	}
}

INCLUDE "16bit/entry16.lds"
INCLUDE "16bit/reset16.lds"
