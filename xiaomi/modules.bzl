def register_modules(registry):
    registry.register(
        name = "xiaomi/xiaomi_touch",
        out = "xiaomi_touch.ko",
        config = "CONFIG_XIAOMI_TOUCH",
        srcs = ["xiaomi/xiaomi_touch.c"],
        deps = [],
    )

    registry.register(
        name = "xiaomi/xiaomi_touch_notifier",
        out = "xiaomi_touch_notifier.ko",
        config = "CONFIG_XIAOMI_TOUCH_NOTIFIER",
        srcs = ["xiaomi/xiaomi_touch_notifier.c"],
        deps = [],
    )

    registry.register(
        name = "xiaomi/xiaomi_panel_notifier",
        out = "xiaomi_panel_notifier.ko",
        config = "CONFIG_XIAOMI_PANEL_NOTIFIER",
        srcs = ["xiaomi/xiaomi_panel_notifier.c"],
        deps = [],
    )

    registry.register(
        name = "xiaomi/xiaomi_usb_touch_notifier",
        out = "xiaomi_usb_touch_notifier.ko",
        config = "CONFIG_XIAOMI_USB_TOUCH_NOTIFIER",
        srcs = ["xiaomi/xiaomi_usb_touch_notifier.c"],
        deps = [],
    )

    registry.register(
        name = "xiaomi/xiaomi_headset_touch_notifier",
        out = "xiaomi_headset_touch_notifier.ko",
        config = "CONFIG_XIAOMI_HEADSET_TOUCH_NOTIFIER",
        srcs = ["xiaomi/xiaomi_headset_touch_notifier.c"],
        deps = [],
    )

    registry.register(
        name = "xiaomi/mi_thermal_interface",
        out = "mi_thermal_interface.ko",
        config = "CONFIG_MI_THERMAL_INTERFACE",
        srcs = ["xiaomi/mi_thermal_interface.c"],
        deps = [],
    )
