-include device/google/cuttlefish/vsoc_x86_64/BoardConfig.mk

BOARD_VENDOR_SEPOLICY_DIRS += \
	device/khanal/jungay/sepolicy/vendor

# ifneq ($(TARGET_BUILD_VARIANT),user)
# BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
# endif
