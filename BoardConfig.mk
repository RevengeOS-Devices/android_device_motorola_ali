#
# Copyright (C) 2016 The CyanogenMod Project
#               2017 The LineageOS Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

BOARD_VENDOR := motorola-qcom
PLATFORM_PATH := device/motorola/griffin
TARGET_SPECIFIC_HEADER_PATH := $(PLATFORM_PATH)/include

# OTA
TARGET_OTA_ASSERT_DEVICE := griffin,griffin_cn,sheridan,xt1650,xt1650-01,xt1650-03,xt1650-05

# Platform
TARGET_BOARD_PLATFORM := msm8996
TARGET_BOARD_PLATFORM_GPU := qcom-adreno530
TARGET_BOOTLOADER_BOARD_NAME := msm8996
TARGET_NO_RADIOIMAGE := true
TARGET_USES_64_BIT_BINDER := true
TARGET_NO_BOOTLOADER := true

# Arch
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := kryo

# CPUSets
ENABLE_CPUSETS := true

# Crypto
TARGET_HW_DISK_ENCRYPTION := true

# CNE and DPM
BOARD_USES_QCNE := true

# Partitions
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_BOOTIMAGE_PARTITION_SIZE     := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 5704253440
BOARD_CACHEIMAGE_PARTITION_SIZE    := 268435456
# BOARD_USERDATAIMAGE_PARTITION_SIZE := 0xD5B07B000
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Display
HAVE_ADRENO_SOURCE:= false
BOARD_USES_ADRENO := true
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
MAX_VIRTUAL_DISPLAY_DIMENSION := 4096

NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

TARGET_CONTINUOUS_SPLASH_ENABLED := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
TARGET_USES_ION := true
TARGET_USES_GRALLOC1 := true
TARGET_USES_HWC2 := true
TARGET_USES_NEW_ION_API := true
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 2000000
VSYNC_EVENT_PHASE_OFFSET_NS := 6000000

# Kernel
BOARD_KERNEL_BASE := 0x80000000
#BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 cma=32M@0-0xffffffff
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE += cnsscore.pcie_link_down_panic=1
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET     := 0x01000000
BOARD_KERNEL_IMAGE_NAME := Image.gz
BOARD_KERNEL_SEPARATED_DT := true
ifeq ($(HOST_OS),linux)
TARGET_CUSTOM_DTBTOOL := dtbTool_custom
else
BOARD_KERNEL_PREBUILT_DT := true
OUT_DIR_mac := $(OUT_DIR)
OUT_DIR_COMMON_BASE_mac := $(OUT_DIR_COMMON_BASE)
ifeq (,$(strip $(OUT_DIR_mac)))
ifeq (,$(strip $(OUT_DIR_COMMON_BASE_mac)))
OUT_DIR_mac := $(TOPDIR)out
else
OUT_DIR_mac := $(OUT_DIR_COMMON_BASE_mac)/$(notdir `pwd`)
endif
endif
DEBUG_OUT_DIR_mac := $(OUT_DIR_mac)/debug
TARGET_OUT_ROOT_release_mac := $(OUT_DIR_mac)/target
TARGET_OUT_ROOT_debug_mac := $(DEBUG_OUT_DIR_mac)/target
TARGET_OUT_ROOT_mac := $(TARGET_OUT_ROOT_$(TARGET_BUILD_TYPE)_mac)
TARGET_PRODUCT_OUT_ROOT_mac := $(TARGET_OUT_ROOT_mac)/product
PRODUCT_OUT_mac := $(TARGET_PRODUCT_OUT_ROOT_mac)/$(TARGET_DEVICE)
$(shell cp $(PLATFORM_PATH)/dt.img $(PRODUCT_OUT_mac))
endif

TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CONFIG := griffin_defconfig
TARGET_KERNEL_SOURCE := kernel/motorola/msm8996
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-

# Init
TARGET_INIT_VENDOR_LIB := libinit_griffin
TARGET_RECOVERY_DEVICE_MODULES := libinit_griffin

# Audio
#AUDIO_FEATURE_ENABLED_AAC_ADTS_OFFLOAD := true
AUDIO_FEATURE_ENABLED_ACDB_LICENSE := true
#AUDIO_FEATURE_ENABLED_APE_OFFLOAD := true
AUDIO_FEATURE_ENABLED_ALAC_OFFLOAD := true
AUDIO_FEATURE_ENABLED_ANC_HEADSET := true
AUDIO_FEATURE_ENABLED_AUDIOSPHERE := true
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := true
AUDIO_FEATURE_ENABLED_DEV_ARBI := true
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_FLAC_OFFLOAD := true
AUDIO_FEATURE_ENABLED_FLUENCE := true
AUDIO_FEATURE_ENABLED_HFP := true
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_NT_PAUSE_TIMEOUT := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD_24 := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
#AUDIO_FEATURE_ENABLED_VORBIS_OFFLOAD := true
#AUDIO_FEATURE_ENABLED_WMA_OFFLOAD := true
AUDIO_FEATURE_ENABLED_SND_MONITOR := true
AUDIO_USE_LL_AS_PRIMARY_OUTPUT := true
BOARD_SUPPORTS_SOUND_TRIGGER := false
BOARD_USES_ALSA_AUDIO := true
#USE_CUSTOM_AUDIO_POLICY := 1
#USE_XML_AUDIO_POLICY_CONF := 1

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_DISABLE_INIT_BLANK := true

# GPS
TARGET_NO_RPC := true
USE_DEVICE_SPECIFIC_GPS := true

# Recovery
TARGET_RECOVERY_FSTAB := $(PLATFORM_PATH)/rootdir/etc/fstab.qcom

# Keystore
TARGET_PROVIDES_KEYMASTER := true

# Render
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
USE_OPENGL_RENDERER := true

# RIL
BOARD_PROVIDES_RILD := true
BOARD_PROVIDES_LIBRIL := true

# NFC
BOARD_NFC_CHIPSET := pn544

# SELinux
#include device/qcom/sepolicy/sepolicy.mk
#BOARD_SEPOLICY_DIRS += $(PLATFORM_PATH)/sepolicy

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(PLATFORM_PATH)/bluetooth
BOARD_BLUETOOTH_BDROID_HCILP_INCLUDED := false
BOARD_HAS_QCA_BT_ROME := true
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
QCOM_BT_USE_BTNV := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Camera
BOARD_QTI_CAMERA_32BIT_ONLY := true
USE_DEVICE_SPECIFIC_CAMERA := true
# TARGET_CAMERA_APP := Camera2

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true

# Properties
TARGET_SYSTEM_PROP += device/motorola/griffin/system.prop

# Sensors
USE_SENSOR_MULTI_HAL := true

# Enable peripheral manager
TARGET_PER_MGR_ENABLED := true

# CMHW
BOARD_USES_CYANOGEN_HARDWARE := true
BOARD_HARDWARE_CLASS += hardware/cyanogen/cmhw

# Media
TARGET_USES_MEDIA_EXTENSIONS := true

# SDClang
TARGET_USE_SDCLANG := true

# Wifi
BOARD_HAS_QCOM_WLAN              := true
BOARD_HAS_QCOM_WLAN_SDK          := true
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_qcwcn
BOARD_WLAN_DEVICE                := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
TARGET_USES_QCOM_WCNSS_QMI       := true
TARGET_USES_WCNSS_MAC_ADDR_REV   := true
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"
WIFI_DRIVER_FW_PATH_P2P          := "p2p"
WPA_SUPPLICANT_VERSION           := VER_0_8_X
