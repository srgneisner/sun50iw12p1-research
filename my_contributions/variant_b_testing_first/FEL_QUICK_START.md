# 🚀 FEL TESTING QUICK START

## ⚡ Get Going in 30 Seconds

```bash
cd /home/luca/h713_project/sun50iw12p1-research/sunxi-tools

# 1. Device in FEL mode first!
#    (Hold FEL button or pin to GND while powering on, connect USB)

# 2. Run quick test
./sunxi-fel version

# 3. Run comprehensive suite
./test-fel-comprehensive.sh
```

## 📋 What Should Happen

✅ **Success** (takes ~3 minutes):
- Device detected immediately
- BROM version shows H713
- All 6 tests pass (green checkmarks)
- No timeout errors

❌ **Failure** (needs troubleshooting):
- "Device not found" → FEL mode not active
- "Timeout" → USB_TIMEOUT still broken
- Check: `docs/FEL_TESTING_RUNBOOK.md`

## 📚 Documentation

- **Full guide**: `docs/FEL_TESTING_RUNBOOK.md`
- **Technical details**: `docs/FEL_WRITE_RESTORATION_ANALYSIS.md`
- **H713 specifics**: `docs/USING_H713_FEL_MODE.md`

## ✨ What We Fixed

- ✅ USB_TIMEOUT: 20000ms → **10000ms** 
- ✅ Buffer handling: Removed problematic H713 workaround
- ✅ Binary rebuilt: Now 86KB with fixes
- ✅ Test suite: 6 comprehensive tests

## 🎯 Success Criteria

All tests passing = FEL is ready for:
1. U-Boot bootloader upload
2. Kernel loading
3. Mainline Linux boot

---

**NEXT STEP**: Put device in FEL mode → Run `./test-fel-comprehensive.sh`
