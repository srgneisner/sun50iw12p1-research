---
id: "017"
title: "Extract Reserve0 Calibration Data"
priority: "CRITICAL"
phase: "2"
status: "pending"
created: "2025-11-08"
estimated_time: "15 minutes"
blocks: ["Display initialization", "Phase IV kernel boot"]
---

# Task 017: Extract Reserve0 Calibration Data

## Objective
Extract hardware-calibrated display configuration from the `/Reserve0` partition. This partition contains panel timings, color temperature calibration, and projector mode settings that are **unique to each device** and cannot be regenerated.

## Priority Justification
🔴 **CRITICAL** - Without Reserve0 data:
- Display will not initialize (U-Boot log shows it reads from here)
- Panel timings will be incorrect (blank screen or distorted image)
- Color calibration will be lost (projector-specific values)
- No way to recover this data if partition is corrupted

## Prerequisites
- [ ] Root access to Device A confirmed
- [ ] `backup/Reserve0/` directory created
- [ ] Reserve0 partition is mounted (verify with `adb shell mount | grep Reserve0`)

## Background (from U-Boot Log)
```
[01.917]get file(prj_config.ini) size from media_data error
zztest---prj_mode=0
[02.037]get file(panel_config.ini) size from media_data error
zztest--/oem/panel_config.ini is no exsists ,get panel_config.ini from Reserve0
2525 bytes read in 1 ms (2.4 MiB/s)
[02.054]LogRegData.bin version is 25-4-10-157
[02.059]Project id:0x34 version:25-1-6-3
```

U-Boot **explicitly** falls back to Reserve0 when /oem is missing. This proves Reserve0 is critical.

## Steps

### 1. Verify Reserve0 Partition Exists
```bash
# Check if Reserve0 is mounted
adb shell mount | grep -i reserve

# Find Reserve0 block device
adb shell ls -l /dev/block/by-name/ | grep -i reserve
adb shell ls -l /dev/block/platform/*/by-name/ | grep -i reserve

# Expected: /dev/block/mmcblk0pX where X is partition number
```

### 2. Backup Entire Reserve0 Partition (Safest Method)
```bash
# Find partition size first
adb shell blockdev --getsize64 /dev/block/by-name/Reserve0

# Create full partition image
adb shell su -c "dd if=/dev/block/by-name/Reserve0 of=/sdcard/Reserve0.img bs=1M"

# Pull to host
adb pull /sdcard/Reserve0.img ./backup/partitions/Reserve0.img

# Clean up device
adb shell rm /sdcard/Reserve0.img

# Verify size (should be 16-32 MB based on "16K" from ls -lah)
ls -lh backup/partitions/Reserve0.img
```

### 3. Extract Individual Files from Mounted Partition
```bash
# List contents
adb shell ls -la /Reserve0/

# Expected files:
# - panel_config.ini
# - pq_colortemp.ini
# - prj_mode

# Pull each file
adb pull /Reserve0/panel_config.ini ./backup/Reserve0/
adb pull /Reserve0/pq_colortemp.ini ./backup/Reserve0/
adb pull /Reserve0/prj_mode ./backup/Reserve0/
```

### 4. Verify File Integrity
```bash
# Check file sizes
ls -lh backup/Reserve0/

# panel_config.ini should be ~2.5 KB (2525 bytes per U-Boot log)
# pq_colortemp.ini should be a few KB
# prj_mode may be small (just a mode byte)

# Display contents (text files)
cat backup/Reserve0/panel_config.ini
cat backup/Reserve0/pq_colortemp.ini
cat backup/Reserve0/prj_mode
```

### 5. Parse Panel Configuration (if readable)
```bash
# If panel_config.ini is text format
grep -E "width|height|hsync|vsync|clock|hfp|hbp|vfp|vbp" backup/Reserve0/panel_config.ini

# Document panel timings
cat > backup/Reserve0/PANEL_ANALYSIS.txt << EOF
Panel Configuration Analysis
Date: $(date)

File: panel_config.ini
Size: $(ls -lh backup/Reserve0/panel_config.ini | awk '{print $5}')

Key Parameters:
$(grep -i "=" backup/Reserve0/panel_config.ini | head -20)

Project ID: 0x34
Version: 25-1-6-3
EOF
```

### 6. Generate Checksums
```bash
cd backup/Reserve0
sha256sum * > checksums.txt

# Also checksum the partition image
cd ../partitions
sha256sum Reserve0.img >> ../Reserve0/checksums.txt
```

### 7. Create Human-Readable Dump
```bash
# Hex dump of partition (first 4KB for analysis)
adb shell su -c "dd if=/dev/block/by-name/Reserve0 bs=4096 count=1" | xxd > backup/Reserve0/partition-header.hex

# Strings dump (find readable text)
adb shell su -c "strings /dev/block/by-name/Reserve0" > backup/Reserve0/partition-strings.txt
```

