---
id: "016"
title: "Extract Critical Firmware Blobs"
priority: "CRITICAL"
phase: "2"
status: "pending"
created: "2025-11-08"
estimated_time: "30 minutes"
blocks: ["Phase III - U-Boot replacement"]
---

# Task 016: Extract Critical Firmware Blobs

## Objective
Backup all critical proprietary firmware files from HY300 Device A, focusing on AIC8800 WiFi/BT firmware and display controller blobs. These files are **irreplaceable** and must be preserved before any system modifications.

## Priority Justification
🔴 **CRITICAL** - Without these firmware files:
- WiFi and Bluetooth will be completely non-functional
- Display initialization will fail
- No open-source alternatives exist for AIC8800 chip
- Cannot be recovered if lost during Phase III modifications

## Prerequisites
- [ ] ADB or SSH root access to Device A confirmed
- [ ] Minimum 500 MB free space on host machine
- [ ] `backup/firmware/` directory structure created
- [ ] Device A is NOT in use (exclusive access required)

## Steps

### 1. Prepare Backup Directory Structure
```bash
cd /home/luca/Desktop/hy300-linux-porting
mkdir -p backup/firmware/aic8800
mkdir -p backup/firmware/display-mips
mkdir -p backup/firmware/vendor-root
```

### 2. Extract AIC8800 WiFi/Bluetooth Firmware
```bash
# Pull entire AIC8800 firmware directory (40+ files)
adb pull /vendor/firmware/aic8800/ ./backup/firmware/aic8800/

# Verify file count (should be 40-50 files)
ls -la backup/firmware/aic8800/ | wc -l
```

**Expected Files (partial list):**
- `fmacfw_8800d80.bin` - WiFi MAC firmware
- `fmacfw_8800d80_h_u02.bin` - Hardware revision U02
- `fw_patch_8800d80.bin` - Firmware patches
- `lmacfw_rf_8800d80.bin` - RF radio firmware
- `fw_adid_8800d80.bin` - Audio/Device ID firmware
- Multiple `8800dc_*` variants (different chip revision)

### 3. Extract Display Controller Firmware
```bash
# Pull display binaries
adb pull /vendor/firmware/display.bin ./backup/firmware/
adb pull /vendor/firmware/LogoRegData.bin ./backup/firmware/

# Pull MIPS coprocessor files
adb pull /vendor/etc/display/mips/ ./backup/firmware/display-mips/
```

**Expected Files:**
- `display.bin` (~1.2 MB) - Main display controller firmware
- `LogoRegData.bin` - Logo and register data
- `mips/database.TSE` (282 KB)
- `mips/pq_custom.TSE` (15 KB)
- `mips/projecttable.TSE` (1.3 KB)
- `mips/ProjectID_0x0034.TSE` (17 KB) - Project-specific config

### 4. Pull Additional Vendor Firmware
```bash
# Pull entire vendor firmware directory for completeness
adb pull /vendor/firmware/ ./backup/firmware/vendor-root/

# Note: This may take 5-10 minutes due to large number of files
```

### 5. Generate Checksums
```bash
# Create checksum file for verification
cd backup/firmware
find . -type f -exec sha256sum {} \; > firmware-checksums.txt

# Count total files backed up
find . -type f | wc -l
```

### 6. Verify Backup Integrity
```bash
# Verify critical AIC8800 files exist
test -f aic8800/fmacfw_8800d80.bin && echo "✓ AIC8800 WiFi firmware present"
test -f display.bin && echo "✓ Display firmware present"
test -f LogoRegData.bin && echo "✓ Logo data present"
test -d display-mips && echo "✓ MIPS firmware directory present"

# Check file sizes (detect truncated files)
ls -lh display.bin | awk '{if ($5 ~ /^1/) print "✓ display.bin size OK: "$5; else print "✗ ERROR: display.bin size wrong: "$5}'
```

### 7. Create Backup Inventory
```bash
# Document what was backed up
cat > backup/firmware/INVENTORY.txt << EOF
HY300 Firmware Backup Inventory
Date: $(date)
Device: Device A

AIC8800 WiFi/BT Firmware:
$(ls -lh aic8800/ | wc -l) files

Display Firmware:
- display.bin: $(ls -lh display.bin | awk '{print $5}')
- LogoRegData.bin: $(ls -lh LogoRegData.bin | awk '{print $5}')

MIPS Firmware:
$(ls -lh display-mips/*.TSE)

Total backup size: $(du -sh .)
EOF
```

### 8. (Optional) Test on Device B
```bash
# Verify files are readable on reference device
adb -s <device_b_serial> shell ls -l /vendor/firmware/aic8800/ | head -5
adb -s <device_b_serial> shell md5sum /vendor/firmware/display.bin

# Compare checksums (should match Device A)
```

## Success Criteria
- [ ] Minimum 40 AIC8800 firmware files extracted
- [ ] `display.bin` file is ~1.2 MB
- [ ] All MIPS `.TSE` files present (4 files minimum)
- [ ] Checksums generated for all files
- [ ] No corrupted or truncated files
- [ ] Backup inventory created
- [ ] Total backup size is 5-20 MB (reasonable range)

## Expected Output
```
backup/firmware/
├── aic8800/
│   ├── fmacfw_8800d80.bin
│   ├── fmacfw_8800d80_h_u02.bin
│   ├── fw_patch_8800d80.bin
│   ├── lmacfw_rf_8800d80.bin
│   └── [36+ more files]
├── display-mips/
│   ├── database.TSE
│   ├── pq_custom.TSE
│   ├── projecttable.TSE
│   └── ProjectID_0x0034.TSE
├── display.bin
├── LogoRegData.bin
├── firmware-checksums.txt
└── INVENTORY.txt
```

## Troubleshooting

### Issue: "Permission denied" when pulling files
**Solution:**
```bash
# Ensure root access
adb root
adb shell su -c "chmod -R 755 /vendor/firmware"
adb pull /vendor/firmware/...
```

### Issue: "No such file or directory"
**Solution:**
```bash
# Find actual firmware location
adb shell find /vendor -name "aic8800" -type d
adb shell find /vendor -name "display.bin"
```

### Issue: Files are 0 bytes or corrupted
**Solution:**
```bash
# Check file on device first
adb shell ls -lh /vendor/firmware/display.bin
adb shell file /vendor/firmware/display.bin

# Try alternative pull method
adb shell su -c "cat /vendor/firmware/display.bin" > ./backup/firmware/display.bin
```

## Risk Assessment
- **Risk Level:** LOW (read-only operation)
- **Device Impact:** None (no modifications)
- **Recovery:** Not applicable (backup operation)

## Related Tasks
- Task 017: Extract Reserve0 Calibration Data (next)
- Task 020: WiFi/BT Driver Analysis (uses this backup)
- Phase III: All tasks (blocked until this completes)

## Related Documentation
- `CRITICAL_HARDWARE_FINDINGS.md` - Hardware analysis
- `phases/RECOVERY_TEMPLATE.md` - Recovery procedures
- `backup/backup_inventory.txt` - Previous backups

## Notes
- **DO NOT** modify any files on the device
- **DO NOT** proceed to Phase III until this task is complete
- Keep backup in multiple locations (external drive recommended)
- These files are proprietary and cannot be redistributed

## Validation Command
```bash
# Run this to verify backup is complete
cd /home/luca/Desktop/hy300-linux-porting
./phases/phase2-uart-access/validate-firmware-backup.sh
```

(Create validate script if needed)
