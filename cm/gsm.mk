# GSM APN list
PRODUCT_COPY_FILES += \
    device/htc/passion-common/cm/apns-conf.xml:system/etc/apns-conf.xml

# GSM SPN overrides list
PRODUCT_COPY_FILES += \
    device/htc/passion-common/cm/spn-conf.xml:system/etc/spn-conf.xml

# SIM Toolkit
PRODUCT_PACKAGES += \
    Stk
