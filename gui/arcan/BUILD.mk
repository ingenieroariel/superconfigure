
ARCAN_SRC := https://github.com/ingenieroariel/arcan/archive/heads/arcanflake.tar.gz 
ARCAN_CONFIG_ARGS = -DCMAKE_INSTALL_PREFIX=$$(COSMOS)\
    -DBUILD_SHARED_LIBS=OFF\
    -DCMAKE_C_FLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,gui/arcan,$(ARCAN_SRC)))
$(eval $(call CMAKE_BUILD,gui/arcan,$(ARCAN_CONFIG_ARGS),$(ARCAN_CONFIG_ARGS)))

o/gui/arcan/built.fat: BINS = arcan
