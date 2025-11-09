# Phase III: Device Tree & U-Boot Strategy

**Date:** November 6, 2025  
**Status:** READY FOR TASK 014  
**Objective:** Prepare mainline U-Boot + device tree for UART testing

---

## Device Tree Status

### Current: `sun50i-h713-hy300-mainline.dts`
✅ Has: OPTEE firmware, MIPS co-processor, all hardware nodes  
❌ Missing: Android firmware section (optional for Armbian, but keep for compatibility)

### Factory: `stock_image/sunxi.dts`
✅ Has: Android firmware, all hardware nodes, motor/LCD config  
✅ Has: MIPS co-processor reserved memory (40.3MB @ 0x4b100000)

### Decision: HYBRID APPROACH

**For Phase III (UART Bootloader Test):**
- Use `sun50i-h713-hy300-mainline.dts` AS IS
- It has everything needed for boot (OPTEE, MIPS, hardware)
- Android section is not required for mainline Linux

**For Phase IV+ (Full Armbian Integration):**
- Merge Android section back if Armbian needs it
- Current mainline version is fine for now

---

## U-Boot Build Strategy (Task 014)

### Why Mainline U-Boot?
1. **Factory U-Boot:** 2018.05 (5 years old, limited features)
2. **Mainline U-Boot:** 2024.11+ (current, better hardware support, USB, network boot)
3. **Goal:** Get past U-Boot stage to mainline kernel boot

### Architecture Decision

**Phase II.B Evidence:**
- CPU: ARMv8 64-bit (Cortex-A53)
- Factory U-Boot: Compiled 32-bit (arm-linux-gnueabi-gcc)

**Decision for Mainline U-Boot:**
- ✅ Build 64-bit (aarch64) U-Boot
- Reason: Mainline supports 64-bit native, modern toolchain
- Factory can boot either (backward compatible)

### Build Procedure (SIMPLE APPROACH)

```bash
# 1. Clone mainline U-Boot
git clone https://github.com/u-boot/u-boot.git
cd u-boot

# 2. Create H713 config (from research/configs/hy300_h713_defconfig)
cp ../research/configs/hy300_h713_defconfig configs/

# 3. Create H713 device tree (from mainline DTB)
cp ../sun50i-h713-hy300-mainline.dts arch/arm/dts/

# 4. Configure & build with nix-shell
nix-shell -p gcc aarch64-linux-gnu.binutils aarch64-linux-gnu.gcc python3 \
  --run 'make ARCH=arm CROSS_COMPILE=aarch64-linux-gnu- hy300_h713_defconfig && \
          make ARCH=arm CROSS_COMPILE=aarch64-linux-gnu- -j4'

# 5. Output: u-boot-sunxi-with-spl.bin (ready for UART upload)
```

### Output Files

| File | Size | Purpose |
|------|------|---------|
| u-boot-sunxi-with-spl.bin | ~512-650KB | Combined SPL + U-Boot (flash ready) |
| u-boot-spl.bin | ~32KB | Secondary Program Loader only |
| u-boot.bin | ~500-600KB | U-Boot main binary only |

### Key Options for UART Testing

```
# Only UART, NO USB gadget:
CONFIG_SERIAL_8250_SUNXI=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_SERIAL_EARLYCON=y

# NO USB gadget (unlike research/configs/hy300_boot_usb_serial.txt):
CONFIG_USB_GADGET=n (keep disabled)
CONFIG_USB_FUNCTION_ACM=n (keep disabled)

# Basic bootloader features:
CONFIG_CMD_MEMORY=y (for md.l, mw commands)
CONFIG_CMD_MMC=y (for mmc device access)
CONFIG_CMD_LOAD=y (for loadk via UART upload)
CONFIG_AUTOBOOT=y (bootdelay support)
```

---

## Task 014 Timeline

### Phase 1: Preparation (30 min)
- [ ] Clone u-boot repo
- [ ] Copy configs & device tree
- [ ] Verify Nix environment

### Phase 2: Build (45-90 min)
- [ ] Configure with hy300_h713_defconfig
- [ ] Compile with nix-shell
- [ ] Check output files

### Phase 3: Verification (15 min)
- [ ] File size check (reasonable?)
- [ ] Binary format check (valid?)
- [ ] Commit to git

**Total: ~2-2.5 hours (first build)**

---

## Task 015 Preparation (After Task 014)

When u-boot binaries ready:

```
Device A Ready State:
├── UART console active ✅ (/dev/ttyACM0)
├── Factory U-Boot running
├── New u-boot-sunxi-with-spl.bin ready
│
├── Test Plan:
│   ├── Load to 0x40800000 (DRAM, tested writable)
│   ├── Execute via 'go' command
│   ├── New U-Boot prompt appears = SUCCESS
│   └── No flash changes = SAFE
```

**Risk Level:** ZERO (memory only, no eMMC changes)

---

## Gotchas & Safeguards

### Gotcha 1: CONFIG_ARCH Mismatch
❌ **Wrong:** `ARCH=arm` with `aarch64-linux-gnu-`  
✅ **Correct:** Use `ARCH=arm` for Allwinner (even with 64-bit compiler)  
→ U-Boot uses this convention (different from Linux kernel)

### Gotcha 2: Device Tree Path
❌ **Wrong:** `arch/arm/dts/` for ARM64  
✅ **Correct:** U-Boot mixes ARM32/ARM64, same dts directory

### Gotcha 3: SPL Size
❌ **Risk:** SPL > 32KB won't fit SRAM @ 0x104000  
✅ **Check:** `ls -lh u-boot-spl.bin` must be < 32KB

### Gotcha 4: Bootloader Offsets
❌ **Risk:** Write to wrong offset = brick  
✅ **Safe for Phase III:** Only loading to DRAM (0x40800000), no eMMC writes yet

---

## Validation Checklist (Before Task 014)

- [x] kernel-h713-hy300.defconfig validated
- [x] Device tree verified (mainline OK as-is)
- [x] UART only (no USB gadget)
- [x] 64-bit U-Boot decision made
- [x] Build procedure documented
- [x] Nix environment verified
- [x] Safeguards identified

**Status: ✅ READY FOR TASK 014**

---

## Next Action

Start **Task 014: Build Mainline U-Boot for H713**

Expected output: `u-boot-sunxi-with-spl.bin` (512-650KB)

No hardware changes until Task 015 (UART memory test)
