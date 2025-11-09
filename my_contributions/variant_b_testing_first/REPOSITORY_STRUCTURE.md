# Repository Structure Guide

**Updated:** November 3, 2025  
**Purpose:** Quick reference for HY300 Linux Porting project organization

---

## 🎯 Critical Files (Start Here)

```
README.md                          → Project overview and quick start
PROJECT_STATUS.md                  → Current phase and recent progress
QUICK_REFERENCE.md                 → Essential commands and procedures
docs/KERNEL_BUILD_GUIDE.md        → How to build mainline kernel
```

---

## 📁 Directory Structure

### **Root Level** (Project Core)
```
├── README.md                       Project overview
├── PROJECT_STATUS.md              Current status & achievements
├── QUICK_REFERENCE.md             Essential commands
├── AGENTS.md                       AI agent guidelines
├── flake.nix                       Nix development environment
└── opencode.json                   Project metadata
```

### **device-trees/** (Device Configuration)
```
├── sun50i-h713-hy300-mainline.dts    ✨ MAINLINE READY (cleaned Android DTS)
├── sun50i-h713-hy300-mainline.dtb    ✨ Compiled mainline DTB
├── sun50i-h713-hy300.dts             Factory extracted DTS
├── sunxi.dts                         Stock device tree (83KB)
└── *.dtb                             Various compiled device trees
```

### **kernel-sources/** (Linux Kernel)
```
└── linux-6.16.7/                     ✨ READY TO BUILD
    ├── arch/arm64/boot/Image         [Output: kernel binary]
    ├── arch/arm64/boot/dts/          [Output: device tree binaries]
    └── [1000+ source files]
```

### **configs/** (Build Configurations)
```
├── kernel-h713-hy300.defconfig       ✨ Linux kernel config (NEW)
├── sun50i-h713-hy300_defconfig       U-Boot configuration
└── *.defconfig                       Various configs
```

### **kernels/** (Kernel Development Files)
```
├── KERNEL_BUILD_GUIDE.md             How to compile kernel
├── KERNEL_BUILD_SUMMARY.md           Previous build results
├── build_metrics_driver.sh           Driver compilation script
├── configure_h713_kernel.sh          Kernel configuration script
├── *.patch                           Kernel patches
└── hy300-keystone-motor-with-metrics.c
                                     Motor control driver
```

### **sunxi-tools/** (FEL Mode Development)
```
├── sunxi-fel                         FEL USB tool (with H713 patches)
├── fel.c, fel_lib.c                 FEL protocol implementation
├── soc_info.c                       H713 SoC definitions (patched)
└── [tools for USB recovery mode]
```

### **firmware/** (Stock Firmware Analysis)
```
├── H713_Magcubic_projector.*.img.dump/
│   ├── sunxi.dts                    Stock device tree
│   ├── dtb.bin                      Compiled DTB
│   ├── config.fex                   DRAM parameters
│   ├── boot0_nand.fex               Bootloader
│   └── boot_package.fex             U-Boot binary
├── ROM_ANALYSIS.md                  Complete ROM breakdown
├── FIRMWARE_COMPONENTS_ANALYSIS.md  Component analysis
└── DRAM_ANALYSIS.md                 DRAM parameter documentation
```

### **docs/** (Comprehensive Documentation)
```
Project Documentation:
├── PROJECT_OVERVIEW.md              Technical overview
├── HY300_HARDWARE_ENABLEMENT_STATUS.md
│                                    Hardware component matrix
├── HY300_TESTING_METHODOLOGY.md     Safe testing procedures
├── HY300_SPECIFIC_HARDWARE.md       Projector-specific details

Driver Documentation:
├── AIC8800_WIFI_DRIVER_REFERENCE.md WiFi driver analysis
├── MALI_GPU_DRIVER_ANALYSIS.md      GPU driver options
├── MIPS_COPROCESSOR_ANALYSIS.md     Display co-processor
└── [50+ analysis documents]

Build and Integration:
├── KERNEL_BUILD_GUIDE.md            Linux kernel compilation
├── FEL_ADVANCED_TESTING_GUIDE.md    FEL mode procedures
├── SRAM_A1_COMPARATIVE_ANALYSIS.md  Memory protection analysis
└── [Device tree, DTB, and integration docs]

Architecture Documentation:
├── ARM_MIPS_COMMUNICATION_PROTOCOL.md
│                                    ARM-MIPS interface design
├── MISSING_DRIVERS_IMPLEMENTATION_SPEC.md
│                                    Driver implementation roadmap
└── [System design and implementation specs]
```

