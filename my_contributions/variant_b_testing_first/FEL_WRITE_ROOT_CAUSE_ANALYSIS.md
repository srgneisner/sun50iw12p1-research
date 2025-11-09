# FEL Write Root Cause Analysis - Session 4

**Date**: 2025-11-03  
**Status**: Planning Next Phase After Power Cycle

## Situation Summary

### What We've Tested
1. **patch_test/4-patch4** (ALL 4 patches applied):
   - ✅ H713 recognized (soc_id=0x1860)
   - ✅ 256 bytes write works
   - ❌ 32KB writes timeout (ERROR -7)

2. **Original binaries** (from /binaries/):
   - ✅ `sunxi-fel-16k-chunks`: 256B works, 32KB timeouts
   - ✅ `sunxi-fel-4k-chunks`: 256B works, 32KB timeouts
   - ✅ `sunxi-fel-h713-fixed`: 256B works, 32KB timeouts

### Critical Discovery
**All binaries fail identically on 32KB+ transfers** - this suggests:
- NOT a patch issue
- NOT a code issue
- **LIKELY a Hardware/Firmware limitation**

## The Real Problem

From H713_FEL_FIXES_SUMMARY.md, the documented V4 ("complete-fix") was tested with:
```
Command: sudo ./sunxi-fel-h713-complete-fix -v spl spl-only.bin
Result: ✅ SUCCESS - SPL upload working
```

But this binary is **NOT in the repository**! We only have:
- Intermediate debugging versions (16k/4k/h713-fixed)
- NO final working binary

This means:
1. The V4 "complete-fix" was built locally but **never committed**
2. We need to **reconstruct it** from the documented patches
3. The test was done with a **small SPL binary**, not 32KB boot0.bin

## New Hypothesis

The H713 might have a **progressive transfer limitation**:
- Small transfers (< 1KB): ✅ Works
- Medium transfers (1-32KB): ❌ Timeout
- Large transfers (> 32KB): ❌ Unknown (probably also timeout)

This could be due to:
1. **H713 BROM buffer size limit** - can't handle > 256B chunks
2. **USB protocol issue** - endpoint MTU limitation
3. **Bootloader security** - write-protect on SRAM area
4. **Undocumented H713 errata** - specific to this SoC

## Strategy After Power Cycle

### Phase 1: Binary Size Testing (QUICK - 5 min)
Goal: Find exact threshold where writes fail

Test files:
- 256B ← known to work
- 512B  
- 1KB
- 2KB
- 4KB
- 8KB
- 16KB

Use `sunxi-fel-4k-chunks` binary (has debug output for diagnostics)

### Phase 2: Alternative Approach
If large writes don't work:
1. **Test serial console boot** instead of FEL writes
   - CP2102 adapter will arrive soon
   - Can boot U-Boot via serial instead of FEL
   - Avoids FEL write limitations

2. **Test SD card boot**
   - Write U-Boot to SD card
   - Boot device from SD (if bootloader supports it)

3. **Test Android ADB method**
   - Boot into Android first
   - Flash bootloader via fastboot (if available)

### Phase 3: Analysis
If we hit a hard limit at (e.g.) 256B:
1. Implement **progressive write protocol** - send in 256B chunks with status checks
2. Modify sunxi-tools to auto-chunk at threshold
3. Document H713 limitation for upstream

## Critical Files Status

- `patch_test/4-patch4/` - All 4 patches combined (ready for rebuild if needed)
- `binaries/sunxi-fel-4k-chunks` - Best for testing (has debug output)
- `FEL_WRITE_ANALYSIS_SESSION3.md` - Previous findings documented

## Device State Notes

After power cycle, device should be fully reset and ready for fresh testing.

Expected FEL mode startup:
1. Connect device via USB
2. Hold boot button or enter FEL mode
3. `lsusb` shows: `ID 1f3a:efe8 Allwinner Technology sunxi SoC OTG connector in FEL/flashing mode`
4. Ready for testing

## Next Actions (After Power Cycle)

1. ✅ Verify device is in FEL mode
2. ✅ Test incremental sizes (256B → 1KB → 2KB → 4KB → 8KB → 16KB)
3. ✅ Document exact threshold where timeout occurs
4. ✅ Plan workaround strategy based on findings
