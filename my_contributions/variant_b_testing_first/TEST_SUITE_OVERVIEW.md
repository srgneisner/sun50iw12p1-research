# FEL Advanced Testing Suite - Complete Overview

**Date:** November 3, 2025  
**Purpose:** Real hardware validation of H713 FEL capabilities and stack integrity  
**Target Device:** HY300 Pro with Allwinner H713

---

## What We're Testing & Why

### The Problem
```
Previous observation: "selbst sunxi-fel version timeouted"
Hypothesis: SRAM A1 access left BROM in corrupted state
Theory: Stack pointer or SRAM management got blocked
```

### The Solution
A systematic test suite that:
1. **Detects hangs early** (15s timeout per operation)
2. **Provides recovery guidance** (automatic power-cycle instructions)
3. **Validates your hypothesis** (SRAM A1 blockade theory)
4. **Documents real capabilities** (not theoretical)

---

## Test Suite Files

### 1. **test-fel-advanced.sh** (Main Script)
```bash
$ bash test-fel-advanced.sh
```

**What it does:**
- Detects device (lsusb)
- Runs 5 test phases
- Monitors for timeouts
- Creates detailed logs
- Guides power cycles if needed

**Output:**
- `fel-test-results/advanced-test-YYYYMMDD_*.log` - Main log
- `fel-test-results/version.txt` - Device info
- `fel-test-results/sid.txt` - Chip ID
- `fel-test-results/sram-a2-*.bin` - Memory dumps (7 sizes)
- `fel-test-results/cpu-info.txt` - CPU registers
- `fel-test-results/.power_cycle_needed` - Indicator file (if needed)

**Runtime:** 3-5 minutes (includes 1s delays between tests)

### 2. **docs/FEL_ADVANCED_TESTING_GUIDE.md** (Detailed Analysis)
```bash
$ cat docs/FEL_ADVANCED_TESTING_GUIDE.md
```

**Contains:**
- Phase-by-phase explanation
- Interpretation guide (5 scenarios)
- Stack corruption theory
- Power-cycle procedure
- Real-world validation checklist

### 3. **FEL_TESTING_GUIDE_QUICK_START.sh** (Quick Reference)
```bash
$ bash FEL_TESTING_GUIDE_QUICK_START.sh
```

**Shows:**
- Prerequisites
- Step-by-step instructions
- Output interpretation
- Timeout handling
- Next steps

---

## The 5 Test Phases Explained

### Phase 0: Device Detection ✓
**Command:** `lsusb | grep 1f3a:efe8`  
**Expected:** Device found as Allwinner FEL device  
**Timeout:** No - just enumeration  
**Meaning:** Basic USB connectivity OK

### Phase 1: FEL Version Query ⏱️ CRITICAL
**Command:** `sunxi-fel version`  
**Expected:** Device info returned in <15s  
**Timeout Meaning:**
- ❌ BROM frozen (stack corrupted!)
- Requires power cycle
- Validates your blockade hypothesis

**If Timeout:**
```
This is CRITICAL because:
- Simplest possible FEL command
- If THIS times out, nothing else will work
- Indicates BROM/SRAM in bad state
- Proves stack corruption occurred
```

### Phase 2: Chip ID Read 
**Command:** `sunxi-fel sid`  
**Expected:** 128-bit serial (may be zeros)  
**Timeout Meaning:** Device unresponsive  
**Skip If:** Phase 1 timed out (not worth testing)

### Phase 3: SRAM A2 Progressive Tests ✅ KEY PHASE
**Commands:** 7 separate reads at increasing sizes:
- 256 bytes (minimal)
- 1 KB (small buffer)
- 4 KB (page-sized)
- 16 KB (quarter block)
- 32 KB (half block)
- 64 KB (block-sized)
- **128 KB** (full SRAM A2)

**Expected:** All succeed with ~16 KB/s transfer speed

**Failure Patterns:**
- ✅ All succeed → Normal
- ⚠️ Fails at 64KB+ → Possible stack overflow at higher sizes
- ❌ Fails early (4-16KB) → Stack collision
- 🔴 Timeout → BROM blocked/frozen

**Stack Hypothesis Test:**
```
If SRAM A1 was previously accessed and left stack corrupted:
  - Small reads (256B) might work
  - Medium reads (4KB) start failing
  - Large reads (64KB+) definitely timeout
  
This would PROVE the stack corruption theory!
```

