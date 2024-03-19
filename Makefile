TARGET := iphone:clang:latest:14.0
THEOS_PACKAGE_SCHEME = rootless
INSTALL_TARGET_PROCESSES = SpringBoard
SYSROOT = $(THEOS)/sdks/iPhoneOS16.5.sdk/
ARCHS = arm64 arm64e

DEBUG = 1
FINALPACKAGE = 0

include $(THEOS)/makefiles/common.mk

PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)

TWEAK_NAME = Estrogen
$(TWEAK_NAME)_FILES = Tweak.x
$(TWEAK_NAME)_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"

SUBPROJECTS += estrogenprefs

include $(THEOS_MAKE_PATH)/aggregate.mk