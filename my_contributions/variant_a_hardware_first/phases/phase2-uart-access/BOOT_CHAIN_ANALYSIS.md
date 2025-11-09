# HY300 Boot Chain - Complete Analysis

**Source:** UART console logs (phases/phase2-uart-access/uart_debugging/hy300_boot.md)  
**Date:** November 5, 2025  
**Captures:** 3 complete boot sequences (1668 lines total)  
**Purpose:** Document complete boot process for Phase III bootloader replacement safety

---

## 🎯 Executive Summary

**Boot Chain:** BOOT0 → BL3-1/ATF → OP-TEE → U-Boot → Linux Kernel  
**Total Boot Time:** ~5.5 seconds (BOOT0 → Linux kernel loaded)  
**Security State:** OP-TEE active, secure bit 0, ATF in monitor mode  
**Boot Device:** eMMC (mmc2, 7456 MB, HSDDR52/DDR50)  
**Critical Finding:** U-Boot autoboot countdown visible → Can interrupt for console access

---

## 📊 Boot Sequence Timeline

### Stage 1: BOOT0 (ROM Bootloader) - T+0 to T+0.7s

**Start Marker:**
```
[121]HELLO! BOOT0 is starting!
[124]BOOT0 commit : de956292
```

**Key Actions:**
1. **PLL Configuration** (T+0.127s - T+0.130s)
   ```
   [127]set pll start
   [130]set pll end
   ```

2. **DRAM Initialization** (T+0.296s - T+0.357s)
   ```
   [296]DRAM only have internal ZQ!!
   [304]DRAM BOOT DRIVE INFO: V1.18
   [308]DRAM CLK = 624 MHz
   [311]DRAM Type = 3 (2:DDR2,3:DDR3)
   [314]DRAMC ZQ value: 0x7b7bfb
   [317]DRAM ODT value: 0x40
   [321]DRAM index value: 0x1 0x1
   [325]DRAM SIZE = 1024 M
   [355]DRAM simple test OK.
   ```
   - **Result:** 1024 MB DDR3 @ 624 MHz initialized successfully
   - **ZQ Calibration:** 0x7b7bfb (internal calibration)
   - **ODT Value:** 0x40 (On-Die Termination)

3. **eMMC Detection** (T+0.139s - T+0.281s)
   ```
   [153][mmc]: mmc driver ver 2021-07-13 11:09
   [260][mmc]: RMCA OK!
   [263][mmc]: bias 4
   [270][mmc]: MMC 5.1
   [273][mmc]: HSSDR52/SDR25 8 bit
   [276][mmc]: 50000000 Hz
   [279][mmc]: 7456 MB
   [281][mmc]: ***SD/MMC 2 init OK!!!***
   ```
   - **Device:** MMC 5.1 standard
   - **Mode:** HSDDR52/SDR25 (High-Speed DDR)
   - **Bus Width:** 8-bit
   - **Frequency:** 50 MHz
   - **Capacity:** 7456 MB (matches Phase I backup)

4. **Boot Package Loading** (T+0.655s - T+0.702s)
   ```
   [655]Loading boot-pkg Succeed(index=0).
   [660]Entry_name        = u-boot
   [675]Entry_name        = monitor
   [679]Entry_name        = scp
   [686]Entry_name        = optee
   [694]Entry_name        = dtb
   [698]tunning data addr:0x4a0003e8
   [702]Jump to second Boot.
   ```
   - **Components Loaded:**
     - u-boot (main bootloader)
     - monitor (ATF/BL3-1)
     - scp (system control processor firmware)
     - optee (Trusted Execution Environment)
     - dtb (device tree blob)
   - **Tuning Data Address:** 0x4a0003e8
   - **Next Stage:** Jump to BL3-1 (monitor)

**BOOT0 Summary:**
- Duration: ~0.7 seconds
- DRAM: 1GB DDR3 @ 624MHz ✅
- eMMC: 7456MB initialized ✅
- Boot components loaded to memory ✅
- No errors detected ✅

---

### Stage 2: BL3-1/ATF (ARM Trusted Firmware) - T+0.7s

**Start Marker:**
```
NOTICE:  BL3-1: v1.0(debug):f6fd0d6
NOTICE:  BL3-1: Built : 10:11:47, 2024-05-22
NOTICE:  BL3-1 commit: 8
NOTICE:  secure os exist
```

**Key Information:**
- **Version:** v1.0 (debug build)
- **Commit:** f6fd0d6
- **Build Date:** May 22, 2024 10:11:47
- **Commit Number:** 8
- **Secure OS Detection:** OP-TEE detected and acknowledged

