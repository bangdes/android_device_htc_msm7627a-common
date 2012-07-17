#
# config.mk
#
# Product-specific compile-time definitions.
#

ifeq ($(QC_PROP),true)
    BOARD_USES_QCOM_HARDWARE := true
    DYNAMIC_SHARED_LIBV8SO := true
    BOARD_USES_ADRENO_200 := true
    HAVE_ADRENO200_SOURCE := true
    HAVE_ADRENO200_SC_SOURCE := true
    HAVE_ADRENO200_FIRMWARE := true
    BOARD_USES_QCNE := true
    USE_OPENGL_RENDERER := true
    TARGET_USES_MDP3 := true
    #BOARD_USE_QCOM_LLVM_CLANG_RS := true
    MM_AUDIO_OMX_ADEC_EVRC_DISABLED := true
    MM_AUDIO_OMX_ADEC_QCELP13_DISABLED := true
    MM_AUDIO_FTM_DISABLED := true
    MM_AUDIO_MEASUREMENT_DISABLED := true
    MM_AUDIO_VOEM_DISABLED := true
    MM_AUDIO_MVS_DISABLED :=true
    TARGET_NO_RPC := false
    TARGET_USES_ION := true
    ifneq ($(BUILD_TINY_ANDROID), true)
   #BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50001
   #BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := default
    BOARD_HAVE_BLUETOOTH := true
    BOARD_HAVE_QCOM_FM := true
    PROTEUS_DEVICE_API := true
    #HACK use Camera Stub
    #BOARD_CAMERA_LIBRARIES := libcamera
    USE_CAMERA_STUB := true
    # Define respective statement to true to enable the ATH or WCN WLAN.
    BOARD_HAS_QCOM_WLAN := true
    BOARD_HAS_ATH_WLAN := false

    ifeq ($(findstring true,$(BOARD_HAS_ATH_WLAN) $(BOARD_HAS_QCOM_WLAN)),true)
    BOARD_WPA_SUPPLICANT_DRIVER := NL80211
    BOARD_HOSTAPD_DRIVER := NL80211
    WPA_SUPPLICANT_VERSION := VER_0_8_X
    HOSTAPD_VERSION := VER_0_8_X
    WIFI_CFG80211_DRIVER_MODULE_PATH := "/system/lib/modules/cfg80211.ko"
    WIFI_CFG80211_DRIVER_MODULE_NAME := "cfg80211"
    WIFI_CFG80211_DRIVER_MODULE_ARG  := ""
    WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
    WIFI_DRIVER_MODULE_NAME := "wlan"
    WIFI_DRIVER_MODULE_ARG := ""

    WIFI_TEST_INTERFACE     := "sta"
    WIFI_DRIVER_FW_PATH_STA := "sta"
    WIFI_DRIVER_FW_PATH_AP  := "ap"
    WIFI_DRIVER_FW_PATH_P2P := "p2p"
    endif

    ifeq ($(BOARD_HAS_QCOM_WLAN), true)
    WIFI_SDIO_IF_DRIVER_MODULE_PATH := "/system/lib/modules/librasdioif.ko"
    WIFI_SDIO_IF_DRIVER_MODULE_NAME := "librasdioif"
    WIFI_SDIO_IF_DRIVER_MODULE_ARG  := ""
    BOARD_WLAN_DEVICE := qcwcn
    endif

    BOARD_USES_SRS_TRUEMEDIA := true
    endif   # !BUILD_TINY_ANDROID

else
    BOARD_USES_GENERIC_AUDIO := true
    USE_CAMERA_STUB := true
endif # QC_PROP

BOARD_HAVE_QCOM_FM := true
TARGET_HAVE_TSLIB := true

TARGET_NO_BOOTLOADER := false
TARGET_NO_KERNEL := false
TARGET_NO_RADIOIMAGE := true
# Try to use ASHMEM if possible (when non-MDP composition is used)
TARGET_GRALLOC_USES_ASHMEM := true

TARGET_CPU_ABI  := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_BOARD_PLATFORM := msm7627a
TARGET_BOOTLOADER_BOARD_NAME := 7x27
TARGET_CPU_SMP := true
TARGET_AVOID_DRAW_TEXTURE_EXTENSION := true
TARGET_USES_16BPPSURFACE_FOR_OPAQUE := true

TARGET_CORTEX_CACHE_LINE_32 := true

BOARD_KERNEL_BASE    := 0x00200000
BOARD_KERNEL_PAGESIZE := 4096
#Spare size is (BOARD_KERNEL_PAGESIZE>>9)*16
BOARD_KERNEL_SPARESIZE := 128
#Spare size for 8 bit BCH ECC NAND
BOARD_HAS_8BIT_BCHECC_SUPPORT := true
BOARD_KERNEL_BCHECC_SPARESIZE := 160

# Support to build images for 2K NAND page
BOARD_SUPPORTS_2KNAND_PAGE := true
BOARD_KERNEL_2KPAGESIZE := 2048
BOARD_KERNEL_2KSPARESIZE := 64

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USES_UNCOMPRESSED_KERNEL := false

BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom loglevel=1 vmalloc=200M
ARCH_ARM_HAVE_TLS_REGISTER := true
BOARD_EGL_CFG := device/qcom/$(TARGET_PRODUCT)/egl.cfg

BOARD_NO_SPEAKER := true # msm7627a doesn't have speaker
BOARD_NO_TOUCHSCREEN := false

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 265289728
BOARD_USERDATAIMAGE_PARTITION_SIZE := 314556416
BOARD_PERSISTIMAGE_PARTITION_SIZE := 10485760
BOARD_CACHEIMAGE_PARTITION_SIZE := 41943040
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
#TARGET_RECOVERY_UPDATER_LIBS += librecovery_updater_qcom

BOARD_HAVE_MXT224_CFG := true

# Signed boot image support
TARGET_BOOTIMG_SIGNED := true

