# Phase III Initialization Agent Prompt

**Date:** November 6, 2025  
**Purpose:** Comprehensive repository validation before Phase III bootloader modifications  
**Risk Level:** MEDIUM (bootloader changes)  
**Safety Mode:** STRICT - No hardware changes without explicit validation

---

## CRITICAL PRE-EXECUTION CHECKLIST

Agent MUST verify ALL of the following before proceeding to Phase III:

### 1. Project Structure & Documentation (READ-ONLY)

```bash
# Verify Phase I & II documentation exists and is complete
✅ phases/phase1-hardware-baseline/ - EXISTS and documented
✅ phases/phase2-uart-access/ - EXISTS, UART console verified
✅ phases/research-validation/RESEARCH_MAPPING.md - Phase II findings documented
✅ phases/phase3-uboot-replacement/ - EXISTS with README + QUICK_START
✅ backup/dumps/full_emmc_dump_clean_root.img - 7.3GB present (verify size)
✅ backup/dumps/partitions/bootloader_a.bin - 64KB bootloader backup exists
```

**Command:**
```bash
cd /home/luca/Desktop/hy300-linux-porting
ls -lah phases/phase*/README.md
ls -lah backup/dumps/full_emmc_dump_clean_root.img
ls -lah backup/dumps/partitions/bootloader_*.bin
```

**Success Criteria:** All files exist with correct sizes:
- Full dump: 7.3 GB ✅
- bootloader_a.bin: 64 KB ✅
- bootloader_b.bin: 64 KB ✅

---

### 2. UART Console Status (READ-ONLY)

Verify UART console configuration from Phase II is correct:

```bash
# Check documented UART parameters
cat phases/phase2-uart-access/TASK010_CHECKLIST.log | head -20
cat backup/uboot_board_info.txt | grep -i "uart\|serial\|115200"
```

**Expected Output:**
- Device: `/dev/ttyACM0`
- Baud rate: `115200 bps`
- Configuration: `8N1`
- Last successful connection: Nov 6, 2025

**Validation Commands (READ-ONLY - NO CHANGES):**
```bash
# DO NOT EXECUTE UNLESS UART CABLE CONNECTED
# screen /dev/ttyACM0 115200
# => version
# => printenv bootcmd
# (Then exit with Ctrl-A, Q)
```

---

### 3. Bootloader Backup Verification (READ-ONLY)

```bash
# Verify backup files integrity
sha256sum -c backup/checksums.sha256 2>/dev/null | grep -i "bootloader\|boot_"

# Check backup dates (should be recent - Nov 4-6)
stat backup/dumps/partitions/bootloader_a.bin | grep -i "modify\|access"
stat backup/dumps/full_emmc_dump_clean_root.img | grep -i "modify\|access"
```

**Success Criteria:**
- Backup files exist and checksums match
- Backup dates: Nov 4-6, 2025 (recent)
- Full dump size: Exactly 7.3 GB (7820083291 bytes)
- bootloader_a.bin: Exactly 64 KB (65536 bytes)

---

### 4. Git Repository Status (READ-ONLY)

```bash
# Check git status is clean
git status
git log --oneline | head -10

# Verify all Phase II commits present
git log --grep="Phase II" --oneline
git log --grep="Task 010" --oneline
git log --grep="Task 013" --oneline
```

**Success Criteria:**
- Working directory clean (no uncommitted changes)
- Latest commits visible:
  - ✅ Phase II completion report
  - ✅ RESEARCH_MAPPING.md with Phase II validations
  - ✅ Phase III structure initialization
  - ✅ FEL assessment documented

---

### 5. Device A Status Check (READ-ONLY)

```bash
# Check Device A current status (if UART connected):
# => printenv
# Check these variables:
# - bootcmd (should be: run setargs_mmc boot_normal)
# - force_normal_boot (should be: 1)
# - slot_suffix (should be: _a or _b)
# - bootdelay (should be: 1)

# Verify Device A still boots to Android:
# Power cycle Device A, watch for successful boot
# No errors on serial console
```

---

### 6. Device B Status (Factory Control)

```bash
# Verify Device B:
# Power on Device B
# Confirm it boots factory Android successfully
# Device B should NOT be modified during Phase III
```

**Success Criteria:**
- Device B boots normal Android
- Device B available as fallback
- Device B considered "safe" for return if Device A bricked

---

### 7. Phase III Documentation Validation (READ-ONLY)

```bash
# Verify Phase III docs are complete and accurate
cat phases/phase3-uboot-replacement/README.md | head -50
cat phases/phase3-uboot-replacement/QUICK_START_BUILD.md | head -50

# Check for recovery procedures
grep -r "Recovery\|recover\|restore" phases/phase3-uboot-replacement/
```

**Success Criteria:**
- Phase III README exists (2000+ lines)
- QUICK_START guide exists
- Recovery procedures documented
- Tasks 014-018 defined clearly
- UART-first strategy documented

---

