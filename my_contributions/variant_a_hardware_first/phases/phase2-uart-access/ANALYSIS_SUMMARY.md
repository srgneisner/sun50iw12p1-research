# Device Tree Analysis - Summary of Findings

**Analysis Date:** 2025-11-08  
**Analyst:** AI Analysis of FullDir.xml + U-Boot Logs  
**Status:** ✅ COMPLETE - Ready for Action

---

## 🎯 Executive Summary

Comprehensive analysis of HY300's complete filesystem tree (364,535 files, 42,583 directories) combined with UART boot logs has revealed **critical hardware information** and identified **6 immediate action tasks** required before Phase III.

### Top Priorities (Must Complete ASAP):
1. **Task 016:** Backup AIC8800 WiFi/BT firmware (CRITICAL - 40+ proprietary files)
2. **Task 017:** Extract Reserve0 calibration data (CRITICAL - irreplaceable panel config)
3. **Task 018:** Extract and analyze device tree (HIGH - multiple boot errors identified)

---

## 📁 Where the Important Information Is Located

### 1. WiFi/Bluetooth Hardware (AIC8800 Chip)

**Firmware Location (ON DEVICE):**
```
/vendor/firmware/aic8800/
├── fmacfw_8800d80.bin          ← WiFi MAC firmware
├── fmacfw_8800d80_h_u02.bin    ← Hardware rev U02
├── fw_patch_8800d80.bin        ← Patches
├── lmacfw_rf_8800d80.bin       ← RF firmware
├── fw_adid_8800d80.bin         ← Audio/Device ID
└── [40+ more .bin files]       ← Different chip revisions (8800dc)
```

**Driver Info (IN ANALYSIS):**
- **Filesystem Analysis:** `device-tree-analysis/sys.md`
  - Lines 1756, 1774: `/sys/class/net/wlan0` (active WiFi)
  - Lines 614, 851, 1461: Bluetooth subsystem entries
  - Line 6289: wlan0 device node details

**Evidence (IN LOGS):**
- No specific log entries (runs in kernel, not U-Boot stage)

**Status:** ❌ NO OPEN-SOURCE ALTERNATIVE - Must backup proprietary blobs

---

### 2. Display/Panel Configuration

**Critical Files (ON DEVICE):**
```
/Reserve0/
├── panel_config.ini      ← Panel timings, resolution, sync (2525 bytes)
├── pq_colortemp.ini      ← Color temperature calibration
└── prj_mode              ← Projection mode (front/ceiling/rear)

/vendor/firmware/
├── display.bin           ← Display controller firmware (1.2 MB)
└── LogoRegData.bin       ← Logo and register data

/vendor/etc/display/mips/
├── database.TSE          ← MIPS display database (282 KB)
├── pq_custom.TSE         ← Picture quality custom (15 KB)
├── projecttable.TSE      ← Project table (1.3 KB)
└── ProjectID_0x0034.TSE  ← Project-specific config (17 KB)
```

**Evidence (IN LOGS):** `Task015_UART-Uboot.log`
```
Line 917: zztest--try to get panel_config.ini from /oem
Line 937: zztest--/oem/panel_config.ini is no exsists ,get panel_config.ini from Reserve0
Line 939: 2525 bytes read in 1 ms (2.4 MiB/s)  ← CONFIRMS FILE SIZE
Line 940: LogRegData.bin version is 25-4-10-157
Line 941: Project id:0x34 version:25-1-6-3     ← PROJECT IDENTIFIER
```

**Status:** 🔴 HARDWARE-CALIBRATED - Cannot be regenerated, must backup

---

### 3. GPU (Mali-G31)

**Driver Location (IN ANALYSIS):**
- **Filesystem:** `device-tree-analysis/sys.md`
  - Lines 530, 719-720: `/sys/devices/platform/.../1800000.gpu`
  - Line 1751: `/sys/class/misc/mali0`
  - Line 2151-2222: GPU device node with OPP table

**Device Tree (IN ANALYSIS):**
- `device-tree-analysis/sys.md` Line 2454: `gpu-opp-table` (frequency scaling)
- Memory-mapped address: `0x01800000`

**Evidence (IN LOGS):** Not in U-Boot (GPU initializes later in kernel)

**Status:** ✅ OPEN-SOURCE DRIVER AVAILABLE
- Use `lima` or `panfrost` driver in mainline kernel
- May need to extract proprietary libs from `/vendor/lib/egl/` for Android compatibility

---

### 4. Video Decoders (Cedar VPU + AV1)

**Driver Location (IN ANALYSIS):**
- **Filesystem:** `device-tree-analysis/sys.md`
  - Lines 855, 1463-1466: Cedar VE (Video Engine)
  - Lines 531, 890, 2751: AV1 hardware decoder at `1c0d000.av1`

**Device Tree (IN ANALYSIS):**
- AV1 decoder node: `1c0d000.av1` (memory address 0x1c0d000)
- Cedar aliases in device tree

**Status:**
- Cedar VPU: ✅ Mainline support via `cedrus` driver
- AV1 decoder: ⚠️ UNKNOWN - H713-specific, may need reverse engineering