### Phase 4: SRAM A1 Read (Expected to Fail)
**Command:** `sunxi-fel read 0x20000 256 <file>`  
**Expected:** Timeout after 15s (NORMAL - protected region)  
**Alternative:** Immediate error or partial read (unusual)

**Key Finding:** If this was previously attempted and succeeded (returned data), it may have corrupted stack!

### Phase 5: CPU Information
**Command:** `sunxi-fel dump 0x09010040 0x10`  
**Expected:** 4-byte CPU state value  
**Meaning:** BROM fully responsive if successful

---

## Scenario Analysis: What Results Mean

### Scenario A: Perfect Results ✅
```
Phase 0: ✓ Device found
Phase 1: ✓ Version OK (no timeout)
Phase 2: ✓ SID OK
Phase 3: ✓ SRAM A2 all sizes OK (256B-128KB)
Phase 4: ✓ SRAM A1 timeout (expected - protected)
Phase 5: ✓ CPU info OK

VERDICT: Device HEALTHY
ACTION: Ready for Serial Console testing
CONFIDENCE: 95%+
```

### Scenario B: Stack Corruption ⚠️
```
Phase 0: ✓ Device found
Phase 1: ✗ Version TIMEOUT after 15s ← CRITICAL
Phase 2: ✗ Skip (device hung)
Phase 3: ✗ Skip (device hung)
Phase 4: ✗ Skip (device hung)
Phase 5: ✗ Skip (device hung)

VERDICT: BROM frozen - stack corrupted
CAUSE: Likely previous SRAM A1 access
ACTION: Power cycle required
CONFIDENCE: Your hypothesis CONFIRMED!
```

### Scenario C: Gradual Degradation ⚠️
```
Phase 0: ✓ Device found
Phase 1: ✓ Version OK
Phase 2: ✓ SID OK
Phase 3: Progressive failures
  - 256B ✓
  - 1KB ✓
  - 4KB ✓
  - 16KB ✗ TIMEOUT
  
VERDICT: Stack overflow at 16KB+
CAUSE: BROM stack layout issue
ACTION: Avoid large SRAM A2 reads
CONFIDENCE: Stack boundary identified
```

### Scenario D: SRAM A1 Data (Worst Case) ⚡
```
Phase 4: SRAM A1 read returns SOME data (not timeout!)
Phase 3: Subsequent SRAM A2 reads start failing

VERDICT: A1 access succeeded BUT corrupted state
CAUSE: BROM doesn't properly protect A1
ACTION: NEVER access A1 again
CONFIDENCE: Major finding!
```

---

## Power Cycle Procedure

When test indicates `POWER CYCLE REQUIRED`:

```bash
# 1. Script will create indicator file:
ls -la fel-test-results/.power_cycle_needed

# 2. Physically disconnect USB from computer
#    (WAIT 3 seconds)

# 3. Physically reconnect USB cable
#    (Device auto-enters FEL mode)

# 4. Verify device re-appeared
lsusb | grep 1f3a:efe8

# 5. Run tests again
bash test-fel-advanced.sh

# 6. If successful, clean up indicator
rm fel-test-results/.power_cycle_needed
```

### Expected Recovery
```
After power cycle:
  ✓ Device shows up in lsusb immediately
  ✓ sunxi-fel version works (no timeout)
  ✓ SRAM A2 fully accessible again
  ✓ Device is RESET to clean state
```

---

## Files Created During Testing

```
fel-test-results/
├── advanced-test-20251103_064200.log   ← Main output log
├── version.txt                          ← Device identification
├── sid.txt                              ← 128-bit chip ID
├── sram-a2-256.bin                      ← 256 byte dump
├── sram-a2-1024.bin                     ← 1 KB dump
├── sram-a2-4096.bin                     ← 4 KB dump
├── sram-a2-16384.bin                    ← 16 KB dump
├── sram-a2-32768.bin                    ← 32 KB dump
├── sram-a2-65536.bin                    ← 64 KB dump
├── sram-a2-131072.bin                   ← 128 KB dump (full SRAM A2)
├── sram-a1-256.bin                      ← A1 attempt (if successful)
├── cpu-info.txt                         ← CPU registers
└── .power_cycle_needed                  ← Exists if cycle needed
```

All binary dumps can be analyzed with:
```bash
hexdump -C fel-test-results/sram-a2-256.bin | head -20
md5sum fel-test-results/sram-a2-*.bin
```

