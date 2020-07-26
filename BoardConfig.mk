#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from msm8916-common
include device/LYF/msm8916-common/BoardConfigCommon.mk

DEVICE_PATH := device/LYF/zx55q05

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Camera
BOARD_CAMERA_SENSORS := imx135_cp8675 imx214_cp8675 ov5648_cp8675
USE_DEVICE_SPECIFIC_CAMERA := true

# Filesystem
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x0002000000
BOARD_CACHEIMAGE_PARTITION_SIZE := 0x0010000000
BOARD_PERSISTIMAGE_PARTITION_SIZE := 0x0002000000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x0002000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x0060000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x0311bfbe00

# GPS
TARGET_NO_RPC := true
USE_DEVICE_SPECIFIC_GPS := true

# Init
TARGET_LIBINIT_MSM8916_DEFINES_FILE := $(DEVICE_PATH)/init/init_zx55q05.cpp

# Kernel
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
LZMA_RAMDISK_TARGETS := recovery
TARGET_KERNEL_SOURCE := kernel/LYF/zx55q05
TARGET_KERNEL_CONFIG := zx55q05_defconfig

# Offline Charging
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BOARD_CHARGER_ENABLE_SUSPEND := true

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Recovery
TARGET_RECOVERY_DENSITY := xhdpi
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := ABGR_8888

# SELinux
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy

# Shims
TARGET_LD_SHIM_LIBS += \
    /system/vendor/lib64/lib-imsdpl.so|libshims_boringssl.so \
    /system/vendor/lib64/lib-imsvt.so|libshims_ims.so \

# Widevine
BOARD_WIDEVINE_OEMCRYPTO_LEVEL := 3

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Inherit from proprietary files
include vendor/LYF/zx55q05/BoardConfigVendor.mk
