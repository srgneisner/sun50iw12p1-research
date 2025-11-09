# Critical Hardware Findings - HY300 Device Analysis

**Date:** 2025-11-08  
**Source:** Complete device filesystem tree analysis + U-Boot logs  
**Status:** 🔴 **ACTION REQUIRED** - Multiple critical components identified

---

## Executive Summary

Analysis of the complete HY300 filesystem (`FullDir.xml`, 620k lines) combined with UART boot logs reveals **critical hardware information** that must be extracted and preserved before Phase III (U-Boot replacement).

### Critical Risk Areas Identified:
1. **AIC8800 WiFi/BT Firmware** - Proprietary, must be backed up
2. **Display/Projector Configuration** - Panel timings in `Reserve0`
3. **Cedar VPU + AV1 Decoder** - Proprietary video acceleration
4. **Mali GPU Drivers** - Binary blobs required
5. **Device Tree Issues** - Multiple DTB errors in boot logs

---

## 🚨 IMMEDIATE ACTION ITEMS

### 1. Backup Critical Firmware Files (URGENT)

**Location:** `/vendor/firmware/aic8800/`

```bash
# These files MUST be extracted before any modifications:
adb pull /vendor/firmware/aic8800/ ./backup/firmware/aic8800/

# Files identified:
- fmacfw_8800d80.bin          # WiFi MAC firmware
- fmacfw_8800d80_h_u02.bin    # Hardware revision U02
- fw_patch_8800d80.bin        # Firmware patches
- lmacfw_rf_8800d80.bin       # RF (radio) firmware
- fw_adid_8800d80.bin         # Audio/Device ID firmware

# 8800DC variant (different chip revision):
- fmacfw_8800dc_*.bin         # Multiple variants
- fw_patch_8800dc*.bin
```

**Why Critical:** These are **proprietary binary blobs** from AICSemi. No open-source alternatives exist. Without these, WiFi/Bluetooth will be completely non-functional in mainline Linux.

### 2. Extract Display Configuration (HIGH PRIORITY)

**Location:** `/Reserve0/`

```bash
adb pull /Reserve0/panel_config.ini ./backup/Reserve0/
adb pull /Reserve0/pq_colortemp.ini ./backup/Reserve0/
adb pull /Reserve0/prj_mode ./backup/Reserve0/
```

**Content Preview (from U-Boot log):**
- **panel_config.ini**: Panel timings, resolution, sync signals
- **pq_colortemp.ini**: Color temperature calibration (projector-specific)
- **prj_mode**: Projection mode (front/ceiling/rear)

**Boot Log Evidence:**
```
[02.037]get file(panel_config.ini) size from media_data error
zztest--/oem/panel_config.ini is no exsists ,get panel_config.ini from Reserve0
2525 bytes read in 1 ms (2.4 MiB/s)
[02.054]LogRegData.bin version is 25-4-10-157
[02.059]Project id:0x34 version:25-1-6-3
```

**Impact:** Without these, the display will not initialize correctly. These contain **hardware-calibrated values** that cannot be regenerated.

### 3. Extract Video Decoder Blobs

**Locations:**
- `/vendor/firmware/display.bin` (1.2 MB)
- `/vendor/firmware/LogoRegData.bin`
- `/vendor/etc/display/mips/` - TSE files (database, pq_custom, projecttable)

**U-Boot Log Reference:**
```
1255696 bytes read in 16 ms (74.8 MiB/s)
display_bin addr: 0x7857b000 copy 0x4b100000, size: 0x132910
[02.922]CWL  tse_id mips/ProjectID_0x0034.TSE
282464 bytes read in 6 ms (44.9 MiB/s)
mips/database.TSE addr: 0x786ae000 copy 0x4be41000, size: 0x44f60
```

These are **MIPS coprocessor binaries** for the display controller. Project ID: `0x34`.

---

## 📊 Hardware Architecture Discovered

### 1. WiFi/Bluetooth: AIC8800 Chip

**Evidence from `/sys/`:**
```
/sys/class/net/wlan0              # WiFi interface active
/sys/class/bluetooth/             # BT subsystem present
/sys/module/sunxi-btlpm/          # Bluetooth Low Power Mode
/sys/module/sunxi-wlan/           # WiFi driver
/sys/kernel/debug/btmode          # BT operating mode
/sys/kernel/debug/btpcm           # BT PCM audio
```

**Driver:** Proprietary `aic8800` kernel module (likely in `/vendor/lib/modules/`)

**Mainline Status:** ❌ **NOT SUPPORTED** - Requires reverse engineering or proprietary driver port

**Action Required:**
1. Extract all `/vendor/firmware/aic8800/*.bin` files
2. Locate kernel module: `find /vendor -name "*aic8800*.ko"`
3. Document loaded module parameters: `adb shell cat /sys/module/aic8800*/parameters/*`