### **tools/** (Development Utilities)
```
├── cleanup_dts_for_mainline.py      Device tree cleaner
├── analyze_boot0.py                 DRAM parameter extractor
├── backup-firmware.sh                Firmware backup script
├── hy300-accelerometer-service.py   Motor/sensor service
└── [Various analysis and test tools]
```

### **archive/** (Historical Documentation)
```
├── FEL_USB_TIMEOUT*.md              Old FEL debugging (pre-Nov-3)
├── H713_FEL_FIXES_SUMMARY.md        Previous FEL fixes
├── SCTLR_WARNING_ANALYSIS.md        Early analysis
└── [Pre-Serial Console test documentation]
```

### **test-results/** (Testing Outputs)
```
├── fel-test-run-*.log               FEL test logs
├── FEL_TESTING_GUIDE_QUICK_START.sh Interactive test guide
└── [Test procedures and results]
```

### **fel-dumps/** (FEL Extraction Data)
```
├── sram-a2-256.bin through sram-a2-128k.bin
│                                    SRAM A2 dump hierarchy
├── sid.bin                          Chip ID
└── [Other SRAM extraction results]
```

### **binaries/** (Binary Test Data)
```
├── sunxi-fel-4k-chunks              FEL data chunks (4KB)
├── sunxi-fel-16k-chunks             FEL data chunks (16KB)
└── sunxi-fel-h713-fixed             Fixed FEL binary
```

### **Other Directories**
```
├── nixos/                           NixOS VM configuration
├── drivers/                         Linux kernel drivers (MIPS, HDMI)
├── ai/                              AI agent context and tools
├── components/                      Extracted firmware components
├── pvr.hdmi-input/                  Kodi HDMI input addon
├── full_dump/                       Complete extraction data
├── image_extraction/                Image analysis results
└── tmp/                             Temporary files
```

---

## 🚀 Common Tasks

### Build Mainline Kernel
```bash
cd kernel-sources/linux-6.16.7
export ARCH=arm64 CROSS_COMPILE=aarch64-unknown-linux-gnu-
cp ../../configs/kernel-h713-hy300.defconfig .config
make -j$(nproc) Image modules dtbs
```

### Test FEL Mode (When device attached)
```bash
cd sunxi-tools
./sunxi-fel version
./sunxi-fel read 0x104000 131072 > /tmp/sram-dump.bin
```

### View Device Tree
```bash
cd device-trees
dtc -I dts -O dts sun50i-h713-hy300-mainline.dts | less
```

### Check Documentation
```bash
# Quick overview
cat README.md

# Current progress
cat PROJECT_STATUS.md

# Recent achievements
cat docs/KERNEL_BUILD_GUIDE.md  # Just created!
cat docs/SRAM_A1_COMPARATIVE_ANALYSIS.md
```

---

## 📊 Project Progress Summary

### ✅ Completed Phases
- **Phase I:** Firmware Analysis
- **Phase II:** U-Boot Porting
- **Phase III:** Additional Firmware Analysis
- **Phase IV:** Mainline Device Tree Creation
- **Phase V-VIII:** Driver Integration, VM Testing, Service Implementation

### 🎯 Current Phase (Phase IX+)
- **Main Tasks:** Kernel Build & Serial Console Integration
- **Status:** Device tree cleaned, kernel sources ready, config prepared
- **Next:** Build kernel, test on real device via Serial Console