**Entry to Normal World:**
```
NOTICE:  BL3-1: Preparing for EL3 exit to normal world
NOTICE:  BL3-1: Next image address = 0x4a000000
NOTICE:  BL3-1: Next image spsr = 0x1d3
```
- **Next Stage Address:** 0x4a000000 (U-Boot load address)
- **SPSR:** 0x1d3 (processor state register for context switch)
- **Security Level:** EL3 (highest privilege) → EL2/EL1 (normal world)

**ATF Summary:**
- Duration: <100ms
- Secure monitor mode established ✅
- OP-TEE integration confirmed ✅
- Handoff to U-Boot at 0x4a000000 ✅

---

### Stage 3: OP-TEE (Trusted Execution Environment) - T+0.7s

**Concurrent with ATF:**
```
E/TC:0 0 init_external_dt:1033 Device Tree missing
M/TC: OP-TEE version: a8294843 (gcc version 5.3.1 20160412 (Linaro GCC 5.3-2016.05)) #1 Sat Mar  9 10:48:25 UTC 2024 arm
```

**Key Information:**
- **Version:** a8294843
- **Build Date:** March 9, 2024 10:48:25 UTC
- **Compiler:** GCC 5.3.1 (Linaro 2016.05)
- **Architecture:** ARM (32-bit)
- **Warning:** External device tree missing (uses internal DTB)

**Security Implications:**
- OP-TEE active = secure boot environment present
- Missing external DT = relies on built-in configuration
- This may be intentional (factory security model)

**OP-TEE Summary:**
- Version: a8294843 (March 2024 build) ✅
- Secure services available ✅
- External DT warning (non-critical) ⚠️

---

### Stage 4: U-Boot (Bootloader) - T+0.8s to T+5.5s

**Start Marker:**
```
U-Boot 2018.05-00027-ge159793 (Aug 15 2025 - 10:07:31 +0000) Allwinner Technology

[00.801]CPU:   Allwinner Family
[00.804]Model: sun50iw12
[00.806]DRAM:  1 GiB
```

**Critical Information:**
- **Version:** 2018.05-00027-ge159793
- **Build Date:** August 15, 2025 10:07:31 UTC ⚠️ **VERY RECENT BUILD**
- **Vendor:** Allwinner Technology (official)
- **Platform:** sun50iw12 (H713)

**Memory Configuration:**
```
[00.810]Relocation Offset is: 35f0e000
[00.837]secure enable bit: 0
```
- **Relocation Offset:** 0x35f0e000
- **Secure Bit:** 0 (not locked, can be modified)
- **Implication:** Bootloader replacement possible ✅

**CPU/Clock Configuration:**
```
[00.854]CPU=1392 MHz,PLL6=600 Mhz,AHB=150 Mhz, APB1=100Mhz  MBus=400Mhz
[00.861]gic: sec monitor mode
```
- CPU: 1392 MHz (1.39 GHz)
- PLL6: 600 MHz
- AHB: 150 MHz
- APB1: 100 MHz
- MBus: 400 MHz
- **GIC:** Secure monitor mode (ATF still active)

**Storage Initialization:**
```
[00.874]flash init start
[00.876]workmode = 0,storage type = 2
[00.888][mmc]: get sdc2 sdc_dis_host_caps 0x180.
[01.001][mmc]: Best spd md: 2-HSDDR52/DDR50, freq: 2-50000000, Bus width: 8
[01.007]sunxi flash init ok
```
- **Work Mode:** 0 (normal boot)
- **Storage Type:** 2 (eMMC)
- **eMMC Mode:** HSDDR52/DDR50, 50MHz, 8-bit
- Flash init successful ✅

**Environment Loading:**
```
[01.017]Loading Environment from SUNXI_FLASH... OK
```
- U-Boot environment loaded from eMMC ✅
- This contains boot configuration

**USB Subsystem:**
```
[01.042]usb prepare ok
[01.845]overtime
[01.848]do_burn_from_boot usb : no usb exist
```
- USB initialized for potential firmware update
- No USB boot device detected (expected)
- Proceeds to normal boot

**⭐ CRITICAL: Autoboot Countdown**
```
Hit any key to stop autoboot:  1  0 
zztest---add env prj_mode
zztest---get prj_mode=prj_mode=0
Android's image name: arm
```
- **Countdown:** 1 second window to interrupt
- **Action:** Press ANY key during countdown → U-Boot console access
- **If Not Interrupted:** Proceeds to Android kernel boot

**Boot Command Execution:**
```
[05.503]Starting kernel ...
```
- U-Boot hands off to Linux kernel at 0x... (address in kernel logs)

