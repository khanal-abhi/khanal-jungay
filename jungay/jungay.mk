$(call inherit-product, device/google/cuttlefish/vsoc_x86_64/phone/aosp_cf.mk)

PRODUCT_NAME		:= jungay
PRODUCT_DEVICE 		:= jungay
PRODUCT_MANUFACTURER	:= Khanal
PRODUCT_MODEL		:= Jungay x86_64 phone

PRODUCT_PACKAGES += \
	android.hardware.power-service.example \
	android.hardware.power.stats-service.jungay