---

### 2. GPU: Mali-G31 (confirmed)

**Evidence from `/sys/`:**
```
/sys/devices/platform/soc@3000000/1800000.gpu/
/sys/class/misc/mali0
/sys/bus/platform/drivers/mali/1800000.gpu
/sys/kernel/debug/mali/
```

**Device Tree Node:** `1800000.gpu` (memory-mapped at 0x01800000)

**OPP Table:** `/sys/devices/system/cpu/cpufreq/gpu-opp-table/`
- Frequency scaling supported
- Power management via `/sys/devices/platform/soc@3000000/7001000.power-management:power-controller`

**Driver Status:**
- Android uses **proprietary Mali blob** (likely in `/vendor/lib/egl/`)
- Mainline Linux: Use **lima** or **panfrost** driver (open-source)

**Action Required:**
1. Check for proprietary libs: `adb shell find /vendor /system -name "*mali*" -o -name "*gpu*"`
2. Test if lima/panfrost can drive this GPU (Phase V)

---

### 3. Video Processing: Cedar VPU + AV1 Hardware Decoder

**Evidence from `/sys/`:**
```
/sys/class/cedar_ve/cedar_dev        # Cedar Video Engine
/sys/class/cedar_go/cedar_go         # Cedar "GO" variant
/sys/devices/platform/soc@3000000/1c0d000.av1/  # AV1 hardware decoder
```

**Device Tree Nodes:**
- `1c0d000.av1`: AV1 decoder at 0x1c0d000
- Cedar VPU: Likely at standard Allwinner VE address

**Codecs Supported (from device tree aliases):**
```
/sys/firmware/devicetree/base/aliases/av1
/sys/firmware/devicetree/base/aliases/videoinfo
```

**Mainline Status:**
- Cedar VPU: ✅ Supported via `cedrus` driver (V4L2-based)
- AV1 decoder: ⚠️ **UNKNOWN** - This is H713-specific, may need custom driver

**Action Required:**
1. Extract device tree: `adb pull /sys/firmware/fdt ./backup/device-tree/factory.dtb`
2. Decompile: `dtc -I dtb -O dts factory.dtb > factory.dts`
3. Analyze AV1 node properties

---

### 4. Memory Layout (from U-Boot Log)

```
DRAM:  1 GiB
DRAM CLK = 624 MHz
DRAM Type = 3 (DDR3)
DRAMC ZQ value: 0x7b7bfb
DRAM ODT value: 0x40

U-Boot Relocation Offset: 0x35f0e000
U-Boot loads at: 0x4a000000
FDT (Device Tree) at: 0x77ebde70 → relocated to 0x77e8de70
```

**eMMC Storage:**
```
MMC 5.1
7456 MB (7.3 GB)
HSSDR52/DDR50 mode
50 MHz bus speed
8-bit bus width
```

**Critical Boot Addresses:**
- `0x40800000`: SRAM/DRAM load address (for FEL mode testing)
- `0x4a000000`: U-Boot entry point
- `0x77e8de70`: Device Tree Blob location

**Action Required:**
1. Document complete memory map for Phase III safety
2. These addresses are **critical for UART FEL recovery**

---

### 5. Device Tree Issues (CRITICAL)

**Errors from Boot Log:**
```
E/TC:0 0 init_external_dt:1033 Device Tree missing  ← OP-TEE expects external DTB
E/TC:0   fdt_getprop_u32:336 prop trace_level not found
[03.950][mmc]: delete mmc-hs400-1_8v from dtb
[03.954][mmc]: delete mmc-hs200-1_8v from dtb
[03.961]## error: update_fdt_dram_para : FDT_ERR_NOTFOUND  ← CRITICAL
unable to find pwm led node in device tree.
Failed to get bl id property
Failed to get pwm_id property
```

**Root Cause:** U-Boot is **modifying the device tree at runtime** but encountering missing nodes.

**Impact on Mainline:**
- The factory DTB is incomplete/corrupt
- Mainline kernel will likely fail to boot with stock DTB
- We need to **build a corrected DTB** from device tree source

**Action Required:**
1. Extract running kernel DTB: `adb shell cat /proc/device-tree > ./backup/running-kernel.dtb`
2. Extract U-Boot DTB: Already at `0x77e8de70`, need to dump via UART
3. Compare with `sun50i-h713-hy300.dts` from research

---

## 🗂️ Critical Files to Extract (Checklist)

