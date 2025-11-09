# Phase III Configuration Validation Audit

**Date:** November 6, 2025  
**Status:** VALIDATION IN PROGRESS - ISSUES IDENTIFIED  
**Purpose:** Validate all configs against Phase II.B UART evidence before Task 014 build

---

## 🚨 ISSUES IDENTIFIED

### Issue #1: ARCH Mismatch in Build Script
**External Script:** `research/configs/build_hy300_uboot_usb.sh`
```bash
CROSS_COMPILE="aarch64-unknown-linux-gnu-"  # ← ARM64 toolchain
make ARCH=arm CROSS_COMPILE=$CROSS_COMPILE  # ← ❌ WRONG! Should be arm64
```

**Problem:** Specifies ARM64 cross-compiler but then uses `ARCH=arm` (32-bit)

**Phase II.B Evidence:**
- CPU: Allwinner H713 (sun50iw12p1) = **ARMv8 64-bit**
- U-Boot version: 2018.05-00027-ge159793 (Linaro GCC 7.2.1)
- Compiler flag: `arm-linux-gnueabi-gcc` (32-bit)

**Question:** Is factory U-Boot 32-bit or 64-bit?

---

### Issue #2: defconfig Origin Unknown
**File:** `research/configs/hy300_h713_defconfig`
- From external repo (no hardware validation)
- Not verified against actual H713 hardware

**Alternative:** `kernel-h713-hy300.defconfig`
- Your own config (November 3, 2025)
- **NOT YET VALIDATED** against Phase II.B findings

**Required:** Cross-check both configs with Phase II.B UART output

---

### Issue #3: USB Serial Config
**File:** `research/configs/hy300_boot_usb_serial.txt`
```bash
echo "Enabling USB CDC ACM serial gadget..."
ums 0 mmc 0  # ← USB Mass Storage mode (device acts as USB drive)
```

**Problem:** `ums` command conflicts with `setenv stdout serial,usbacm`

**Phase II.B Finding:** Device has working UART @ 115200 baud. No USB gadget mentioned in factory U-Boot.

**Decision Needed:** 
- Keep it simple (UART only) for Phase III
- Or add USB later (Phase IV+) after UART proven

---

### Issue #4: Device Tree Variants
**Mainline DTB:** `sun50i-h713-hy300-mainline.dts`
- Created by you (few days ago)
- No `firmware/android` section (removed)
- Otherwise matches factory

**Factory DTB:** `stock_image/sunxi.dts`
- From actual running device
- Includes all Android firmware sections
- Removed in mainline version = intentional?

**Difference Check Needed:**
```
[ ] UART pins (PA4/PA5) - same in both?
[ ] MMC2 (eMMC @ 4022000) - same in both?
[ ] Display/Video - same address ranges?
[ ] MIPS co-processor memory (40.3MB) - preserved?
[ ] Motor/GPIO pins - same aliases?
```

---

### Issue #5: kernel-h713-hy300.defconfig Status
**Your config includes:**
- ✅ UART support (SERIAL_8250, PL011)
- ✅ MMC/eMMC (SUNXI_MMC, SDHCI)
- ✅ Thermal (SUNXI thermal zones)
- ✅ GPIO/I2C/SPI (motor control)
- ✅ GPU (DRM_PANFROST for Mali)

**But NOT validated:**
- Against Phase II.B UART environment variables
- Against factory kernel boot log
- Against actual hardware capabilities

**Required Validation:**
```
Phase II.B Evidence → kernel-h713-hy300.defconfig Mapping

UART0 @ 0x2500000        → CONFIG_SERIAL_8250_DW ✓
MMC2 @ 0x4022000         → CONFIG_MMC_SUNXI ✓
GPIO (PWM/I2C/SPI)       → CONFIG_GPIO_SUNXI ✓
ARM64 / 4 CPUs           → CONFIG_SMP=y, CONFIG_NR_CPUS=4 ✓
Thermal zones (CPU/GPU)  → CONFIG_THERMAL_SUN50I ✓

Missing?
- Display driver specifics?
- MIPS co-processor device tree node?
- V4L2 HDMI input support?
```

---

## Phase II.B UART Evidence Reference

### Key Hardware Facts (From UART Console)
```
CPU:      Allwinner H713 (sun50iw12p1)
ARCH:     ARMv8 64-bit
CORES:    4x Cortex-A53
DRAM:     1 GiB @ 0x40000000-0x80000000
eMMC:     7.3 GB Kingston 8GME4 (mmc2)
UART0:    @ 0x2500000, 115200 bps
Bootloader: U-Boot 2018.05 (32-bit compiled)
```

### Active Boot Parameters
```
force_normal_boot=1        (Secure boot DISABLED)
bootcmd="run setargs_mmc boot_normal"
bootdelay=1
panel config active
```

---

## Validation Plan

### Step 1: Resolve ARCH Mismatch (TODAY)
- [ ] Check if factory U-Boot is really 32-bit (despite ARM64 CPU)
- [ ] Determine correct ARCH and CROSS_COMPILE for mainline U-Boot
- [ ] Decision: Build 32-bit or 64-bit U-Boot?

### Step 2: DTB Comparison (TODAY)
- [ ] Line-by-line diff: stock_image/sunxi.dts vs sun50i-h713-hy300-mainline.dts
- [ ] Verify all hardware addresses match Phase II.B findings
- [ ] Check MIPS reserved memory is present

### Step 3: Kernel Config Cross-Check (TODAY)
- [ ] Map each kernel-h713-hy300.defconfig option to Phase II.B finding
- [ ] Mark as ✅ Validated or ⚠️ Unverified
- [ ] Document any missing options

### Step 4: USB Serial Decision (TODAY)
- [ ] Keep simple for Phase III (UART only)
- [ ] Remove USB gadget configs from boot script
- [ ] Plan USB as Phase IV+ enhancement

### Step 5: Build Strategy (AFTER VALIDATION)
- [ ] Use nix-shell for reproducible cross-compiler
- [ ] Test with SRAM (0x40800000) before eMMC flash
- [ ] Document build procedure for recovery

---

## Questions for User

1. **U-Boot Architecture:**
   - Should mainline U-Boot be 32-bit (like factory) or 64-bit?
   - Any preference or constraints?

2. **Device Tree:**
   - Why remove `firmware/android` section from mainline DTB?
   - Intentional (mainline doesn't need it) or oversight?

3. **USB Serial:**
   - Keep simple (UART only) for Phase III?
   - Add USB gadget support later if needed?

4. **defconfig Source:**
   - Use `research/configs/hy300_h713_defconfig` (external, not validated)?
   - Or validate `kernel-h713-hy300.defconfig` (yours) thoroughly?

---

## Next Action

**BEFORE proceeding with Task 014 (U-Boot Build):**

1. User reviews this audit document
2. Answer the 4 questions above
3. We complete Steps 1-4 validation
4. Then and ONLY THEN: nix-shell build

**Current Status:** ⏸️ BLOCKED ON VALIDATION