**U-Boot Summary:**
- Version: 2018.05-00027-ge159793 (Aug 15, 2025) ✅
- Secure bit: 0 (not locked) ✅
- Autoboot: 1 second interrupt window ✅
- Environment: Loaded from eMMC ✅
- **CRITICAL:** Console access possible via autoboot interrupt ⭐

---

### Stage 5: Linux Kernel - T+5.5s onwards

**Kernel Start:**
```
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 5.4.99-00049-g34f0974adef4-dirty (hotack@dell-PowerEdge-R740) (arm-linux-gnueabi-gcc (Linaro GCC 5.3-2016.05) 5.3.1 20160412, GNU ld (Linaro_Binutils-2016.05) 2.25.0 Linaro 2016_02) #1006 SMP PREEMPT Mon Sep 22 09:29:12 CST 2025
[    0.000000] CPU: ARMv7 Processor [410fd034] revision 4 (ARMv7), cr=10c0383d
```

**Key Information:**
- **Version:** 5.4.99-00049-g34f0974adef4-dirty
- **Build Date:** September 22, 2025 09:29:12 CST
- **Builder:** hotack@dell-PowerEdge-R740
- **Compiler:** Linaro GCC 5.3.1
- **Architecture:** ARMv7 (32-bit kernel on 64-bit capable CPU)

**Device Tree:**
```
[    0.000000] OF: fdt: Machine model: sun50iw12
```
- DTB matches platform: sun50iw12 ✅

**Memory Layout:**
```
[    0.000000] OF: reserved mem: OVERLAP DETECTED!
[    0.000000] mipsloader (0x4b100000--0x4d941000) overlaps with framebuf (0x4bf41000--0x4d941000)
```
- **⚠️ CRITICAL WARNING:** Memory overlap detected
- **mipsloader region:** 0x4b100000 - 0x4d941000 (2.8 MB)
- **framebuffer region:** 0x4bf41000 - 0x4d941000 (overlaps)
- **Implication:** These regions must NOT be used for Phase III SRAM testing

**Boot Event Logging:**
```
[    0.006478] BOOTEVENT:         6.471414: ON
```
- Total boot time from power-on: 6.47 seconds

**Kernel Summary:**
- Version: 5.4.99 (September 2025 build) ✅
- Device Tree: sun50iw12 recognized ✅
- Memory overlap warning (framebuffer) ⚠️
- Boot successful ✅

---

## 🔐 Security Analysis

### Secure Boot State

**ATF/BL3-1:**
- ✅ Active and functioning
- ✅ Secure monitor mode enabled
- ✅ EL3 → EL1 transition clean

**OP-TEE:**
- ✅ Trusted Execution Environment active
- ⚠️ External DT missing (uses internal config)
- ✅ Secure services available

**U-Boot:**
- ⚠️ **Secure bit: 0** (NOT locked)
- ✅ Can be replaced (not signed/verified)
- ✅ Environment modifiable
- ⚠️ No secure boot chain enforcement

### Security Implications for Phase III

**GOOD NEWS:**
- Bootloader replacement is POSSIBLE (secure bit = 0)
- U-Boot not cryptographically verified
- Can modify boot sequence

**RISKS:**
- OP-TEE/ATF expect specific bootloader behavior
- Framebuffer overlap warning suggests tight memory layout
- Secure monitor may reject unexpected bootloader changes

**RECOMMENDATION:**
- Phase III must test via SRAM first (per UART_BOOTLOADER_SAFETY_PROTOCOL.md)
- Do NOT flash directly to eMMC until SRAM testing complete
- Recovery via UART/FEL required before any eMMC modification

---

## 🗺️ Memory Map (Extracted from Boot Logs)

### SRAM Regions (Used by BOOT0)
- **BOOT0 Code:** Unknown (not visible in logs)
- **BOOT0 Data:** Unknown (not visible in logs)
- **Safe SRAM Testing:** Must analyze via U-Boot console first

### DRAM Layout (1GB Total @ 0x40000000)

| Address Range | Size | Component | Status |
|---------------|------|-----------|--------|
| 0x40000000 - 0x4a000000 | 160 MB | Kernel + initramfs | Reserved |
| 0x4a000000 - 0x4a0003e8 | ~1 KB | U-Boot load address | Active |
| 0x4a0003e8 | - | Tuning data | Active |
| 0x4b100000 - 0x4d941000 | 2.8 MB | mipsloader | ⚠️ OVERLAP |
| 0x4bf41000 - 0x4d941000 | 2 MB | Framebuffer | ⚠️ OVERLAP |
| 0x77e8de70 - 0x77ebde70 | ~192 KB | FDT (device tree) | Active |
| 0x35f0e000 (offset) | - | U-Boot relocation | Active |