### 8. Hardware Findings Cross-Reference (READ-ONLY)

```bash
# Verify Phase II findings in RESEARCH_MAPPING.md
grep -c "Phase II.B" phases/research-validation/RESEARCH_MAPPING.md
grep "CPU Model\|DRAM Configuration\|eMMC Storage\|Boot Partition\|Secure Boot\|SRAM Protected" \
  phases/research-validation/RESEARCH_MAPPING.md

# Should show 6+ findings with status ✅ Confirmed
```

**Success Criteria:**
- At least 6 Phase II.B findings documented
- All marked as ✅ Confirmed
- Cross-referenced with UART logs
- Memory addresses verified (DRAM: 0x40000000-0x80000000)
- Bootloader addresses confirmed (0x12000, 0x22000)

---

### 9. FEL Mode Status (READ-ONLY)

```bash
# Verify FEL research is documented (not required for UART method)
ls -la research/sunxi-fel*
cat research/USING_H713_FEL_MODE.md | head -20

# Check for known limitations
grep -i "limitation\|known\|issue\|32.*kb\|256" research/FEL_USB_WRITE_SUCCESS.md
```

**Success Criteria:**
- FEL tools available (sunxi-fel-h713-* binary)
- FEL limitations documented
- 32 KB writes confirmed working
- 512 KB chunk size identified as optimal
- SPL limitations noted (not tested)

---

### 10. Build Tools Availability (READ-ONLY)

```bash
# Check available build tools/environments
which arm-linux-gnueabi-gcc || echo "GCC not in PATH"
which nix-shell || echo "Nix not available"
which gcc || echo "Native GCC not available"

# Check for NixOS environment
cat research/flake.nix | head -20
ls -la research/nixos/ 2>/dev/null | head -10
```

**Success Criteria:**
- At least one build environment available:
  - ✅ Native GCC + ARM cross-compiler, OR
  - ✅ NixOS with build environment, OR
  - ✅ Docker environment prepared
- Build configuration files present (flake.nix, defconfig)

---

## VALIDATION EXECUTION SCRIPT

Run this to validate all checks:

```bash
#!/bin/bash
set -e

echo "===== PHASE III PRE-EXECUTION VALIDATION ====="
echo ""

# 1. Structure validation
echo "[1/10] Checking project structure..."
test -d phases/phase1-hardware-baseline && echo "✅ Phase I docs"
test -d phases/phase2-uart-access && echo "✅ Phase II docs"
test -d phases/phase3-uboot-replacement && echo "✅ Phase III structure"
test -f phases/research-validation/RESEARCH_MAPPING.md && echo "✅ Research mapping"

# 2. Backup validation
echo ""
echo "[2/10] Checking backups..."
test -f backup/dumps/full_emmc_dump_clean_root.img && \
  echo "✅ Full dump ($(du -h backup/dumps/full_emmc_dump_clean_root.img | cut -f1))"
test -f backup/dumps/partitions/bootloader_a.bin && echo "✅ Bootloader A backup"
test -f backup/dumps/partitions/bootloader_b.bin && echo "✅ Bootloader B backup"

# 3. Git status
echo ""
echo "[3/10] Checking git status..."
git status --short || echo "⚠️ Uncommitted changes detected"
echo "Latest commits:"
git log --oneline | head -5

# 4. Documentation completeness
echo ""
echo "[4/10] Checking Phase III docs..."
test -f phases/phase3-uboot-replacement/README.md && echo "✅ Phase III README"
test -f phases/phase3-uboot-replacement/QUICK_START_BUILD.md && echo "✅ Build guide"
wc -l phases/phase3-uboot-replacement/README.md | awk '{print "   (" $1 " lines)"}'

# 5. Build tools
echo ""
echo "[5/10] Checking build tools..."
which arm-linux-gnueabi-gcc >/dev/null && echo "✅ ARM GCC available" || echo "⚠️ ARM GCC not found"
which gcc >/dev/null && echo "✅ Native GCC available" || echo "⚠️ Native GCC not found"

# 6. Hardware findings
echo ""
echo "[6/10] Checking Phase II findings..."
grep -c "Validation Status.*Confirmed" phases/research-validation/RESEARCH_MAPPING.md | \
  xargs -I {} echo "✅ {} Phase II findings confirmed"

# 7. FEL documentation
echo ""
echo "[7/10] Checking FEL documentation..."
test -f research/FEL_USB_WRITE_SUCCESS.md && echo "✅ FEL write success documented"
grep -q "32.*kb.*working\|32.*KB" research/FEL_USB_WRITE_SUCCESS.md && echo "✅ 32 KB write limit confirmed"

# 8. Device files
echo ""
echo "[8/10] Checking device tree files..."
ls research/sun50i-h713-hy300*.dts* 2>/dev/null | head -3 | xargs -I {} echo "✅ {}"

# 9. Configuration files
echo ""
echo "[9/10] Checking build configs..."
test -f research/configs/hy300_h713_defconfig && echo "✅ H713 defconfig"
test -f research/configs/sun50i-h713-hy300_defconfig && echo "✅ H713 defconfig (alt)"

# 10. Serial console test (OPTIONAL - only if user confirms UART connected)
echo ""
echo "[10/10] UART console check (optional - press Enter to skip)..."
read -t 5 -p "Is UART cable connected? (y/n) " uart_check || uart_check="n"
if [ "$uart_check" = "y" ]; then
    echo "⚠️ MANUAL CHECK REQUIRED:"
    echo "   screen /dev/ttyACM0 115200"
    echo "   => version (should respond)"
    echo "   Ctrl-A Q to exit"
else
    echo "⏭️ Skipped UART check"
fi

echo ""
echo "===== VALIDATION COMPLETE ====="
echo ""
echo "If all checks passed (✅), Phase III is ready to initialize."
```

