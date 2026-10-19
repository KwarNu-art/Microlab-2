TARGET := iphone:clang:latest:15.0
ARCHS := arm64

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = NovaShieldPrefs

NovaShieldPrefs_FILES = RootListController.m
NovaShieldPrefs_FRAMEWORKS = UIKit
NovaShieldPrefs_PRIVATE_FRAMEWORKS = Preferences
NovaShieldPrefs_INSTALL_PATH = /Library/PreferenceBundles
NovaShieldPrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
