#
# Copyright (C) 2009 The Android Open Source Project
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
#

PRODUCT_PROPERTY_OVERRIDES :=
    ro.media.dec.jpeg.memcap=20000000

DEVICE_PACKAGE_OVERLAYS := device/htc/passion-common/overlay

#Get ENG stuff on our userdebug builds
# Turn on checkjni for non-user builds.
ADDITIONAL_BUILD_PROPERTIES += ro.kernel.android.checkjni=1
# Set device insecure for non-user builds.
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0
# Allow mock locations by default for non user builds
ADDITIONAL_DEFAULT_PROPERTIES += ro.allow.mock.location=1
# Disable visual strict mode, even on eng builds
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.sys.strictmode.visual=0

# Market Fix
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=passion BUILD_ID=GRK39F BUILD_FINGERPRINT=google/passion/passion:2.3.6/GRK39F/189904:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.3.6 GRK39F 189904 release-keys"

# Extra RIL settings
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.enable.managed.roaming=1 \
    ro.ril.oem.nosim.ecclist=911,112,999,000,08,118,120,122,110,119,995 \
    ro.ril.emc.mode=2

#Mod version
PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=Prerelease-Alpha-CyanogenMod-9-$(shell date +%m%d%Y)-drewis-N1-KANG

PRODUCT_COPY_FILES := \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/passion-common/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_PACKAGES := \
    sensors.mahimahi \
    lights.mahimahi \
    librs_jni \
    gps.mahimahi \
    libOmxCore \
    libOmxVidEnc \
    com.android.future.usb.accessory \
    audio.a2dp.default \
    audio.primary.qsd8k \
    audio_policy.qsd8k \
    gralloc.qsd8k \
    hwcomposer.default \
    Stk
#    copybit.qsd8k \

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Passion uses high-density artwork where available
PRODUCT_LOCALES := hdpi

PRODUCT_COPY_FILES += \
    device/htc/passion-common/mahimahi-keypad.kl:system/usr/keylayout/mahimahi-keypad.kl \
    device/htc/passion-common/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/passion-common/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    device/htc/passion-common/vold.fstab:system/etc/vold.fstab


PRODUCT_COPY_FILES += \
    device/htc/passion-common/bcm4329.ko:system/lib/modules/bcm4329.ko

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/htc/passion-common/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product-if-exists, vendor/htc/passion-common/passion-vendor.mk)

# media profiles and capabilities spec
$(call inherit-product, device/htc/passion-common/media_a1026.mk)

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

# Include GSM stuff
#$(call inherit-product, device/htc/passion-common/cm/gsm.mk)

