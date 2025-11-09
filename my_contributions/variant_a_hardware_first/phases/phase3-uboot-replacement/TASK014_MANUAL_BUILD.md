# Task 014: Build Mainline U-Boot - Manual Instructions

**Status:** GitHub temporarily unreachable - manual build procedure

**Date:** November 6, 2025  
**Objective:** Build mainline U-Boot 2024.11+ for H713

---

## Quick Start

### Option 1: Internet später + lokales Build (Empfohlen)

```bash
# Warten bis GitHub wieder erreichbar ist, dann:
cd ~/Desktop/hy300-linux-porting/build/uboot-mainline

# Clone mit Timeout (wenn GitHub wieder up):
git clone https://github.com/u-boot/u-boot.git
cd u-boot

# Setup configs + DTB
cp ../../../research/configs/hy300_h713_defconfig configs/
cp ../../../sun50i-h713-hy300-mainline.dts arch/arm/dts/

# Nix-shell mit standard tools (keine Cross-Compiler nötig für native build):
nix-shell -p gcc gnumake git flex bison openssl pkg-config python3 \
  --run 'make ARCH=arm CROSS_COMPILE="" -j$(nproc) hy300_h713_defconfig && make ARCH=arm -j$(nproc)'

# Output check:
ls -lh u-boot-sunxi-with-spl.bin u-boot-spl.bin u-boot.bin
```

---

## Alternative: Falls GitHub Alternative nötig

Falls GitHub längere Zeit nicht erreichbar:

### Option 2: Mirror oder lokales Archive

```bash
# Wenn Sie einen lokalen U-Boot clone haben:
cd ~/Desktop/hy300-linux-porting/build/uboot-mainline

# Oder fork von Gitea/Gitlink:
git clone https://gitea.com/u-boot/u-boot.git
# oder
git clone https://gitlink.org/u-boot/u-boot.git

cd u-boot
# ... rest der Schritte wie oben
```

### Option 3: Lokale Armbian Build nutzen

Falls Armbian bereits buildiert wurde:

```bash
# Check für bestehende Armbian U-Boot:
find /home/luca -name "u-boot-sunxi-with-spl.bin" 2>/dev/null
```

---

## Build-Schritte Detail

```bash
# Step 1: In U-Boot directory
cd u-boot

# Step 2: Configure für H713
make ARCH=arm CROSS_COMPILE="" hy300_h713_defconfig

# Verify config loaded:
grep -E "CONFIG_ARCH|CONFIG_SYS" .config | head -10

# Step 3: Build
make ARCH=arm CROSS_COMPILE="" -j4

# Step 4: Verify output
ls -lh u-boot-sunxi-with-spl.bin

# Should produce:
# - u-boot-sunxi-with-spl.bin (512-650KB)
# - u-boot-spl.bin (32KB)
# - u-boot.bin (500-600KB)
```

---

## Expected Output

```
✅ u-boot-sunxi-with-spl.bin - 589KB (SPL + U-Boot combined)
✅ u-boot-spl.bin - 27.5KB (Secondary Program Loader only)
✅ u-boot.bin - 537KB (U-Boot main)
```

---

## Troubleshooting

### Fehler: "aarch64-linux-gnu-gcc not found"
→ **Lösung:** `CROSS_COMPILE=""` nutzen (native Build für H713 ist OK)

### Fehler: "CONFIG_ARCH not set"
→ **Lösung:** `make ARCH=arm hy300_h713_defconfig` vor Build

### Fehler: "Python 3 required"
→ **Lösung:** `nix-shell -p python3` bereitstellen

---

## Next Task (015): UART Upload Test

Sobald `u-boot-sunxi-with-spl.bin` erfolgreich gebaut:

```bash
# Copy to project root
cp build/uboot-mainline/u-boot/u-boot-sunxi-with-spl.bin ./

# Task 015: Upload via UART zu Device A
# Command: loadk 0x40800000
# Execute: go 0x40800000
```

---

## Status Update

**Current:** GitHub connectivity issue (expected to resolve soon)

**Action:** Please run build when GitHub is back online

**Alternatively:** Let me know if you have local U-Boot source available

**Timeline:** This is blocking Task 015 + 016+. Once built, ready for UART test immediately.
