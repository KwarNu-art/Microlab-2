THEOS_PACKAGE_SCHEME = rootless
TARGET := iphone:clang:latest:15.0
ARCHS := arm64

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NovaShield

NovaShield_FILES = src/Tweak.x src/NovaHUD.m
NovaShield_CFLAGS = -fobjc-arc -O3 -flto -DNDEBUG -Wno-unused-variable -Wno-deprecated-declarations
NovaShield_FRAMEWORKS = UIKit Foundation CoreGraphics QuartzCore AudioToolbox
NovaShield_LIBRARIES = substrate

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += NovaShieldPrefs
include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall -9 SpringBoard || true"
