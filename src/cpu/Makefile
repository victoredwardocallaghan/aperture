PACKAGE = cpu

VERSION_SPEC = ../common/aperture-version.ads
VERSION      = $(GIT_REV)
GIT_REV      = $(shell git describe --always --dirty="-UNCLEAN")

include ../Makeconf

BUILD_OPTS += --RTS=$(TOP_DIR)/rts/obj

OBJCOPY = objcopy
CBFSTOOL = ../../utils/cbfstool/cbfstool
OUTROM=aperture.rom
SIZE=2048

all: $(OBJ_DIR)/$(PACKAGE)

$(VERSION_SPEC):
	@echo "package Aperture.Version is"             > $@
	@echo "   Version_String : constant String :=" >> $@
	@echo "     \"$(VERSION)\";"                   >> $@
	@echo "end Aperture.Version;"                  >> $@


$(OBJ_DIR)/$(PACKAGE): $(VERSION_SPEC)
	gprbuild $(BUILD_OPTS) -P $(PACKAGE)
	$(OBJCOPY) -O binary $(OBJ_DIR)/bootblock.elf $(OBJ_DIR)/bootblock.bin
	$(CBFSTOOL) $(OUTROM) create -s $(SIZE)K -B $(OBJ_DIR)/bootblock.bin -a 64 -m x86 -o 0
	$(CBFSTOOL) $(OUTROM) print

clean:
	rm -rf $(OBJ_DIR)
