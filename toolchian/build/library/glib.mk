include $(MAKEFILE_DEFINES)

all:
	sed 's/\s*\(as_fn_error\)\s*(\s*)\s*$$/&\n{\n\treturn 0\n}\n\1_bak()/g' configure -i
	glib_cv_uscore=yes \
	ac_cv_func_posix_getpwuid_r=yes \
	cp $$(find $(SYSROOT_PATH)/usr/lib find -maxdepth 2 -type d -name include) $(SYSROOT_PATH)/usr -av
	./configure $(LIBRARY_COMMON_CONFIG) --prefix=/usr --with-sysroot=$(SYSROOT_PATH) --enable-shared --enable-static
	+make
	$(call install_to_sysroot)