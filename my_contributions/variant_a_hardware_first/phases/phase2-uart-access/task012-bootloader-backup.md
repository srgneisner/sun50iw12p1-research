# Bootloader Backup Procedure - Task 012
# Device: HY300 (sun50iw12)
# Phase: II.B - U-Boot Environment Analysis (STEP 6)
# Status: READY TO EXECUTE

## Overview

Complete backup of bootloader partitions from eMMC using U-Boot console. This is **CRITICAL** for recovery procedures in Phase III.

---

## Partition Layout Reference

From `mmc part` output (TASK010_CHECKLIST.log):

```
Partition Map for MMC device 2 -- Partition Type: EFI/GPT

Part    Start LBA    End LBA       Name
  1     0x00012000   0x00021fff   "bootloader_a"
  2     0x00022000   0x00031fff   "bootloader_b"
  3     0x00032000   0x000321ff   "env_a"
  4     0x00032200   0x000323ff   "env_b"
  5     0x00032400   0x000523ff   "boot_a"
  6     0x00052400   0x000723ff   "boot_b"
```

**Size Calculations:**
- bootloader_a/b: Each 64 KB (0x10000 bytes)
  - Start LBA 0x12000, length: 0x21fff - 0x12000 + 1 = 0x10000
  - In sectors (512 bytes): 0x10000 / 512 = 0x20 (32 sectors)

- env_a/b: Each 512 bytes
  - Start LBA 0x32000, length: 0x321ff - 0x32000 + 1 = 0x200
  - In sectors: 0x200 / 512 = 0x01 (1 sector)

- boot_a/b: Each 128 KB (typical kernel partition)
  - Start LBA 0x32400, length: 0x523ff - 0x32400 + 1 = 0x20000
  - In sectors: 0x20000 / 512 = 0x40 (64 sectors)

---

## Bootloader Backup Commands

### Method 1: Using U-Boot `mmc read` Command

**Command Syntax:**
```bash
=> mmc read <address> <blk#> <cnt>
   # address: memory address to read into
   # blk#: starting block number
   # cnt: number of blocks to read
```

### Backup Procedure

#### Step 1: Connect to U-Boot Console

```bash
# On host machine:
$ screen /dev/ttyACM0 115200

# Wait for U-Boot prompt:
=>
```

---

#### Step 2: Set MMC Device (Already Configured)

```bash
=> mmc dev 2
mmc2(part 0) is current device
```

Already set from previous commands in TASK010.

---

#### Step 3: Backup bootloader_a Partition (64 KB)

**Partition Info:**
- Start: Block 0x12000
- Size: 32 sectors (0x20 sectors = 0x10000 bytes)

**Command:**
```bash
=> mmc read 0x40000000 0x12000 0x20
```

**Verify:**
```bash
=> md.l 0x40000000 0x20
40000000: [bootloader code here...]
```

**Save to Host:**
```bash
# In U-Boot (if available):
=> fatwrite mmc 0:1 0x40000000 bootloader_a.bin 0x10000

# Or via UART download (after boot):
# Load to host using serial monitor

# Alternative: Extract via ADB after boot
$ adb shell "dd if=/dev/mmcblk0 bs=512 skip=$((0x12000)) count=$((0x20))" > bootloader_a.bin
```

---

#### Step 4: Backup bootloader_b Partition (64 KB)

**Partition Info:**
- Start: Block 0x22000
- Size: 32 sectors (0x20)

**Command:**
```bash
=> mmc read 0x40000000 0x22000 0x20
```

**Save:**
```bash
=> md.l 0x40000000 0x20  # Verify
# Save bootloader_b.bin
```

---

#### Step 5: Backup env_a Partition (512 bytes)

**Partition Info:**
- Start: Block 0x32000
- Size: 1 sector (0x01)

**Command:**
```bash
=> mmc read 0x40000000 0x32000 0x01
```

**Verify:**
```bash
=> md.b 0x40000000 0x200
```