---

## DECISION GATE

**Agent proceeds to Phase III ONLY if ALL of the following are true:**

1. ✅ **Project structure complete** - All Phase I/II docs present
2. ✅ **Backups verified** - 7.3GB full dump + individual bootloader bins exist
3. ✅ **Git clean** - No uncommitted changes, all Phase II commits present
4. ✅ **Documentation accurate** - Phase III README + guides ready
5. ✅ **Hardware findings validated** - 6+ Phase II.B findings documented
6. ✅ **Build tools available** - At least one build environment prepared
7. ✅ **Device A status** - Factory U-Boot responsive (tested via UART)
8. ✅ **Device B status** - Factory firmware intact (fallback device ready)
9. ✅ **Recovery procedures** - Documented and understood
10. ✅ **FEL mode** - Documented as backup (not primary method)

**If ANY check fails:**
- ❌ STOP execution
- ❌ Report specific failure
- ❌ Request manual verification
- ❌ Do NOT proceed to hardware modifications

---

## PHASE III INITIALIZATION (ONLY AFTER ALL CHECKS PASS)

If all validations pass, agent proceeds with:

```bash
# 1. Create Phase III session log
touch phases/phase3-uboot-replacement/SESSION_$(date +%Y%m%d_%H%M%S).log

# 2. Capture current device state
screen /dev/ttyACM0 115200
# => printenv > environment-phase3-start.txt
# => bdinfo > boardinfo-phase3-start.txt
# (Save to phases/phase3-uboot-replacement/)

# 3. Document phase start
cat > phases/phase3-uboot-replacement/PHASE_START.md << 'EOF'
# Phase III Start - $(date)

## Pre-Phase Validation: ALL PASSED ✅

- Device A: Factory U-Boot responsive
- Device B: Factory firmware intact (fallback)
- Full backup: 7.3GB verified
- UART console: Stable and responsive
- Build tools: Ready
- Recovery procedures: Documented

## Next Task: 014 - Mainline U-Boot Build

Starting U-Boot compilation following QUICK_START_BUILD.md

Timeline: 2-3 hours
Risk: NONE (no hardware changes yet)
EOF

# 4. Ready for Task 014
echo "✅ Phase III Initialization Complete"
echo "Next: Follow phases/phase3-uboot-replacement/QUICK_START_BUILD.md"
echo "Task 014: Mainline U-Boot Build & Configuration"
```

---

## AGENT RESPONSIBILITIES

**As the validating agent, you MUST:**

1. **Read every file mentioned** - Don't assume, verify existence
2. **Check file sizes** - Backups should be specific sizes (7.3GB, 64KB)
3. **Cross-reference findings** - Phase II findings should match UART logs
4. **Verify dates** - Backups should be recent (Nov 4-6)
5. **Document each check** - Show output for each validation
6. **Be honest about blockers** - If something fails, STOP immediately
7. **Ask for manual verification** - Don't guess about UART status
8. **Provide clear pass/fail** - "All checks passed, ready for Phase III" OR "Check #X failed, here's why..."

---

## REPORT FORMAT

After completing validation, agent provides:

```markdown
# Phase III Pre-Execution Validation Report

**Date:** [Date]
**Validator:** [Agent Name]
**Status:** ✅ PASSED / ❌ FAILED

## Summary
[Brief overview of validation]

## Detailed Results

### [Check 1]: Project Structure
- Status: ✅
- Details: [What was verified]

### [Check 2]: Backups
- Status: ✅
- Details: [Sizes, dates, checksums]

[... all 10 checks ...]

## Recommendation
- [If all passed] "Ready to proceed with Phase III Task 014"
- [If failed] "Cannot proceed - [specific failure] requires [action]"

## Next Steps
[Clear instructions for next action]
```

---

## FINAL GATE

**Agent must state explicitly:**

> "I have validated the entire repository structure. All 10 pre-execution checks have passed. Device A is ready for Phase III U-Boot modification. Device B remains as fallback. I am ready to proceed with Task 014: Mainline U-Boot Build."

**Only after this statement can Phase III actually begin.**