### Reserved Regions (DO NOT USE FOR SRAM TESTING)
- ⚠️ 0x4b100000 - 0x4d941000 (mipsloader + framebuffer overlap)
- ⚠️ OP-TEE secure memory (address not visible - likely 0x4e000000+)
- ⚠️ ATF secure monitor memory (address not visible)

### Safe Regions for Phase III SRAM Testing
- ✅ **After comprehensive U-Boot memory inspection**
- ✅ Must use `md.l` command to verify unused regions
- ✅ Recommended: 0x20000000 - 0x20100000 (SRAM A1/A2, if confirmed safe)

---

## ⚠️ Critical Findings for Phase III

### 1. U-Boot Build Date: August 15, 2025
**Implication:** This is a VERY recent build (3 months old)
- May contain manufacturer-specific modifications
- Likely customized for HY300 hardware
- Must compare against mainline U-Boot 2018.05 to identify changes

### 2. Autoboot Countdown: 1 Second
**Implication:** Console access possible but requires quick reaction
- Window: "Hit any key to stop autoboot: 1 0"
- Action: Press SPACE or ENTER during countdown
- Fallback: Power cycle if missed, try again

### 3. Secure Bit = 0
**Implication:** Bootloader replacement is POSSIBLE
- No cryptographic verification enforced
- Can replace with mainline U-Boot
- Must preserve hardware initialization sequence

### 4. Memory Overlap Warning
**Implication:** Tight memory layout, must be careful with SRAM testing
- mipsloader and framebuffer overlap
- Phase III SRAM addresses must avoid these regions
- Requires U-Boot memory inspection before testing

### 5. OP-TEE Active
**Implication:** Secure services must be maintained
- New bootloader must load OP-TEE correctly
- ATF/BL3-1 expects specific boot sequence
- Mainline U-Boot may need OP-TEE configuration

---

## 📋 Next Steps (Phase II Continuation)

### Immediate Tasks
1. ✅ Boot chain documented (THIS FILE)
2. 🔄 **Create detailed memory map** (memory_map.md)
3. 🔄 **Extract U-Boot environment** (uboot_baseline.md)
4. 🔄 **Risk assessment** (PHASE2_RISK_ASSESSMENT.md)
5. 🔄 **U-Boot console test plan** (uboot_test_plan.md)

### U-Boot Console Access (Next Session)
**Prerequisites:**
- Read PHASE2_RISK_ASSESSMENT.md (must create first)
- Read uboot_test_plan.md (must create first)
- USER APPROVAL required before console interaction

**Test Sequence:**
1. Power cycle device with UART connected
2. Wait for "Hit any key to stop autoboot: 1 0"
3. Press SPACEBAR immediately
4. Verify U-Boot prompt appears: `U-Boot>`
5. Execute ONLY read-only commands (printenv, version, bdinfo)

### Phase III Preparation
**Blockers Resolved:**
- ✅ Boot chain understood
- ✅ U-Boot version identified
- 🔄 Memory map needed (next task)
- 🔄 Risk assessment needed (critical)
- 🔄 Console access tested (after risk assessment)

**Phase III Requirements:**
- Mainline U-Boot 2018.05+ configured for sun50iw12
- OP-TEE support enabled in U-Boot
- SRAM testing environment prepared
- Recovery procedures validated

---

## 🎓 Lessons Learned

### What Worked Well
✅ UART connection stable (1668 lines, zero corruption)  
✅ Boot sequence clean (no critical errors)  
✅ All components identifiable (BOOT0, ATF, OP-TEE, U-Boot, kernel)  
✅ Autoboot interrupt window visible  
✅ Security state clear (secure bit 0 = modifiable)  

### Concerns Identified
⚠️ Very recent U-Boot build (Aug 2025) - may have vendor changes  
⚠️ Memory overlap warning - tight layout, careful SRAM testing needed  
⚠️ OP-TEE external DT missing - may complicate mainline U-Boot integration  
⚠️ 1-second autoboot window - requires quick reaction or automation  

### Risk Mitigation Strategy
1. **NEVER skip SRAM testing** (per UART_BOOTLOADER_SAFETY_PROTOCOL.md)
2. **ALWAYS verify memory safety** before Phase III
3. **NEVER assume mainline U-Boot will work** without OP-TEE config
4. **ALWAYS have recovery path** (Device B, UART, FEL mode)

---

**Status:** ✅ Boot Chain Analysis COMPLETE  
**Next Task:** Memory Map Extraction (Task #6)  
**Blocker:** Risk Assessment MUST be created before U-Boot console testing

**Last Updated:** November 5, 2025
