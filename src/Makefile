include Makeconf

all: aperture.rom

utils:
	$(MAKE) -C ../utils/cbfstool

rts:
	$(MAKE) -C $@

cpu:
	$(MAKE) -C $@

aperture.rom: utils rts cpu

clean:
	$(MAKE) clean -C cpu
	$(MAKE) clean -C rts

.PHONY: rts cpu aperture.rom
