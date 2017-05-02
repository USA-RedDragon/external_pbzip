# Copyright (C) 2017 Jacob McSwain
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)

pbzip_cflags := \
    -O3 \
    -D_POSIX_PTHREAD_SEMANTICS \
    -std=c++98

pbzip_files := \
    pbzip2.cpp \
    BZ2StreamScanner.cpp \
    ErrorContext.cpp

include $(CLEAR_VARS)
LOCAL_MODULE := pbzip
LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/sbin
LOCAL_C_INCLUDES += \
    $(LOCAL_PATH) \
    external/bzip2

LOCAL_CPPFLAGS += $(pbzip_cflags)
LOCAL_SRC_FILES := $(pbzip_files)
LOCAL_SHARED_LIBRARIES := libc
LOCAL_STATIC_LIBRARIES := libbz
LOCAL_POST_INSTALL_CMD := \
    $(hide) mkdir -p $(TARGET_RECOVERY_ROOT_OUT)/sbin && \
    ln -sf pbzip $(TARGET_RECOVERY_ROOT_OUT)/sbin/pbunzip && \
    ln -sf pbzip $(TARGET_RECOVERY_ROOT_OUT)/sbin/pbzcat
include $(BUILD_EXECUTABLE)
