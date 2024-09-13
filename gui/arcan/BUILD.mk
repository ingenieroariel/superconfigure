
ARCAN_SRC := https://github.com/ingenieroariel/arcan/archive/heads/arcanflake.tar.gz 
ARCAN_DEPS := gui/SDL2 lib/freetype cosmo-repo/base
ARCAN_BINS := arcan

$(eval $(call DOWNLOAD_SOURCE,gui/arcan,$(ARCAN_SRC)))
$(eval $(call SPECIFY_DEPS,gui/arcan,$(ARCAN_DEPS)))

o/gui/arcan/configured.x86_64: CONFIG_COMMAND = $(BASELOC)/gui/arcan/config-wrapper
o/gui/arcan/configured.aarch64: CONFIG_COMMAND = $(BASELOC)/gui/arcan/config-wrapper
o/gui/arcan/built.x86_64: BUILD_COMMAND = ninja -j$(MAXPROC)
o/gui/arcan/built.aarch64: BUILD_COMMAND = ninja -j$(MAXPROC)

o/gui/arcan/installed.x86_64: INSTALL_COMMAND = ninja install
o/gui/arcan/installed.aarch64: INSTALL_COMMAND = ninja install

o/gui/arcan/built.fat: BINS = $(ARCAN_BINS)