---

#### Step 6: Backup env_b Partition (512 bytes)

**Partition Info:**
- Start: Block 0x32200
- Size: 1 sector (0x01)

**Command:**
```bash
=> mmc read 0x40000000 0x32200 0x01
```

---

#### Step 7: Backup boot_a Partition (128 KB - Kernel)

**Partition Info:**
- Start: Block 0x32400
- Size: 64 sectors (0x40)

**Command:**
```bash
=> mmc read 0x40000000 0x32400 0x40
```

**Note:** This may take a moment (128 KB transfer)

---

#### Step 8: Backup boot_b Partition (128 KB - Recovery Kernel)

**Partition Info:**
- Start: Block 0x52400
- Size: 64 sectors (0x40)

**Command:**
```bash
=> mmc read 0x40000000 0x52400 0x40
```

---

## Data Transfer Methods

### Method A: UART Serial Download (Recommended)

After reading into memory, download via UART to host:

1. **Prepare in U-Boot:**
   ```bash
   => mmc read 0x40000000 0x12000 0x20
   => loadx 0x40000000  # Start XMODEM receive (waits for upload)
   ```

2. **On Host - Send File via UART:**
   ```bash
   # Using sx/sb (XMODEM) from lrzsz package:
   $ sx bootloader_a.bin -X < /dev/ttyACM0 > /dev/ttyACM0
   
   # Or within screen session:
   # Ctrl-A, Ctrl-S (send file)
   # Specify bootloader_a.bin
   ```

3. **Verify Transfer:**
   - U-Boot reports bytes received
   - File size matches expected

---

### Method B: ADB After Boot (Alternative)

After device boots into Android:

```bash
# Backup all bootloader partitions at once:
$ adb shell su -c "dd if=/dev/mmcblk0 bs=512 skip=$((0x12000)) count=$((0x20 + 0x20 + 0x01 + 0x01 + 0x40 + 0x40))" > bootloader_backup_complete.bin

# Or individual partitions:
$ adb shell su -c "dd if=/dev/mmcblk0 bs=512 skip=$((0x12000)) count=$((0x20))" > bootloader_a.bin
$ adb shell su -c "dd if=/dev/mmcblk0 bs=512 skip=$((0x22000)) count=$((0x20))" > bootloader_b.bin
$ adb shell su -c "dd if=/dev/mmcblk0 bs=512 skip=$((0x32000)) count=$((0x01))" > env_a.bin
$ adb shell su -c "dd if=/dev/mmcblk0 bs=512 skip=$((0x32200)) count=$((0x01))" > env_b.bin
$ adb shell su -c "dd if=/dev/mmcblk0 bs=512 skip=$((0x32400)) count=$((0x40))" > boot_a.bin
$ adb shell su -c "dd if=/dev/mmcblk0 bs=512 skip=$((0x52400)) count=$((0x40))" > boot_b.bin
```

**Advantages:**
- Simpler command line
- Faster transfer (ADB vs serial)
- Can compress during transfer

**Disadvantages:**
- Requires working Android system
- Needs ADB root access

---

### Method C: Linux Block Device (After Mainline Boot)

Once mainline Linux boots:

```bash
# Direct device read:
$ dd if=/dev/mmcblk0 bs=512 skip=0x12000 count=0x20 of=bootloader_a.bin
$ dd if=/dev/mmcblk0 bs=512 skip=0x22000 count=0x20 of=bootloader_b.bin
$ dd if=/dev/mmcblk0 bs=512 skip=0x32000 count=0x01 of=env_a.bin
$ dd if=/dev/mmcblk0 bs=512 skip=0x32200 count=0x01 of=env_b.bin
$ dd if=/dev/mmcblk0 bs=512 skip=0x32400 count=0x40 of=boot_a.bin
$ dd if=/dev/mmcblk0 bs=512 skip=0x52400 count=0x40 of=boot_b.bin
```

