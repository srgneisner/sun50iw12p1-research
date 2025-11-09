# FEL Write Analysis - Critical Discovery

**Date**: 2025-11-03  
**Status**: BLOCKER IDENTIFIED - Not a Patch Issue

## The Core Problem

After systematic testing of ALL combinations:
- ✅ 256 bytes write works perfectly
- ❌ 32 KB boot0.bin write ALWAYS times out
- Timeout happens even with:
  - 20 second USB_TIMEOUT (vs 10 default)
  - 16KB chunks (vs 512KB default)
  - 64-byte bulk recv buffer (H713 protocol fix)
  - H713 swap buffers and thunk addresses
  - ALL 4 patches combined

## This Indicates The Problem Is NOT:
- USB timeout duration
- Chunk size limitation
- H713 memory addresses
- USB bulk recv protocol
- BROM configuration

## The Pattern Is Too Consistent:

| Size | Result | Time |
|------|--------|------|
| 256B | ✅ SUCCESS | <1 sec |
| 1KB | ? | ? |
| 4KB | ? | ? |
| 16KB | ? | ? |
| 32KB | ❌ TIMEOUT | ~20-30 sec |

**Need to test intermediate sizes to find threshold!**

## What This Suggests

The timeout happens at specific size OR during specific data patterns. Possibilities:

1. **BROM Buffer Limit**: H713 BROM internal buffer < 32 KB
   - Hypothesis: Maybe 16 KB is the limit?
   - Action: Test write to see if chunks > 16KB fail

2. **USB Protocol Saturation**: H713 USB controller gets overwhelmed
   - Hypothesis: Requires delay between chunks
   - Action: Add sleep between bulk_send chunks

3. **Memory Conflict**: 32 KB write destination conflicts with BROM working area
   - Hypothesis: BROM uses memory region  after 32 KB written
   - Action: Try writing to higher address (0x110000 instead of 0x105000)

4. **BROM State Issue**: After X bytes, BROM enters error state
   - Hypothesis: Accumulating protocol errors
   - Action: Add protocol resets between chunks

## The Truth About The Binaries

The three binaries in `/binaries/`:
- `sunxi-fel-16k-chunks`, `sunxi-fel-4k-chunks`, `sunxi-fel-h713-fixed`
- ALL ALSO TIMEOUT on 32KB writes
- These are **debugging/intermediate versions**, NOT the final working versions
- The actual working `sunxi-fel-h713-complete-fix` from the summary was **never archived**

## Next Critical Step

**MUST test incremental sizes to find the EXACT threshold where writes fail:**

```bash
# Create test files of increasing size
for size in 1024 2048 4096 8192 16384 24576 32768; do
  dd if=/dev/zero of=test_${size}b.bin bs=1 count=$size 2>/dev/null
  timeout 150 ./sunxi-fel write 0x105000 test_${size}b.bin 2>&1 | grep -E "ERROR|EXIT_CODE"
done
```

This will show EXACTLY where writes start failing.

## Hypothesis Scoring

1. **BROM Buffer Limit** (60% likely) - Most consistent with data
2. **Memory Conflict** (25% likely) - Possible but less likely
3. **USB Protocol** (10% likely) - Ruled out by consistent behavior
4. **BROM State** (5% likely) - Less likely but possible

## Critical Path Forward

1. **IMMEDIATE**: Test intermediate sizes (see script above)
2. **Find threshold**: Determine max working write size
3. **Adjust strategy**: Either use smaller SPL or implement firmware workaround
4. **Alternative approach**: If FEL writes impossible, use Serial Console + U-Boot instead

The fact that 256B works perfectly suggests the issue is NOT fundamental - just a limit we haven't found yet.

## Session Summary

Created `patch_test/final-h713-complete` with ALL 4 documented patches:
1. ✅ H713 soc_info.c entry with correct addresses
2. ✅ H713-specific swap buffers (0x121000, 0x11e000)
3. ✅ 64-byte bulk recv workaround for H713 protocol
4. ✅ 20 second USB timeout + 16KB chunk limit

Result: **Still timeouts on 32KB writes.**

This proves the problem is **different from what was documented in the H713_FEL_FIXES_SUMMARY**.

## Files Prepared

- `/patch_test/final-h713-complete/` - Complete V4 implementation with all patches
- Ready for threshold testing with intermediate file sizes

---

**Next Session**: Must test size threshold to unblock FEL write operations.