## Success Criteria
- [ ] Complete Reserve0 partition image created
- [ ] All 3 individual files extracted (panel_config.ini, pq_colortemp.ini, prj_mode)
- [ ] panel_config.ini is exactly 2525 bytes (matches U-Boot log)
- [ ] Files contain readable configuration data
- [ ] Checksums generated
- [ ] Panel analysis document created

## Expected Output
```
backup/Reserve0/
├── panel_config.ini          # 2525 bytes
├── pq_colortemp.ini          # ~2-5 KB
├── prj_mode                  # Small file
├── checksums.txt             # SHA256 hashes
├── PANEL_ANALYSIS.txt        # Human-readable summary
├── partition-header.hex      # First 4KB hex dump
└── partition-strings.txt     # Readable strings

backup/partitions/
└── Reserve0.img              # Full partition (16-32 MB)
```

## Example panel_config.ini Format
```ini
[panel]
width=1920
height=1080
hsync_start=2000
hsync_end=2040
htotal=2200
vsync_start=1090
vsync_end=1095
vtotal=1125
clock=148500
flags=0x05

[calibration]
red_gain=255
green_gain=240
blue_gain=235
...
```

## Troubleshooting

### Issue: Reserve0 not mounted
**Solution:**
```bash
# Mount manually
adb shell su -c "mount -t vfat /dev/block/by-name/Reserve0 /Reserve0"

# Or if ext4
adb shell su -c "mount -t ext4 /dev/block/by-name/Reserve0 /Reserve0"

# Check filesystem type first
adb shell su -c "blkid /dev/block/by-name/Reserve0"
```

### Issue: Files not found in /Reserve0
**Solution:**
```bash
# Reserve0 might be at different mount point
adb shell find / -name "panel_config.ini" 2>/dev/null

# Or partition might not be mounted, extract from raw partition
adb shell su -c "dd if=/dev/block/by-name/Reserve0 of=/sdcard/Reserve0.img"
adb pull /sdcard/Reserve0.img .

# Mount locally to extract files
mkdir /tmp/reserve0_mount
sudo mount -o loop Reserve0.img /tmp/reserve0_mount
cp /tmp/reserve0_mount/* ./backup/Reserve0/
sudo umount /tmp/reserve0_mount
```

### Issue: Permission denied
**Solution:**
```bash
# Ensure root
adb root

# Or use su explicitly
adb shell su -c "cat /Reserve0/panel_config.ini" > backup/Reserve0/panel_config.ini
```

### Issue: Files are binary/unreadable
**Expected:** panel_config.ini might be binary format, not text. Hex dump will reveal structure.
```bash
xxd backup/Reserve0/panel_config.ini | head -50
```

## Risk Assessment
- **Risk Level:** LOW (read-only operation)
- **Device Impact:** None (no modifications)
- **Recovery:** Not applicable (backup operation)

## U-Boot Integration Notes
From boot log, U-Boot reads Reserve0 via:
1. Attempts to read from `/oem/panel_config.ini` (fails)
2. Falls back to `/Reserve0/panel_config.ini` (succeeds)
3. Loads into memory: 2525 bytes read in 1 ms
4. Project ID 0x34 detected
5. Version 25-1-6-3 confirmed

**For mainline U-Boot:** We must either:
- Keep Reserve0 partition intact
- OR hardcode panel timings into device tree
- OR implement Reserve0 reading in U-Boot environment

## Related Tasks
- Task 016: Extract Critical Firmware Blobs (prerequisite)
- Task 018: Extract and Analyze Device Tree (uses panel data)
- Phase IV: Display driver testing (needs panel timings)

## Related Documentation
- `CRITICAL_HARDWARE_FINDINGS.md` - Section 2 (Display Configuration)
- `device-tree-analysis/Reserve0.md` - Filesystem structure
- `Task015_UART-Uboot.log` - Lines 917-993 (Reserve0 loading)

## Next Steps After Completion
1. Parse panel_config.ini to extract LCD timings
2. Add panel timings to mainline device tree:
   ```dts
   &dsi {
       panel@0 {
           compatible = "panel-simple-dsi";
           ...
           display-timings {
               timing0 {
                   clock-frequency = <148500000>;
                   hactive = <1920>;
                   vactive = <1080>;
                   ...
               };
           };
       };
   };
   ```
3. Test display initialization with mainline kernel

## Validation Commands
```bash
# Verify backup completeness
test -f backup/Reserve0/panel_config.ini && echo "✓ panel_config.ini present"
test -s backup/Reserve0/panel_config.ini && echo "✓ panel_config.ini not empty"
test $(stat -c%s backup/Reserve0/panel_config.ini) -eq 2525 && echo "✓ panel_config.ini correct size"

# Verify partition image
test -f backup/partitions/Reserve0.img && echo "✓ Partition image present"
test -s backup/partitions/Reserve0.img && echo "✓ Partition image not empty"
```
