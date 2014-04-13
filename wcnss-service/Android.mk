ifneq (,$(filter arm aarch64 arm64, $(TARGET_ARCH)))
LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := wcnss_service
LOCAL_C_INCLUDES += $(TARGET_OUT_HEADERS)/common/inc/
LOCAL_SRC_FILES := wcnss_service.c
LOCAL_SHARED_LIBRARIES := libc libcutils libutils liblog
ifneq ($(QCPATH),)
ifeq ($(strip $(TARGET_USES_QCOM_WCNSS_QMI)),true)
ifeq ($(TARGET_USES_WCNSS_MAC_ADDR_REV),true)
LOCAL_CFLAGS += -DWCNSS_QMI_MAC_ADDR_REV
endif
LOCAL_CFLAGS += -DWCNSS_QMI
LOCAL_C_INCLUDES += $(TARGET_OUT_HEADERS)/qmi-framework/inc
LOCAL_C_INCLUDES += $(TARGET_OUT_HEADERS)/qmi/services
LOCAL_C_INCLUDES += $(TARGET_OUT_HEADERS)/qmi/platform
LOCAL_C_INCLUDES += $(TARGET_OUT_HEADERS)/qmi/inc
LOCAL_SRC_FILES += wcnss_qmi_client.c
LOCAL_SHARED_LIBRARIES += libqmiservices libqmi_cci
LOCAL_C_INCLUDES += $(TARGET_OUT_HEADERS)/libmdmdetect/inc
LOCAL_SHARED_LIBRARIES += libmdmdetect
endif #TARGET_USES_QCOM_WCNSS_QMI
endif #QCPATH
LOCAL_CFLAGS += -DDYNAMIC_NV
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS += -Wall -Werror
include $(BUILD_EXECUTABLE)
endif
