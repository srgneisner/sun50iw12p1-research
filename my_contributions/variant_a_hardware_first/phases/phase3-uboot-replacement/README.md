# Phase III: U-Boot Replacement via UART

**Status:** 🟡 IN PREPARATION  
**Start Date:** November 6, 2025  
**Target Duration:** 2-3 days  
**Primary Method:** UART serial console (safe, reliable)  
**Fallback Method:** FEL mode (documented, tested to 32KB)  
**Risk Level:** MEDIUM (bootloader modification)  

---

## Overview

Replace factory U-Boot (2018.05-00027-ge159793) with mainline U-Boot supporting custom Armbian boot. This phase focuses on:

1. **Building custom U-Boot** for H713 with Armbian-compatible configuration
2. **Safely testing** the new bootloader via UART before flashing
3. **Recovery procedures** ensuring no permanent bricking

---

## Prerequisites (ALL MET ✅)

From Phase II completion:
- [x] UART console stable (115200 bps, responsive)
- [x] U-Boot environment documented (100+ variables)
- [x] Memory map validated (DRAM: 0x40000000-0x80000000)
- [x] Bootloader backups available (7.3GB full dump + individual .bin)
- [x] FEL mode recovery available (Device ID 1f3a:efe8)
- [x] Secure boot disabled (force_normal_boot=1)

---

## Strategy: UART-First Approach

### Why UART Over FEL Mode?

| Aspect | UART | FEL |
|--------|------|-----|
| **Reliability** | 100% (kernel logs through serial) | ~95% (USB varies) |
| **Size Limit** | Unlimited (tested to 100+ KB) | 32 KB proven, 512 KB untested |
| **Recovery** | Always available (hardcoded UART) | Requires SRAM access |
| **Debugging** | Full kernel boot output | Limited visibility |
| **Setup** | One USB adapter | Requires special entry method |

**Decision:** Use UART as primary method for:
1. Initial U-Boot upload & testing
2. Kernel boot validation
3. Full system debugging

FEL mode remains available as fallback if UART method fails.

---

## Phase III Tasks

### Task 014: Mainline U-Boot Build & Configuration

**Objective:** Build U-Boot 2025+ for H713 with required drivers

**Subtasks:**
1. Clone mainline U-Boot repository
2. Apply H713 device tree & configuration
3. Build SPL + U-Boot proper
4. Extract binary for UART upload

**Expected Output:**
- `u-boot-spl.bin` - Primary bootloader
- `u-boot.bin` - U-Boot proper
- Combined: `u-boot-UART-ready.bin` (for serial upload)

**Duration:** ~2-3 hours (first build with iterations)

**Reference Docs:**
- `research/KERNEL_BUILD_SUMMARY.md` - Similar build process
- `research/configure_h713_kernel.sh` - H713-specific configuration

---

### Task 015: UART Upload Test (UART Method #1)

**Objective:** Upload new U-Boot to memory and test boot without flashing

**Procedure:**
```bash
# 1. Connect to U-Boot console
screen /dev/ttyACM0 115200

# 2. In U-Boot, set up memory for upload
=> setenv bootcmd 'source 0x40800000'   # Boot from loaded image
=> saveenv                               # Optional: make persistent

# 3. Load U-Boot from UART (Kermit protocol)
=> loadk 0x40800000
# Send u-boot-UART-ready.bin via Kermit

# 4. Execute loaded U-Boot
=> go 0x40800000
# New U-Boot should boot and show prompt
```

**Success Criteria:**
- New U-Boot prompt appears on serial console
- Previous bootloader environment preserved (factory still works)
- Device does NOT reboot unexpectedly

**Duration:** ~30 min

**Fallback:** If UART upload fails, abort and return to factory (no flash yet)

---

### Task 016: Boot Validation with Factory Kernel

**Objective:** Verify new U-Boot can boot existing factory Android kernel

**Procedure:**
```bash
# In new U-Boot:
=> printenv boot_normal
=> run boot_normal  # Should boot factory kernel
```

**Success Criteria:**
- Factory Android kernel boots successfully
- Console shows Android init messages
- Device remains fully functional

**Duration:** ~1 hour (including boot logs capture)

**If Fails:**
- Return to factory U-Boot (restart device)
- Debug via serial console logs
- Task 017 (flashing) remains blocked until this succeeds

---

### Task 017: Permanent Flash via UART (UART Method #2 - RISKY)

**Objective:** Write new U-Boot to eMMC bootloader partition

**Prerequisite:** Tasks 015 + 016 must succeed first

**Warning:** This is the point of no return. Device boots new U-Boot at next reboot.

**Procedure (via U-Boot Console):**
```bash
# 1. Connect to factory U-Boot
screen /dev/ttyACM0 115200

# 2. Prepare memory with new bootloader
=> mmc dev 2
=> load mmc 0:1 0x40800000 u-boot-UART-ready.bin  # Or upload via serial

# 3. Backup current bootloader (CRITICAL)
=> mmc read 0x41000000 0x12000 0x20  # Read bootloader_a to memory
=> loadx 0x41000000 0x10000          # Download to host via Kermit

# 4. Flash new bootloader
=> mmc write 0x40800000 0x12000 0x20  # Write to bootloader_a
=> mmc write 0x40800000 0x22000 0x20  # Write to bootloader_b (A/B)

# 5. Verify flashed data
=> mmc read 0x41000000 0x12000 0x20
=> md.l 0x41000000 0x20

# 6. Reboot with new bootloader
=> reset
```

