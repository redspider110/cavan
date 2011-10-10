MAKEFILE_VERSIONS = $(OUT_LIBRARY)/version.mk
MAKEFILE_NAMES = $(OUT_LIBRARY)/name.mk
MAKEFILE_DEPENDS = $(OUT_LIBRARY)/depend.mk
XML_CONFIG = $(BUILD_LIBRARY)/config.xml

PKG_CONFIG_LIBDIR = $(SYSROOT_PATH)/usr/lib/pkgconfig

export PKG_CONFIG_LIBDIR

include $(MAKEFILE_DEFINES)

all: $(MARK_LIBRARY_READY)
	$(Q)echo "Library compile successfull"

$(MARK_LIBRARY_READY):
	$(Q)python $(PYTHON_PARSER) -m $(MARK_LIBRARY) -f install_library -v $(MAKEFILE_VERSIONS) -n $(MAKEFILE_NAMES) -d $(MAKEFILE_DEPENDS) $(XML_CONFIG)
	$(Q)+make -f $(MAKEFILE_INSTALL) VERSION_MK=$(MAKEFILE_VERSIONS) NAME_MK=$(MAKEFILE_NAMES) DEPEND_MK=$(MAKEFILE_DEPENDS)
	$(call generate_mark)