---

## Backup File Organization

### Recommended Directory Structure

```
backup/
├── bootloader/
│   ├── bootloader_a.bin        (64 KB)
│   ├── bootloader_b.bin        (64 KB)
│   ├── env_a.bin               (512 B)
│   ├── env_b.bin               (512 B)
│   ├── boot_a.bin              (128 KB - kernel)
│   ├── boot_b.bin              (128 KB - recovery kernel)
│   ├── BACKUP_MANIFEST.txt     (metadata)
│   └── BACKUP_CHECKSUMS.sha256
```

### Backup Manifest Template

```
# HY300 Bootloader Backup Manifest
# Date: 2025-11-06
# Device Serial: HYTY22507211231
# Factory OS: Android (factory firmware)

## Partition Information

bootloader_a.bin
- Source: /dev/mmcblk0 offset 0x12000, size 0x10000 (64 KB)
- GPT Partition: bootloader_a
- Purpose: Primary bootloader (U-Boot)
- Status: Critical - Required for boot

bootloader_b.bin
- Source: /dev/mmcblk0 offset 0x22000, size 0x10000 (64 KB)
- GPT Partition: bootloader_b
- Purpose: Backup bootloader (A/B partition)
- Status: Critical - Required for A/B boot

env_a.bin
- Source: /dev/mmcblk0 offset 0x32000, size 0x200 (512 B)
- GPT Partition: env_a
- Purpose: U-Boot environment variables (primary)
- Status: Important - Contains boot configuration

env_b.bin
- Source: /dev/mmcblk0 offset 0x32200, size 0x200 (512 B)
- GPT Partition: env_b
- Purpose: U-Boot environment variables (backup)
- Status: Important - Backup configuration

boot_a.bin
- Source: /dev/mmcblk0 offset 0x32400, size 0x20000 (128 KB)
- GPT Partition: boot_a
- Purpose: Linux kernel (primary boot image)
- Status: Critical - Required for OS boot

boot_b.bin
- Source: /dev/mmcblk0 offset 0x52400, size 0x20000 (128 KB)
- GPT Partition: boot_b
- Purpose: Recovery kernel (recovery/update)
- Status: Important - Used for system recovery

## Backup Checksum Information

MD5: [calculated when files created]
SHA256: [calculated when files created]

## Recovery Usage

To restore any partition:
1. Connect UART console
2. Enter U-Boot
3. Use: mmc write <addr> <block> <count>
4. Example: mmc write 0x40000000 0x12000 0x20

## Notes

- All offsets are in 512-byte sectors
- Size values are in sectors (multiply by 512 for bytes)
- A/B partitions allow fallback if one is corrupted
- Complete backup required before Phase III modifications
```

---

## Verification Procedures

### Calculate Checksums

```bash
$ sha256sum backup/bootloader/*.bin > backup/bootloader/BACKUP_CHECKSUMS.sha256
$ cat backup/bootloader/BACKUP_CHECKSUMS.sha256
```

### Verify File Sizes

```bash
# Expected sizes:
$ ls -lh backup/bootloader/*.bin

-rw-r--r-- 1 luca luca  64K Nov  6 12:00 bootloader_a.bin
-rw-r--r-- 1 luca luca  64K Nov  6 12:00 bootloader_b.bin
-rw-r--r-- 1 luca luca 512B Nov  6 12:00 env_a.bin
-rw-r--r-- 1 luca luca 512B Nov  6 12:00 env_b.bin
-rw-r--r-- 1 luca luca 128K Nov  6 12:00 boot_a.bin
-rw-r--r-- 1 luca luca 128K Nov  6 12:00 boot_b.bin
```

### Verify Contents (Magic Numbers)

```bash
# U-Boot magic number: 0x27051956
$ hexdump -C backup/bootloader/bootloader_a.bin | head -10
00000000  27 05 19 56 ...

# Kernel magic: 0x04b4 (ARM64 Image)
$ hexdump -C backup/bootloader/boot_a.bin | head -10
00000000  41 52 4d 64 ...  (ARMd...)
```

