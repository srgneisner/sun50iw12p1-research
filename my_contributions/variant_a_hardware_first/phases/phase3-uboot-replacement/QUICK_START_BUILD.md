# Phase III Quick Start - UART Method

**Date:** November 6, 2025  
**Objective:** Get new U-Boot building and ready for UART test  
**Time Estimate:** 2-3 hours (first build)  
**Risk Level:** NONE (no flashing yet)

---

## Step 1: Download Mainline U-Boot

```bash
# Navigate to project root
cd /home/luca/Desktop/hy300-linux-porting

# Create build directory
mkdir -p build/uboot-mainline
cd build/uboot-mainline

# Clone latest U-Boot
git clone https://github.com/u-boot/u-boot.git
cd u-boot
git log --oneline | head -5  # Show recent commits
```

**Expected:** Recent U-Boot source (2024.11 or later)

---

## Step 2: Prepare H713 Configuration

Copy device tree and configuration from research:

```bash
# From project root
cp research/sun50i-h713-hy300.dts build/uboot-mainline/u-boot/arch/arm/dts/
cp research/hy300_h713_defconfig build/uboot-mainline/u-boot/configs/

# Verify copied
ls -la build/uboot-mainline/u-boot/arch/arm/dts/sun50i-h713-hy300.dts
```

---

## Step 3: Build U-Boot

```bash
cd build/uboot-mainline/u-boot

# Set cross-compiler (adjust if needed)
export CROSS_COMPILE=arm-linux-gnueabi-
export ARCH=arm

# Configure for H713
make hy300_h713_defconfig

# Build
make -j4  # Adjust based on CPU cores

# Check output
ls -la u-boot-spl.bin u-boot.bin
```

**Expected Output:**
- `u-boot-spl.bin` (~32 KB)
- `u-boot.bin` (~500 KB - 1 MB)

---

## Step 4: Prepare UART Upload Image

```bash
# Create combined image for UART upload
# U-Boot expects: [SPL at specific address] [U-Boot proper]

cd /home/luca/Desktop/hy300-linux-porting/phases/phase3-uboot-replacement

# Copy binaries
cp ../../build/uboot-mainline/u-boot/u-boot-spl.bin .
cp ../../build/uboot-mainline/u-boot/u-boot.bin .

# Verify
ls -lah u-boot*.bin
```

---

## Step 5: UART Console Ready

```bash
# Prepare serial connection
screen /dev/ttyACM0 115200

# In U-Boot prompt, test:
=> version
=> printenv bootcmd

# NOTE: Don't modify anything yet - just verify it's responsive
```

---

## Step 6: Document Current State

```bash
# Capture current U-Boot environment
screen /dev/ttyACM0 115200

# In U-Boot:
=> printenv > uboot-environment-before-phase3.txt
=> bdinfo > uboot-board-info-before-phase3.txt

# Save logs
```

---

## Next: Upload Test (Task 015)

When ready to test (after verifying build works):

```bash
# In factory U-Boot console:
=> loadk 0x40800000
# Send u-boot-spl.bin via Kermit (screen: Ctrl-A, S)

# If successful, execute:
=> go 0x40800000
# Should see new U-Boot prompt
```

---

## Troubleshooting Build Issues

### Missing Cross-Compiler
```bash
# Install if needed
sudo apt-get install gcc-arm-linux-gnueabi binutils-arm-linux-gnueabi

# Or use Nix (if nix-shell available)
nix-shell -p gcc-arm-embedded
```

### Device Tree Not Found
```bash
# Ensure DTS is in correct location
cat build/uboot-mainline/u-boot/arch/arm/dts/sun50i-h713-hy300.dts | head

# If missing, check research directory for correct file
ls -la research/sun50i-h713*.dts
```

### Build Fails on Specific Module
- Check `build/uboot-mainline/u-boot/.config` for H713-specific options
- May need to adjust defconfig based on mainline version differences

---

## Safety Checkpoints

✅ Build succeeds locally  
✅ Binaries created and copyable  
✅ UART console still responsive (no changes made)  
✅ Factory U-Boot still boots normally  

Once all ✅, ready for Task 015 (UART upload test).

---

## Abort Procedure (if anything fails)

If build fails or anything seems wrong:

1. **Stop immediately** - don't proceed to UART test
2. **Power cycle device** - returns to factory state
3. **Document the issue** - save error messages
4. **Investigate** - check compatibility, configs, etc.
5. **Retry with adjustments** - modify defconfig or source

**No permanent changes made yet - safe to experiment.**
