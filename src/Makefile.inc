VERSION_SPEC = common/aperture-version.ads
VERSION      = $(GIT_REV)
GIT_REV      = $(shell git describe --always --dirty="-UNCLEAN")


$(VERSION_SPEC):
	@echo "package Aperture.Version is"             > $@
	@echo "   Version_String : constant String :=" >> $@
	@echo "     \"$(VERSION)\";"                   >> $@
	@echo "end Aperture.Version;"                  >> $@