---

## Phase III Recovery Usage

These backups will be used if Phase III bootloader replacement fails:

### Recovery Procedure (via FEL Mode)

```bash
# 1. Power off device, hold recovery button
# 2. Connect USB, device enters FEL mode

# 3. Restore bootloader_a:
$ sunxi-fel write 0x40000000 backup/bootloader/bootloader_a.bin
$ sunxi-fel write 0x12000 0x40000000 0x10000

# 4. Restore U-Boot environment:
$ sunxi-fel write 0x40000000 backup/bootloader/env_a.bin
$ sunxi-fel write 0x32000 0x40000000 0x200

# 5. Restore boot kernel:
$ sunxi-fel write 0x40000000 backup/bootloader/boot_a.bin
$ sunxi-fel write 0x32400 0x40000000 0x20000

# 6. Reset device and verify boot
```

---

## Status

**Task 012: Bootloader Backup** - ✅ Procedure Documented

### Ready to Execute

This procedure is ready to be executed when Phase II.B STEP 6 is run with extended commands.

### Commands to Run

```bash
# Connect via UART and execute:
=> mmc dev 2
=> mmc read 0x40000000 0x12000 0x20
=> [save bootloader_a.bin]
=> mmc read 0x40000000 0x22000 0x20
=> [save bootloader_b.bin]
=> mmc read 0x40000000 0x32000 0x01
=> [save env_a.bin]
=> mmc read 0x40000000 0x32200 0x01
=> [save env_b.bin]
=> mmc read 0x40000000 0x32400 0x40
=> [save boot_a.bin]
=> mmc read 0x40000000 0x52400 0x40
=> [save boot_b.bin]
```

### Alternative: ADB Method (Simpler)

From Device A (if Android still boots after Phase II.A):

```bash
$ adb shell su -c "dd if=/dev/mmcblk0 bs=512 skip=$((0x12000)) count=$((0x20))" > bootloader_a.bin
$ adb shell su -c "dd if=/dev/mmcblk0 bs=512 skip=$((0x22000)) count=$((0x20))" > bootloader_b.bin
$ adb shell su -c "dd if=/dev/mmcblk0 bs=512 skip=$((0x32000)) count=$((0x01))" > env_a.bin
$ adb shell su -c "dd if=/dev/mmcblk0 bs=512 skip=$((0x32200)) count=$((0x01))" > env_b.bin
$ adb shell su -c "dd if=/dev/mmcblk0 bs=512 skip=$((0x32400)) count=$((0x40))" > boot_a.bin
$ adb shell su -c "dd if=/dev/mmcblk0 bs=512 skip=$((0x52400)) count=$((0x40))" > boot_b.bin
```

### Verification

```bash
$ sha256sum *.bin
$ ls -lh backup/bootloader/
```

---

## Critical: Before Proceeding to Phase III

✅ **MUST HAVE:**
- [ ] bootloader_a.bin backed up and verified
- [ ] bootloader_b.bin backed up and verified
- [ ] env_a.bin backed up and verified
- [ ] env_b.bin backed up and verified
- [ ] boot_a.bin backed up and verified
- [ ] boot_b.bin backed up and verified
- [ ] All checksums verified
- [ ] Backup copies stored on multiple locations
- [ ] Recovery procedure tested (optional but recommended)

**Phase III cannot proceed** until bootloader backup is complete and verified.

---

## References

- `backup/uboot_board_info.txt` - MMC device info
- `phases/phase2-uart-access/TASK010_CHECKLIST.log` - Partition table
- `phases/phase2-uart-access/boot-script-analysis.md` - Boot partition info
- `PHASE_II_RECOVERY_PROCEDURES.md` - FEL mode recovery

**Status: Ready for Execution Phase II.B STEP 6**
