#
# Copyright (C) 2013 The Android Open Source Project
# Copyright (C) 2013 Óliver García Albertos (oliverarafo@gmail.com)
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

TARGET_SPECIFIC_HEADER_PATH := device/samsung/golden/include
TARGET_OTA_ASSERT_DEVICE := golden,i8190,GT-I8190
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-linux-androideabi-
# Board
TARGET_BOOTLOADER_BOARD_NAME := DB8520H
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
BOARD_USES_STE_HARDWARE := true

# Platform 
TARGET_BOARD_PLATFORM := montblanc
TARGET_SOC := u8500
BOARD_GLOBAL_CFLAGS += -DSTE_HARDWARE -DSTE_SAMSUNG_HARDWARE

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a9
TARGET_CPU_SMP := true
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
ARCH_ARM_HAVE_NEON := true
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-linux-androideabi-
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp

# Partitions
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1258291200
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5064605696
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true

# Kernel
TARGET_KERNEL_CONFIG := golden_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/golden
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048

# External apps on SD
TARGET_EXTERNAL_APPS = sdcard1

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := device/samsung/golden

# Ramdisk
TARGET_PROVIDES_ENVIRON_RC := true

# Graphics
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/samsung/golden/configs/lib/egl/egl.cfg
BOARD_EGL_NEEDS_FNW := true
BOARD_EGL_NEEDS_HANDLE_VALUE := true
BOARD_GLOBAL_CFLAGS += -DFORCE_SCREENSHOT_CPU_PATH -DTARGET_NEEDS_HWC_V0
BOARD_EGL_WORKAROUND_BUG_10194508 := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
TARGET_REQUIRES_SYNCHRONOUS_SETSURFACE := true
TARGET_NUPLAYER_CANNOT_SET_SURFACE_WITHOUT_A_FLUSH := true
#NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
BOARD_USES_LEGACY_ACQUIRE_WVM := true

# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Screen
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# Wifi
BOARD_WLAN_DEVICE := bcmdhd
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P := "/system/etc/wifi/bcmdhd_p2p.bin"
WIFI_DRIVER_MODULE_NAME := "dhd"
WIFI_DRIVER_MODULE_ARG := "firmware_path=/system/etc/wifi/bcmdhd_sta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_DRIVER_MODULE_AP_ARG := "firmware_path=/system/etc/wifi/bcmdhd_apsta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
BOARD_NO_APSME_ATTR := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/golden/bluetooth
BOARD_CUSTOM_BT_CONFIG := device/samsung/golden/bluetooth/vnd_golden.txt

# RIL
BOARD_RIL_CLASS := ../../../device/samsung/golden/ril/
BOARD_GLOBAL_CFLAGS += -DSAMSUNG_PROPRIETARY_RIL_WORKAROUND
#BOARD_PROVIDES_LIBRIL := true
#BOARD_PROVIDES_RILD := true

# Browser
ENABLE_WEBGL := true

# Audio
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_LEGACY_ALSA_AUDIO := true
BOARD_GLOBAL_CFLAGS += -DMR0_AUDIO_BLOB -DMR1_AUDIO_BLOB -DBOARD_CANT_REALLOCATE_OMX_BUFFERS
BOARD_HAVE_PRE_KITKAT_AUDIO_BLOB := true
BOARD_HAVE_PRE_KITKAT_AUDIO_POLICY_BLOB := true
AUDIO_FEATURE_DISABLED_DS1_DOLBY_DDP := true
USE_LEGACY_AUDIO_POLICY := 1
BOARD_USES_LEGACY_MMAP := true

# Vold
BOARD_VOLD_MAX_PARTITIONS := 25
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
TARGET_USES_EXFAT := true

# libutils
BOARD_GLOBAL_CFLAGS += -DREFBASE_JB_MR1_COMPAT_SYMBOLS

#libbinder
BOARD_GLOBAL_CFLAGS += -DDISABLE_ASHMEM_TRACKING

#init
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging


# Charging mode
#BOARD_LPM_BOOT_ARGUMENT_NAME := lpm_boot
#BOARD_LPM_BOOT_ARGUMENT_VALUE := 1
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_SHOW_PERCENTAGE := true
#BACKLIGHT_PATH := "/sys/devices/platform/pri_bl_ktd253/backlight/panel/brightness"
#BACKLIGHT_PATH := "/sys/devices/platform/mcde_disp_s6e63m0_dsi.0/backlight/panel/brightness"
BACKLIGHT_PATH := /sys/class/backlight/panel/brightness
CHARGING_ENABLED_PATH := /sys/class/power_supply/battery/batt_lp_charging

# Needed for blobs
BOARD_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL

# Recovery
#RECOVERY_VARIANT := twrp
BOARD_UMS_LUNFILE := "/sys/devices/platform/musb-ux500.0/musb-hdrc/gadget/lun0/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/musb-ux500.0/musb-hdrc/gadget/lun%d/file"
TARGET_RECOVERY_FSTAB := device/samsung/golden/rootdir/fstab.samsunggolden
BOARD_HAS_NO_MISC_PARTITION := true

BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
BOARD_SUPPRESS_EMMC_WIPE := true
RECOVERY_FSTAB_VERSION := 2
#BOARD_RECOVERY_NEEDS_REL_INPUT := true
BOARD_HAS_DOWNLOAD_MODE := true

# TWRP Recovery defines
DEVICE_RESOLUTION := 480x800
TW_THEME := portrait_mdpi
TARGET_RECOVERY_FORCE_PIXEL_FORMAT := RGB_565
TARGET_USERIMAGES_USE_EXT4 := true
RECOVERY_SDCARD_ON_DATA := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_NO_USB_STORAGE := true
TW_BRIGHTNESS_PATH := "/sys/devices/platform/pri_bl_ktd253/backlight/panel/brightness"
TW_MAX_BRIGHTNESS := 255
TW_INCLUDE_CRYPTO_SAMSUNG := true
TW_INCLUDE_CRYPTO := true
TW_CRYPTO_FS_TYPE := "ext4"
TW_CRYPTO_REAL_BLKDEV := "/dev/block/mmcblk0p25"
TW_CRYPTO_MNT_POINT := "/data"
TW_CRYPTO_FS_OPTIONS := "noatime,nosuid,nodev,discard,noauto_da_alloc,journal_async_commit,errors=panic    wait,check"
TW_CRYPTO_FS_FLAGS := "0x00000406"
TW_CRYPTO_KEY_LOC := "footer"

# SELinux
#BOARD_SEPOLICY_DIRS += \
#	device/samsung/golden/sepolicy

#USE_CLANG_PLATFORM_BUILD = false 

BLOCK_BASED_OTA := false
KERNEL_HAS_FINIT_MODULE := false
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
BOARD_GLOBAL_CFLAGS += -DSTE_SCREEN_RECORD -DTARGET_LEGACY_CAMERA_HAL1
KERNEL_MISSING_CLOCK_BOOTTIME_ALARM := true
#WITH_CM_CHARGER := false

# Bionic
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
