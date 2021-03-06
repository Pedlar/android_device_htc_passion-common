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
# Product-specific compile-time definitions.
#

TARGET_BOOTLOADER_BOARD_NAME := mahimahi

TARGET_NO_BOOTLOADER := true

#QSD8250
TARGET_BOARD_PLATFORM := qsd8k
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi

# Neon stuff
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true

# FPU compilation flags #Taken from crespo. Should I be using them?
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WLAN_DEVICE           := bcm4329
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcm4329.bin"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcm4329_apsta.bin"
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/vendor/firmware/fw_bcm4329.bin nvram_path=/proc/calibration"
WIFI_DRIVER_MODULE_NAME     := "bcm4329"

##For when wifi is upgraded
## Connectivity - Wi-Fi
#BOARD_WPA_SUPPLICANT_DRIVER := NL80211
#WPA_SUPPLICANT_VERSION      := VER_0_8_X
#BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
#BOARD_HOSTAPD_DRIVER        := NL80211
#BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
#BOARD_WLAN_DEVICE           := bcmdhd
#BOARD_WLAN_DEVICE_REV       := bcm4329
#WIFI_DRIVER_MODULE_NAME     := "bcmdhd"
#WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
#WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcmdhd.bin"
#WIFI_DRIVER_FW_PATH_P2P     := "/vendor/firmware/fw_bcmdhd_p2p.bin"
#WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcmdhd_apsta.bin"

BOARD_USES_GENERIC_AUDIO := false

# Kernel
BOARD_KERNEL_CMDLINE := no_console_suspend=1 wire.search_count=5
BOARD_KERNEL_BASE := 0x20000000
BOARD_KERNEL_NEW_PPPOX := true

BOARD_USE_KINETO_COMPATIBILITY := true
BOARD_VENDOR_QCOM_AMSS_VERSION := 3200
BOARD_VENDOR_USE_AKMD := akm8973

## Hardware rendering
## doesn't actually work until we have hwcomposer
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/htc/passion-common/egl.cfg
##for rmcc egl hack
COMMON_GLOBAL_CFLAGS += \
    -DMISSING_EGL_EXTERNAL_IMAGE \
    -DMISSING_EGL_PIXEL_FORMAT_YV12 \
    -DMISSING_GRALLOC_BUFFERS
#    -DFORCE_EGL_CONFIG=0x9
##for hashcode egl hack
#BOARD_NO_RGBX_8888 := true
#BOARD_USES_OVERLAY := true
#COMMON_GLOBAL_CFLAGS += -DBOARD_GL_OES_EGL_IMG_EXTERNAL_HACK

BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
#TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true
#TARGET_USES_OLD_LIBSENSORS_HAL:=true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# FM
BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

# GPS HAL
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := mahimahi
# AMSS version to use for GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 3200

# # cat /proc/mtd #AOSP                 # # cat /proc/mtd #CM7
# dev:    size   erasesize  name        # dev:    size   erasesize  name
# mtd0: 000e0000 00020000 "misc"        # mtd0: 000e0000 00020000 "misc"
# mtd1: 00500000 00020000 "recovery"    # mtd1: 00400000 00020000 "recovery"
# mtd2: 00280000 00020000 "boot"        # mtd2: 00380000 00020000 "boot"
# mtd3: 07800000 00020000 "system"      # mtd3: 09100000 00020000 "system"
# mtd4: 07800000 00020000 "cache"       # mtd4: 05f00000 00020000 "cache"
# mtd5: 0c440000 00020000 "userdata"    # mtd5: 0c440000 00020000 "userdata"
# mtd6: 00200000 00020000 "crashdata"

#TARGET_USERIMAGES_USE_EXT4 := true #not sure about this yet
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00300000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00400000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 230686720 #0x09000000 #0x08400000 #expanding for ics
BOARD_USERDATAIMAGE_PARTITION_SIZE := 209715200 #0x0c440000
BOARD_FLASH_BLOCK_SIZE := 4096 #131072 default seemed too high

TARGET_RELEASETOOLS_EXTENSIONS := device/htc/common
