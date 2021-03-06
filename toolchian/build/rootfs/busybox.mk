BUSYBOX_OPTION = CONFIG_PREFIX=$(ROOTFS_PATH)
CONFIG_FILE_PATH = $(BUILD_ROOTFS)/busybox_config
CONFIG_FILE_NAME = cavan_defconfig

all:
	$(Q)cp $(CONFIG_FILE_PATH) configs/$(CONFIG_FILE_NAME) -av
	$(Q)+sb2 make $(CONFIG_FILE_NAME)
	$(Q)+sb2 make $(BUSYBOX_OPTION) install