---

## Analysis Tools

### View Latest Log
```bash
cat fel-test-results/advanced-test-*.log | tail -50
```

### Check for Timeouts
```bash
grep -i "timeout\|error\|failed" fel-test-results/advanced-test-*.log
```

### Verify SRAM A2 Dumps
```bash
ls -lh fel-test-results/sram-a2-*.bin
md5sum fel-test-results/sram-a2-*.bin
```

### Parse Version Output
```bash
cat fel-test-results/version.txt
# Should show: soc=00001860(H713)
```

---

## Validating Your Stack Blockade Hypothesis

**Hypothesis:** "SRAM A1 blockade corrupted stack"

**Evidence Collection:**

1. **Direct Evidence:**
   - Phase 1 timeout = ✓ Confirms stack corruption
   - Phase 3 progressive failures = ✓ Proves stack boundaries violated
   - Phase 4 SRAM A1 data + Phase 3 failures = ✓ Proves A1 caused it

2. **Indirect Evidence:**
   - Version works but SRAM A2 fails at 16KB+ = Stack overflow pattern
   - Timeout exactly at 15s threshold = Timeout, not actual error

3. **Proof Sequence:**
   ```
   IF Phase 1 timeouts:
     → BROM is hung
     → Stack is corrupted
     → Something previous left it in bad state
   
   THEN investigate Phase 4 (SRAM A1):
     → Did A1 access succeed? (unusual!)
     → Did A1 access fail? (expected but may have corrupted state)
     → Did A1 timeout? (correct behavior)
   
   CONCLUSION:
     Stack blockade hypothesis CONFIRMED or REFUTED with actual data
   ```

---

## Next Actions After Testing

### If All Tests Pass ✅
```
1. Document in PROJECT_STATUS.md
2. Update FEL capabilities reference
3. Proceed to Serial Console phase
4. Test U-Boot on real device
```

### If Timeout Occurs (Power Cycle) ⚠️
```
1. Document exact phase where timeout occurred
2. Perform power cycle
3. Re-test to verify recovery
4. Record findings in PROJECT_STATUS.md
5. Update BROM analysis with stack corruption data
```

### If Partial Success (Some Sizes Fail) ⚠️
```
1. Identify exact failure point (e.g., fails at 16KB)
2. Document stack boundary limitation
3. Note: SRAM A2 usable up to [X] KB
4. Update FEL capabilities matrix
5. Proceed with Serial Console (less dependent on FEL)
```

---

## Comparison: VM Tests vs. Real Hardware

**Previous (VM/Simulated):**
- All tests passed in theory
- No power cycles observed
- SRAM A1 not actually tested
- Stack blockade not validated

**Now (Real Hardware):**
- Actual timeout behavior
- Real BROM responses
- SRAM A1 actual protection
- **Stack integrity confirmed or disproven**

This test suite bridges theory and reality! 🎯

---

## Time Estimate

```
Test Duration Breakdown:
├─ Phase 0 (Device detection): ~2 seconds
├─ Phase 1 (Version): ~2 seconds (or 15s timeout)
├─ Phase 2 (SID): ~2 seconds
├─ Phase 3 (Progressive reads): ~30 seconds (7 reads × 4s + 1s delays)
├─ Phase 4 (SRAM A1): ~15 seconds (timeout)
└─ Phase 5 (CPU info): ~2 seconds

TOTAL: 3-5 minutes normally
        +3 min if power cycle needed
        +5 min if manual recovery attempted
```

---

## References

- Main Test Script: `test-fel-advanced.sh`
- Detailed Guide: `docs/FEL_ADVANCED_TESTING_GUIDE.md`
- Quick Start: `bash FEL_TESTING_GUIDE_QUICK_START.sh`
- Hardware Reference: `QUICK_REFERENCE.md`
- BROM Analysis: `H713_FEL_PROTOCOL_ANALYSIS.md`

---

## Ready to Validate Your Real Device! 🚀

```bash
$ cd /home/luca/h713_project/sun50iw12p1-research
$ bash test-fel-advanced.sh
```

**This will:**
- Test real FEL capabilities on your HY300 Pro
- Validate the stack blockade hypothesis
- Determine exact SRAM limits
- Generate recovery procedures if needed
- Provide confidence level for next phases

**Expected outcome:** Comprehensive understanding of your device's FEL state + confirmation/refutation of stack corruption theory!
