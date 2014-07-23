PACKAGE = cpu

VERSION_SPEC = ../common/aperture-version.ads
VERSION      = $(GIT_REV)
GIT_REV      = $(shell git describe --always --dirty="-UNCLEAN")

include ../Makeconf

all: $(OBJ_DIR)/$(PACKAGE)

$(VERSION_SPEC):
	@echo "package Aperture.Version is"             > $@
	@echo "   Version_String : constant String :=" >> $@
	@echo "     \"$(VERSION)\";"                   >> $@
	@echo "end Aperture.Version;"                  >> $@


$(OBJ_DIR)/$(PACKAGE): $(VERSION_SPEC)
	gprbuild $(BUILD_OPTS) -P $(PACKAGE)

clean:
	rm -rf $(OBJ_DIR)
