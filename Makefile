TARGET = iphone:latest:5.0

TARGET_STRIP = bin/dsym_and_strip "$(SYSROOT)"
ADDITIONAL_CFLAGS += -g

TWEAK_NAME = LocationReminders
LocationReminders_FILES = Tweak.xm
LocationReminders_FRAMEWORKS = CoreLocation EventKit UIKit

include theos/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk

after-stage::
	$(ECHO_NOTHING)find $(THEOS_STAGING_DIR) \( -iname '*.plist' -or -iname '*.strings' \) -exec plutil -convert binary1 {} \;$(ECHO_END)