### Tier 1: Cannot Proceed Without These
- [ ] `/vendor/firmware/aic8800/*.bin` (all 40+ files)
- [ ] `/Reserve0/panel_config.ini`
- [ ] `/Reserve0/pq_colortemp.ini`
- [ ] `/Reserve0/prj_mode`
- [ ] `/vendor/firmware/display.bin`
- [ ] `/vendor/firmware/LogoRegData.bin`
- [ ] `/sys/firmware/fdt` (running device tree)
- [ ] `/proc/device-tree/` (alternative DTB location)

### Tier 2: Nice to Have, Can Regenerate
- [ ] `/vendor/etc/display/mips/*.TSE` (display controller firmware)
- [ ] `/sys/kernel/debug/clk/` (clock tree dump)
- [ ] `/sys/kernel/debug/regulator/` (power regulator status)
- [ ] `/sys/kernel/debug/gpio` (GPIO state)
- [ ] `/vendor/lib/modules/*.ko` (kernel modules)

### Tier 3: Reference Only
- [ ] `/system/lib64/*.so` (Android system libraries)
- [ ] `/proc/cmdline` (kernel boot arguments)
- [ ] `/proc/partitions` (partition layout)

---

## 📋 Proposed Subtasks

### Task 016: Extract Critical Firmware Blobs
**Priority:** 🔴 CRITICAL  
**Estimated Time:** 30 minutes  
**Blocker For:** Phase III (U-Boot replacement)

**Steps:**
1. Verify ADB/SSH access to Device A
2. Create `backup/firmware/` structure
3. Execute backup commands:
   ```bash
   adb pull /vendor/firmware/aic8800/ ./backup/firmware/aic8800/
   adb pull /vendor/firmware/display.bin ./backup/firmware/
   adb pull /vendor/firmware/LogoRegData.bin ./backup/firmware/
   adb pull /vendor/etc/display/mips/ ./backup/firmware/display-mips/
   ```
4. Verify checksums: `sha256sum backup/firmware/**/* > backup/firmware-checksums.txt`
5. Test restore on Device B (read-only verification)

**Success Criteria:**
- All AIC8800 files backed up (40+ files)
- Display binaries extracted
- Checksums documented
- Files readable and not corrupted

---

### Task 017: Extract Reserve0 Calibration Data
**Priority:** 🔴 CRITICAL  
**Estimated Time:** 15 minutes  
**Blocker For:** Display initialization in mainline

**Steps:**
1. Mount Reserve0 partition (likely at `/dev/block/by-name/Reserve0`)
2. Backup entire partition:
   ```bash
   adb shell su -c "dd if=/dev/block/by-name/Reserve0 of=/sdcard/Reserve0.img"
   adb pull /sdcard/Reserve0.img ./backup/partitions/
   ```
3. Extract individual files:
   ```bash
   adb pull /Reserve0/panel_config.ini ./backup/Reserve0/
   adb pull /Reserve0/pq_colortemp.ini ./backup/Reserve0/
   adb pull /Reserve0/prj_mode ./backup/Reserve0/
   ```
4. Parse `panel_config.ini` to extract LCD timings

**Success Criteria:**
- Reserve0 partition imaged
- Individual config files extracted
- Panel timings documented in readable format

---

### Task 018: Extract and Analyze Device Tree
**Priority:** 🟠 HIGH  
**Estimated Time:** 45 minutes  
**Blocker For:** Mainline kernel device tree creation

**Steps:**
1. Extract running kernel DTB:
   ```bash
   adb shell su -c "cat /sys/firmware/fdt" > ./backup/device-tree/running-kernel.dtb
   adb shell su -c "cat /proc/device-tree/*" # Alternative method
   ```
2. Decompile to source:
   ```bash
   dtc -I dtb -O dts -o running-kernel.dts running-kernel.dtb
   ```
3. Compare with research DTB:
   ```bash
   diff -u research/sun50i-h713-hy300.dts backup/device-tree/running-kernel.dts > device-tree-diff.patch
   ```
4. Identify critical nodes:
   - AIC8800 WiFi/BT
   - AV1 decoder
   - Display controller
   - Mali GPU
   - Cedar VPU

**Success Criteria:**
- Running DTB extracted and decompiled
- Differences with research DTB documented
- Critical missing nodes identified
- Action plan for mainline DTB created

---

### Task 019: Document Complete Memory Map
**Priority:** 🟠 HIGH  
**Estimated Time:** 30 minutes  
**Blocker For:** Phase III UART FEL testing

**Steps:**
1. Extract memory information:
   ```bash
   adb shell cat /proc/iomem > backup/memory-map/iomem.txt
   adb shell cat /proc/meminfo > backup/memory-map/meminfo.txt
   ```
2. Parse U-Boot log for boot addresses
3. Document:
   - SRAM regions (for FEL testing)
   - DRAM layout
   - Device MMIO ranges
   - Reserved memory regions
4. Create memory map diagram
5. Mark safe regions for FEL uploads

