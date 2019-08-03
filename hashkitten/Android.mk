LOCAL_PATH := $(call my-dir)

include $(CLEAN_VARS)
LOCAL_MODULE := libsodium
LOCAL_EXPORT_C_INCLUDES := ../libsodium/libsodium-android-$(_TARGET_ARCH)/include
LOCAL_SRC_FILES := ../libsodium/libsodium-android-$(_TARGET_ARCH)/lib/libsodium.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAN_VARS)
LOCAL_MODULE := hashkitten
LOCAL_MODULE_FILENAME := hashkitten
LOCAL_SRC_FILES += main.c
LOCAL_CPPFLAGS := -Wall
LOCAL_STATIC_LIBRARIES := libsodium
include $(BUILD_EXECUTABLE)
