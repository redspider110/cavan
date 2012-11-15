LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

BRCM_ANDROID_PATH = 3rdparty/bluetooth/BRCM4330_BT/special/android
BRCM_ADPT_PATH = $(BRCM_ANDROID_PATH)/hardware/broadcom/bt/adaptation

LOCAL_CFLAGS =
LOCAL_C_INCLUDES = \
			$(BRCM_ADPT_PATH)/btl-if/client \
			$(BRCM_ADPT_PATH)/btl-if/include \
			$(BRCM_ADPT_PATH)/dtun/include \
			$(BRCM_ADPT_PATH)/include

LOCAL_STATIC_LIBRARIES =
LOCAL_SHARED_LIBRARIES = \
	libfmservice \
	libbluedroid

LOCAL_SRC_FILES := \
	brcm_fmtest.c

LOCAL_MODULE = brcm_fmtest
LOCAL_MODULE_TAGS = optional

include $(BUILD_EXECUTABLE)