**Success Criteria:**
- Complete memory map documented
- Safe SRAM regions identified for FEL testing
- U-Boot load addresses confirmed
- Recovery procedures updated with addresses

---

### Task 020: WiFi/BT Driver Analysis
**Priority:** 🟡 MEDIUM  
**Estimated Time:** 1-2 hours  
**Blocker For:** Phase V (driver porting)

**Steps:**
1. Locate kernel modules:
   ```bash
   adb shell find /vendor /system -name "*.ko" | grep -i "aic\|wifi\|bt"
   ```
2. Extract modules:
   ```bash
   adb pull /vendor/lib/modules/aic8800_fdrv.ko ./backup/modules/
   ```
3. Analyze module info:
   ```bash
   modinfo backup/modules/aic8800_fdrv.ko
   ```
4. Document:
   - Module parameters
   - Firmware loading mechanism
   - Device tree requirements
   - Kernel version compatibility

**Success Criteria:**
- All WiFi/BT modules extracted
- Module dependencies documented
- Firmware loading sequence understood
- Porting strategy defined

---

### Task 021: Create Hardware Validation Test Plan
**Priority:** 🟡 MEDIUM  
**Estimated Time:** 1 hour  
**Blocker For:** Phase IV (kernel boot testing)

**Steps:**
1. Define test matrix:
   - Boot sequence validation
   - UART console functionality
   - Display initialization
   - WiFi/BT presence (not functionality yet)
   - USB host/device modes
   - eMMC read/write
2. Create test scripts
3. Document expected vs. actual behavior
4. Define pass/fail criteria

**Success Criteria:**
- Test plan documented
- Test scripts created
- Baseline results from Device B captured
- Ready for Phase IV validation

---

## 🔗 File Locations Reference

### Device Tree Analysis Files
Location: `/home/luca/Desktop/hy300-linux-porting/device-tree-analysis/`

**Critical Files:**
- `sys.md` (2.3 MB) - Complete `/sys/` tree with driver info
- `proc.md` (13 MB) - Process and kernel runtime info
- `vendor.md` (58 KB) - Vendor-specific files and firmware
- `Reserve0.md` (1.6 KB) - Calibration data partition
- `dev.md` (24 KB) - Device nodes

**Hardware Evidence Located In:**
- GPU: `sys.md` lines 530, 719-720, 2151-2222
- AV1: `sys.md` lines 531, 890, 2751
- WiFi: `sys.md` lines 1756, 1774, 6289
- Bluetooth: `sys.md` lines 614, 851, 1461
- Cedar VPU: `sys.md` lines 855, 1463-1466
- Panel config: `Reserve0.md` lines 17-19

### U-Boot Log
Location: `/home/luca/Desktop/hy300-linux-porting/phases/Task015_UART-Uboot.log`

**Critical Sections:**
- Boot sequence: Lines 27-105
- DRAM init: Lines 320-381
- Device tree errors: Lines 742-747, 753-758
- Memory addresses: Lines 836-872
- Panel config loading: Lines 917-993

### Existing Research
Location: `/home/luca/Desktop/hy300-linux-porting/research/`

**Relevant Files:**
- `sun50i-h713-hy300.dts` - Research device tree (needs updating)
- `docs/AIC8800_WIFI_DRIVER_REFERENCE.md` (if exists)
- `firmware/` - Any extracted firmware blobs

---

## ⚠️ Warnings & Safety Notes

### Before Phase III (U-Boot Replacement):
1. ✅ ALL Tier 1 files must be backed up
2. ✅ Memory map must be documented
3. ✅ UART FEL recovery must be tested
4. ✅ Device B must remain untouched as reference

### Device Tree Risks:
- Factory DTB has errors (FDT_ERR_NOTFOUND)
- OP-TEE expects external DTB (currently missing)
- PWM nodes missing (affects LED and fan control)
- eMMC high-speed modes deleted by U-Boot

### WiFi/BT Risks:
- Proprietary firmware, no open-source alternative
- Driver is kernel version-specific
- May not work with mainline kernel without porting
- Backup is **mandatory** - cannot be recovered if lost

---

## 📝 Next Steps (Immediate)

1. **START IMMEDIATELY:** Task 016 (Firmware backup)
2. **THEN:** Task 017 (Reserve0 extraction)
3. **THEN:** Task 018 (Device tree analysis)
4. **DOCUMENT:** All findings in phase2-uart-access/
5. **UPDATE:** PHASE2_RISK_ASSESSMENT.md with these findings

**Estimated Total Time:** 3-4 hours for all critical tasks

**Gate for Phase III:** All Tier 1 files must be backed up and verified before ANY bootloader modifications.

---

**Document Version:** 1.0  
**Last Updated:** 2025-11-08  
**Next Review:** Before Phase III execution