---

### 5. Device Tree Issues

**Boot Errors (IN LOGS):** `Task015_UART-Uboot.log`
```
Line 742:  E/TC:0 0 init_external_dt:1033 Device Tree missing
Line 753:  E/TC:0   fdt_getprop_u32:336 prop trace_level not found
Line 836:  unable to find pwm led node in device tree.
Line 850:  Failed to get bl id property
Line 851:  Failed to get pwm_id property
Line 961:  ## error: update_fdt_dram_para : FDT_ERR_NOTFOUND
```

**Device Tree Location (ON DEVICE):**
```
/sys/firmware/fdt                    ← Running kernel DTB (binary)
/proc/device-tree/                   ← Exploded DT properties
/dev/block/by-name/dtb               ← DTB partition (backup)
/dev/block/by-name/dtbo              ← Device Tree Overlay
```

**Research Device Tree (ON HOST):**
```
/home/luca/Desktop/hy300-linux-porting/research/sun50i-h713-hy300.dts
```

**Status:** 🔴 CRITICAL - Multiple missing nodes, must extract and fix

---

### 6. Memory Configuration

**DRAM Parameters (IN LOGS):** `Task015_UART-Uboot.log`
```
Line 349: DRAM SIZE = 1024 M                  ← 1 GB DDR3
Line 332: DRAM CLK = 624 MHz                  ← Clock frequency
Line 335: DRAM Type = 3 (2:DDR2,3:DDR3)       ← DDR3 confirmed
Line 338: DRAMC ZQ value: 0x7b7bfb            ← Calibration value
Line 341: DRAM ODT value: 0x40                ← On-Die Termination
```

**Memory Layout (IN LOGS):**
```
Line 845: Relocation Offset: 0x35f0e000
Line 848: U-Boot loads at: 0x4a000000         ← CRITICAL for FEL
Line 945: FDT at: 0x77ebde70 → 0x77e8de70    ← Device tree address
```

**eMMC Storage (IN LOGS):**
```
Line 302: 7456 MB (7.3 GB)
Line 296: HSSDR52/DDR50, 50 MHz, 8-bit
Line 294: MMC 5.1
```

**Status:** ✅ DOCUMENTED - Ready for Phase III safety planning

---

## 📊 Analysis Files Created

### Primary Documentation
```
phases/phase2-uart-access/
└── CRITICAL_HARDWARE_FINDINGS.md    ← THIS FILE (comprehensive analysis)

device-tree-analysis/
├── README.md                         ← Index of all analysis files
├── sys.md (2.3 MB)                  ← Complete /sys/ tree (GPU, WiFi, drivers)
├── proc.md (13 MB)                  ← Process and kernel info
├── vendor.md (58 KB)                ← Vendor firmware and blobs
├── Reserve0.md (1.6 KB)             ← Calibration partition contents
├── dev.md (24 KB)                   ← Device nodes
└── [17 more .md files]              ← Complete filesystem breakdown
```

### U-Boot Analysis
```
phases/
├── Task015_UART-Uboot.log           ← Complete boot log (6345 lines)
└── phase2-uart-access/
    ├── BOOT_CHAIN_ANALYSIS.md       ← Boot sequence analysis
    ├── memory-map-uboot.md          ← Memory layout documentation
    └── CRITICAL_HARDWARE_FINDINGS.md ← This document
```

---

## 🚀 Immediate Next Steps

### Step 1: Execute Task 016 (NOW)
```bash
cd /home/luca/Desktop/hy300-linux-porting
mkdir -p backup/firmware/aic8800 backup/firmware/display-mips

# Start firmware backup
adb pull /vendor/firmware/aic8800/ ./backup/firmware/aic8800/
adb pull /vendor/firmware/display.bin ./backup/firmware/
adb pull /vendor/firmware/LogoRegData.bin ./backup/firmware/
adb pull /vendor/etc/display/mips/ ./backup/firmware/display-mips/
```

**Time:** 30 minutes  
**Risk:** None (read-only)  
**Blocker:** Phase III cannot proceed without this

### Step 2: Execute Task 017 (NEXT)
```bash
# Backup Reserve0 partition
adb shell su -c "dd if=/dev/block/by-name/Reserve0 of=/sdcard/Reserve0.img"
adb pull /sdcard/Reserve0.img ./backup/partitions/

# Extract files
adb pull /Reserve0/panel_config.ini ./backup/Reserve0/
adb pull /Reserve0/pq_colortemp.ini ./backup/Reserve0/
adb pull /Reserve0/prj_mode ./backup/Reserve0/
```

**Time:** 15 minutes  
**Risk:** None (read-only)  
**Blocker:** Display won't work in mainline without this

### Step 3: Execute Task 018 (THEN)
```bash
# Extract device tree
adb shell su -c "cat /sys/firmware/fdt" > backup/device-tree/running-kernel.dtb

# Decompile
dtc -I dtb -O dts -o backup/device-tree/running-kernel.dts backup/device-tree/running-kernel.dtb

# Analyze
diff -u research/sun50i-h713-hy300.dts backup/device-tree/running-kernel.dts > backup/device-tree/diff.txt
```