### ⏱️ Timeline to First Boot
```
1. Kernel build:       ~10 minutes
2. Serial console setup: ~5 minutes
3. Boot Linux:         ~30 seconds
─────────────────────────────────
Total: ~15 minutes
```

---

## 📝 Documentation Navigation

**By Task:**
- Hardware testing: `docs/HY300_TESTING_METHODOLOGY.md`
- Device tree: `device-trees/` + `docs/KERNEL_BUILD_GUIDE.md`
- Drivers: `docs/MISSING_DRIVERS_IMPLEMENTATION_SPEC.md`
- WiFi: `docs/AIC8800_WIFI_DRIVER_REFERENCE.md`

**By Phase:**
- Project overview: `docs/PROJECT_OVERVIEW.md`
- Current status: `PROJECT_STATUS.md`
- Recent work: `docs/KERNEL_BUILD_GUIDE.md`

**By Component:**
- FEL mode: `docs/FEL_ADVANCED_TESTING_GUIDE.md`
- MIPS co-processor: `docs/MIPS_COPROCESSOR_ANALYSIS.md`
- GPU: `docs/MALI_GPU_DRIVER_ANALYSIS.md`
- Memory: `docs/SRAM_A1_COMPARATIVE_ANALYSIS.md`

---

## 🔍 File Size Overview

```
Total size: ~300MB

Largest components:
- kernel-sources/linux-6.16.7:  146MB (kernel code)
- firmware/ (stock image dump):  ~1.8GB (in subdirectory)
- sunxi-tools:                    2.1MB (FEL utilities)
- docs:                           1.9MB (documentation)
- drivers:                        620KB (kernel drivers)
```

---

## ✨ Key Generated Files (Nov 3, 2025)

```
NEW TODAY:
✅ device-trees/sun50i-h713-hy300-mainline.dts  (Cleaned Android DTS)
✅ device-trees/sun50i-h713-hy300-mainline.dtb  (Compiled DTB)
✅ configs/kernel-h713-hy300.defconfig          (Linux kernel config)
✅ kernel-sources/linux-6.16.7/                 (Kernel sources - 146MB)
✅ docs/KERNEL_BUILD_GUIDE.md                   (Build instructions)

Updated:
✅ docs/SRAM_A1_COMPARATIVE_ANALYSIS.md         (Nov 3 - hardware testing)
✅ PROJECT_STATUS.md                             (Nov 3 - FEL testing results)
```

---

## 💡 Tips

1. **Device Tree Development:** Edit in `device-trees/` and recompile with `dtc`
2. **Kernel Config:** Start from `configs/kernel-h713-hy300.defconfig`
3. **Testing:** Use `test-fel-advanced.sh` for FEL device validation
4. **Documentation:** Check `docs/` first, then specific component docs
5. **Build Environment:** Use `nix develop` for reproducible cross-compilation

---

## 🎓 Learning Path

**For newcomers:**
1. Start: `README.md`
2. Overview: `docs/PROJECT_OVERVIEW.md`
3. Hardware: `docs/HY300_SPECIFIC_HARDWARE.md`
4. Current status: `PROJECT_STATUS.md`
5. Next steps: `docs/KERNEL_BUILD_GUIDE.md`

**For kernel developers:**
1. Kernel guide: `docs/KERNEL_BUILD_GUIDE.md`
2. Device tree: `device-trees/sun50i-h713-hy300-mainline.dts`
3. Config: `configs/kernel-h713-hy300.defconfig`
4. Build: `kernel-sources/linux-6.16.7/`

**For driver developers:**
1. Driver spec: `docs/MISSING_DRIVERS_IMPLEMENTATION_SPEC.md`
2. Kernel drivers: `drivers/`
3. Integration: `docs/ARM_MIPS_COMMUNICATION_PROTOCOL.md`

---

**Last Updated:** November 3, 2025 23:49  
**Repo Status:** 🟢 Ready for kernel build and Serial Console testing
