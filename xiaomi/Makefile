# SPDX-License-Identifier: GPL-2.0-only
#
# Xiaomi vendor modules for sky (SM4450 / parrot / ravelin)
# Ported from MiCode sky-t-oss (Linux 5.10.160) to the CLO 6.12 stack.
#
# Built out-of-tree via TARGET_KERNEL_EXT_MODULES in
# device/xiaomi/sm4450-common/BoardConfigCommon.mk.

KBUILD_OPTIONS += MODNAME=xiaomi

ccflags-y += -I$(srctree)/$(src)/include

obj-m += xiaomi_touch.o
obj-m += xiaomi_panel_notifier.o
obj-m += xiaomi_touch_notifier.o
obj-m += xiaomi_usb_touch_notifier.o
obj-m += xiaomi_headset_touch_notifier.o
obj-m += mi_thermal_interface.o

modules modules_install clean:
	$(MAKE) -C $(KERNEL_SRC) M=$(M) $@ $(KBUILD_OPTIONS)