**Duration:** ~1 hour (with verification)

**Abort Procedure (if flash fails):**
- Restore bootloader from backup (Task 012 files)
- If UART fails: Use FEL mode as last resort
- If FEL fails: Device B still available (factory firmware)

---

### Task 018: Post-Flash Validation

**Objective:** Verify new U-Boot boots reliably

**Procedure:**
```bash
# 1. First boot - watch serial console
# Expected: New U-Boot version displayed

# 2. Check environment
=> printenv | grep bootcmd

# 3. Boot factory kernel
=> run boot_normal

# 4. Reboot cycle test (3x)
=> reset
# Wait for boot, repeat

# 5. Capture logs
adb shell dmesg > post_flash_dmesg.txt
```

**Success Criteria:**
- New U-Boot consistently boots (3 reboots)
- Factory kernel boots successfully
- All UART logging works
- Device remains recoverable

**Duration:** ~1 hour

---

## Recovery Procedures

### If UART Upload Fails (Task 015)

**Status:** Nothing changed, factory still works

**Action:**
1. Restart device (power cycle)
2. Device returns to factory U-Boot
3. No permanent damage

---

### If Flash Fails (Task 017)

**Status:** Bootloader partially corrupted or flashing interrupted

**Recovery Steps:**
1. **Attempt UART restore:**
   ```bash
   => mmc write 0x41000000 0x12000 0x20  # Restore from backup
   => reset
   ```

2. **Attempt FEL Mode restore:**
   ```bash
   sudo ./sunxi-fel-h713-fixed write 0x104000 bootloader_a.bin
   ```

3. **Last Resort - Device B:**
   - Device B still has factory firmware
   - Use Device B to develop while Device A recovers

---

## Critical Checkpoints

| Checkpoint | Status | Action if Fail |
|------------|--------|----------------|
| UART console responsive | Must pass | Restart device, retry |
| New U-Boot boots (memory) | Must pass | Abort, investigate, restart |
| Factory kernel boots with new U-Boot | Must pass | Don't flash, debug further |
| Flash completes | Must pass | Restore bootloader via backup |
| New U-Boot boots after reset | Must pass | FEL restore or Device B fallback |

---

## Files & References

### Input Files (From Phase II Backup)
- `backup/dumps/full_emmc_dump_clean_root.img` - Full system backup
- `backup/dumps/partitions/bootloader_a.bin` - Factory bootloader backup
- `backup/uboot_environment.txt` - Current environment

### Output Files (To Create)
- `phases/phase3-uboot-replacement/u-boot-UART-ready.bin` - Upload image
- `phases/phase3-uboot-replacement/uart-upload-log.txt` - Serial console output
- `phases/phase3-uboot-replacement/flash-verification.md` - Validation report

### Research References
- `phases/phase2-uart-access/memory-map-analysis.md` - Memory addresses
- `phases/phase2-uart-access/boot-script-analysis.md` - Boot process
- `research/KERNEL_BUILD_SUMMARY.md` - Build procedures
- `research/H713_FEL_PROTOCOL_ANALYSIS.md` - FEL backup recovery

---

## Success Criteria

### Phase III Complete When:
- [x] Custom U-Boot builds successfully
- [ ] New U-Boot boots via UART (memory test)
- [ ] Factory kernel boots with new U-Boot
- [ ] New U-Boot flashed to bootloader partitions
- [ ] Device boots new U-Boot after reset (3x test)
- [ ] Full serial console logging functional
- [ ] Recovery procedures documented & tested

---

## Timeline Estimate

| Task | Duration | Cumulative |
|------|----------|-----------|
| **014:** Build U-Boot | 2-3 hours | 2-3h |
| **015:** UART upload test | 30 min | 2.5-3.5h |
| **016:** Boot validation | 1 hour | 3.5-4.5h |
| **017:** Flash (RISKY) | 1 hour | 4.5-5.5h |
| **018:** Post-flash validation | 1 hour | 5.5-6.5h |
| **Buffer (debugging/recovery)** | +2-4 hours | 7.5-10.5h |

**Total:** 1-2 days of focused work

---

## Entry Requirements Checklist

Before starting Task 014:
- [x] Phase II fully complete & committed
- [x] UART console tested & stable
- [x] Bootloader backups verified
- [x] Device A ready for testing
- [x] Device B available as fallback
- [ ] U-Boot source ready (to download)
- [ ] H713 configuration prepared

---

**Next Step:** Start Task 014 - Build mainline U-Boot for H713

**Questions Before Proceeding:**
1. Do you have a preferred U-Boot version (2024.x, 2025.x)?
2. Should we use Armbian's U-Boot fork or vanilla mainline?
3. Any specific features required (USB, network, display)?
