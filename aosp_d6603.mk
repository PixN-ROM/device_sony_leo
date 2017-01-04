# Copyright 2014 The Android Open Source Project
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

TARGET_KERNEL_CONFIG := aosp_shinano_leo_defconfig
TARGET_KERNEL_SOURCE := kernel/sony/msm_leo


# Inherit from those products. Most specific first.
$(call inherit-product, device/sony/leo/device.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, vendor/google/products/gms.mk)
$(call inherit-product, vendor/addons/config.mk)

# Include custom telephony configuration
include vendor/pixN/configs/custom_phone.mk

PRODUCT_NAME := aosp_d6603
PRODUCT_DEVICE := leo
PRODUCT_MODEL := Xperia Z3 (AOSP)
PRODUCT_BRAND := Sony
PRODUCT_MANUFACTURER := Sony

# Additional apps
PRODUCT_PACKAGES += \
    masquerade \
    AOSPLinks \
    VanillaMusic \
    KernelAdiutor \
    OmniGears \
    Busybox 

# DU Utils Library
PRODUCT_BOOT_JARS += \
    org.dirtyunicorns.utils

# DU Utils Library
PRODUCT_PACKAGES += \
org.dirtyunicorns.utils

# Google Inclusions
GAPPS_INCLUDED_PACKAGES += \
    Keep \
    NewsWidget

# Google Exclusions
GAPPS_EXCLUDED_PACKAGES += \
    Hangouts \
    YouTube \
    Photos  \
    Music

# AICP packages
#PRODUCT_PACKAGES += \
AicpExtras 

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.debuggable=1

# TWRP Recovery
DEVICE_RESOLUTION := 1440x814
TW_THEME := portrait_hdpi
TW_IGNORE_ABS_MT_TRACKING_ID := true

# F2FS Support
PRODUCT_PACKAGES += \
    mkfs.f2fs \
    fsck.f2fs \
    fibmap.f2fs

# QCOM Flag
QCOM_HARDWARE := true

# DEXPREOPT
WITH_DEXPREOPT := true