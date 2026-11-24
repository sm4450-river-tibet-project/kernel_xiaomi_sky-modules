# kernel_xiaomi_sky-modules

Xiaomi vendor kernel modules for the Redmi 12 5G (**sky**, SM4450 / parrot / ravelin),
ported from Linux **5.10.160** to the **CLO 6.12** ACK stack.

## Source

Ported from `MiCode/Xiaomi_Kernel_OpenSource`, branch `sky-t-oss` (Linux 5.10.160),
which is the official Xiaomi OSS release for this device.

Upstream files used:

| Module | 5.10 origin |
|---|---|
| `xiaomi_touch.ko` | `drivers/input/touchscreen/xiaomi_touch/` |
| `xiaomi_panel_notifier.ko` | `drivers/misc/xiaomi_panel_notifier/` |
| `xiaomi_touch_notifier.ko` | `drivers/misc/xiaomi_touch_notifier/` |
| `xiaomi_usb_touch_notifier.ko` | `drivers/misc/xiaomi_usb_touch_notifier/` |
| `xiaomi_headset_touch_notifier.ko` | `drivers/misc/xiaomi_headset_touch_notifier/` |
| `mi_thermal_interface.ko` | `drivers/thermal/mi_thermal_interface.c` |

`millet_*.ko` (core, binder, hs, oem_cgroup, pkg, sig) are **not** included:
they are closed-source Xiaomi performance-framework modules with no public
source in any kernel version. They are dropped from `modules.load`.

## 5.10 -> 6.12 port notes

| Change | Reason |
|---|---|
| `class_create(THIS_MODULE, name)` -> `class_create(name)` | `THIS_MODULE` arg removed in 6.4 |
| dropped `.llseek = no_llseek` | `no_llseek` removed in 6.12 |
| `platform_driver.remove`: `int` -> `void` | signature changed in 6.11 |
| `device_create(..., 'T', ...)` -> `dev_t 0` | implicit char->dev_t conversion now errors |
| `PANEL_EVENT_NOTIFIER_CLIENT_THERMAL` -> `_ECM` | thermal client removed from the 6.12 qcom enum |
| kernfs walk + `to_subsys_private()` -> `class_find_get("thermal")` | `drivers/base/base.h` is kernel-internal, not importable from a vendor module |
| dropped `#include "thermal_core.h"` | kernel-internal and unused |
| dropped `#include <linux/kernfs.h>` | no longer needed after the class lookup rewrite |

The four `*_notifier` modules needed no API changes; only their include paths moved
to the in-tree `include/misc/`.

## Build

Consumed by `device/xiaomi/sm4450-common`:

```make
TARGET_KERNEL_EXT_MODULE_ROOT := kernel/xiaomi/sky-modules
TARGET_KERNEL_EXT_MODULES := xiaomi
```

## License

GPL-2.0-only. Original code Copyright (C) Xiaomi. Ported changes released under
the same terms.