**Time:** 45 minutes  
**Risk:** None (read-only)  
**Blocker:** Mainline kernel needs corrected DT

### Step 4: Verify All Backups
```bash
# Run validation
./phases/phase2-uart-access/validate-all-backups.sh

# Or manually check:
test -f backup/firmware/aic8800/fmacfw_8800d80.bin && echo "✓ WiFi firmware backed up"
test -f backup/Reserve0/panel_config.ini && echo "✓ Panel config backed up"
test -f backup/device-tree/running-kernel.dtb && echo "✓ Device tree backed up"
```

### Step 5: Update Phase 2 Documentation
```bash
# Mark tasks as complete
mv tasks/pending/016-extract-critical-firmware-blobs.md tasks/completed/
mv tasks/pending/017-extract-reserve0-calibration.md tasks/completed/
mv tasks/pending/018-extract-device-tree-analysis.md tasks/completed/

# Update PHASE2A_MILESTONE.md
# Document findings in PHASE2_RISK_ASSESSMENT.md
```

---

## 📋 Task Files Created

All task files are now in `tasks/pending/`:

1. **016-extract-critical-firmware-blobs.md**
   - Priority: CRITICAL
   - Time: 30 min
   - Extracts AIC8800 WiFi/BT firmware + display blobs

2. **017-extract-reserve0-calibration.md**
   - Priority: CRITICAL
   - Time: 15 min
   - Backs up panel calibration data

3. **018-extract-device-tree-analysis.md**
   - Priority: HIGH
   - Time: 45 min
   - Extracts and analyzes device tree for mainline corrections

4. **019-document-memory-map.md** (to be created)
   - Priority: HIGH
   - Time: 30 min
   - Complete memory map for FEL safety

5. **020-wifi-bt-driver-analysis.md** (to be created)
   - Priority: MEDIUM
   - Time: 1-2 hours
   - Kernel module analysis and porting strategy

6. **021-hardware-validation-test-plan.md** (to be created)
   - Priority: MEDIUM
   - Time: 1 hour
   - Test matrix for Phase IV validation

---

## ✅ What We Now Know (Summary)

### Hardware Confirmed:
- ✅ WiFi/BT: AIC8800 chip (proprietary firmware required)
- ✅ GPU: Mali-G31 at 0x01800000 (lima/panfrost compatible)
- ✅ Video: Cedar VPU + H713 AV1 decoder
- ✅ Display: Custom panel with calibration in Reserve0
- ✅ Memory: 1GB DDR3 @ 624 MHz, 7.3 GB eMMC
- ✅ Project ID: 0x34, Version: 25-1-6-3

### Critical Files Identified:
- ✅ 40+ AIC8800 firmware files in `/vendor/firmware/aic8800/`
- ✅ Panel config in `/Reserve0/panel_config.ini` (2525 bytes)
- ✅ Display firmware in `/vendor/firmware/display.bin` (1.2 MB)
- ✅ MIPS display files in `/vendor/etc/display/mips/`

### Device Tree Issues:
- ❌ PWM LED node missing (causes backlight failure)
- ❌ DRAM parameter update fails (FDT_ERR_NOTFOUND)
- ❌ OP-TEE expects external DTB (currently missing)
- ❌ Multiple property lookup failures

### Next Phase Readiness:
- ⚠️ Phase III: BLOCKED until Tasks 016-018 complete
- ⚠️ Phase IV: Device tree must be corrected first
- ⚠️ Phase V: WiFi/BT driver porting strategy needed

---

## 🔗 Quick Links

**Task Files:**
- [Task 016: Extract Firmware](../../../tasks/pending/016-extract-critical-firmware-blobs.md)
- [Task 017: Extract Reserve0](../../../tasks/pending/017-extract-reserve0-calibration.md)
- [Task 018: Analyze Device Tree](../../../tasks/pending/018-extract-device-tree-analysis.md)

**Analysis Files:**
- [Device Tree Analysis Index](../../../device-tree-analysis/README.md)
- [sys.md - Hardware Drivers](../../../device-tree-analysis/sys.md)
- [vendor.md - Firmware Blobs](../../../device-tree-analysis/vendor.md)
- [Reserve0.md - Calibration](../../../device-tree-analysis/Reserve0.md)

**Phase Documentation:**
- [Phase 2 README](README.md)
- [UART Bootloader Safety Protocol](UART_BOOTLOADER_SAFETY_PROTOCOL.md)
- [Recovery Template](../RECOVERY_TEMPLATE.md)

**Logs:**
- [Task 015 U-Boot Log](../Task015_UART-Uboot.log)

---

**Document Status:** ✅ COMPLETE  
**Action Required:** Execute Tasks 016, 017, 018 immediately  
**Estimated Time:** 1.5 hours total  
**Gate for Phase III:** ALL THREE TASKS MUST COMPLETE

---

*Generated: 2025-11-08 by AI analysis of 620k line filesystem dump + UART logs*
