include Makeconf

all: aperture.rom

rts:
	$(MAKE) -C $@

cpu:
	$(MAKE) -C $@

aperture.rom: rts cpu

clean:
	$(MAKE) clean -C cpu
	$(MAKE) clean -C rts

.PHONY: rts cpu aperture.rom
