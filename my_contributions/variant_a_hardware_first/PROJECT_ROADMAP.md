# HY300 Linux Porting - Complete Project Roadmap

**Version:** 2.0 (Hardware-First Approach)  
**Start Date:** November 3, 2025  
**Estimated Duration:** 6-8 weeks  
**End Goal:** Privacy-Focused Armbian Custom ROM

## 🎯 Project Mission

**Replace factory Android firmware (containing spyware, telemetry, and malware) with a privacy-focused custom ROM based on Armbian.**

## 🛡️ Critical Safety Requirements

**HARDWARE SAFETY IS ABSOLUTE PRIORITY:**
- ✅ **Two HY300 devices available** for A/B testing
- ✅ **Complete factory backup image exists** for full recovery
- ⚠️ **NO BRICKING TOLERANCE** - every modification must be reversible
- 🔄 **UART recovery required** before any risky operations
- 📋 **A/B Testing Strategy:**
  - **Device A:** Primary development and testing device
  - **Device B:** Control device maintaining factory firmware
  - **Critical changes** tested on Device B first
  - **Always maintain one working device** at all times

## 🤖 AI Tool Integration Strategy

This project uses AI tools progressively to expand and maintain documentation:

- **ai/tools/task-manager** - Task lifecycle management
- **ai/tools/git-manager** - Git operations following project standards
- **ai/tools/context-manager** - Context and session management
- **Specialized agents** - Domain-specific expertise (hardware, drivers, integration)
- **Progressive expansion** - Roadmap evolves as we learn from hardware
- **Evidence-based** - All documentation backed by hardware findings

## Roadmap Overview

```
Phase I:    Hardware Baseline        [2-3 days]   ✅ COMPLETE (Nov 6)
Phase II:   UART Access              [1-2 days]   ✅ COMPLETE (Nov 6)
Phase III:  U-Boot Replacement       [2-3 days]   🎯 IN PREP (Nov 6+)
Phase IV:   Mainline Kernel          [1 week]
Phase V:    Driver Porting           [2-3 weeks]
Phase VI:   Armbian Integration      [1-2 weeks]  ← NEW: Custom ROM
Phase VII:  Privacy Hardening        [3-4 days]   ← NEW: Security focus
Phase VIII: System Validation        [3-4 days]   ← NEW: Final testing
```

**Total: 6-8 weeks** (accelerated Phase I+II, UART-first Phase III strategy)

---

## ✅ Confirmed Hardware Components (From Previous Research)

**Source:** `/docs/` directory - hardware analysis validated against actual DTB files

### Core SoC - Allwinner H713 (sun50iw12p1)
- **CPU:** Quad-core ARM Cortex-A53 (64-bit)
- **GPU:** ARM Mali-Midgard (confirmed via DTB, NOT Mali-G31)
- **Memory:** 2GB DDR3-1600
- **Platform:** tv303 (Allwinner TV/projector platform)

### **🎬 CRITICAL DISCOVERY: Hardware AV1 Decoder**
**Status:** ✅ Confirmed in factory DTB  
**Significance:** Premium feature, Google-Allwinner collaboration
- **Register Base:** 0x1c0d000 (4KB region)
- **Compatible:** `allwinner,sunxi-google-ve`
- **Capabilities:** 10-bit AV1 YUV420P decoding (HDR support)
- **Power Efficiency:** ~10x more efficient than software decode
- **IOCTL Interface:** Complete API extracted from Android headers
- **Driver:** Full reverse-engineered specs in `/docs/AV1_HARDWARE_DECODER_ANALYSIS.md`

### Display Subsystem - MIPS Co-processor
**Status:** ✅ Fully analyzed  
**Firmware:** display.bin (4KB, extracted)
- **Memory Region:** 0x4b100000 (1MB reserved)
- **Control Registers:** 0x3061000 (4KB)
- **Driver:** sunxi-mipsloader (vendor kernel)
- **Purpose:** Advanced display processing and projection control
- **Analysis:** `/docs/MIPS_COPROCESSOR_ANALYSIS.md`

### Connectivity - AIC8800 WiFi/Bluetooth
**Status:** ✅ Driver references identified
- **WiFi Chip:** AIC8800 (confirmed in kernel)
- **Driver:** Community implementations available
- **References:** `/docs/AIC8800_WIFI_DRIVER_REFERENCE.md`

### Projector Hardware
- **Keystone Motor:** 4-phase stepper motor with limit switch
- **Accelerometers:** stk8ba58 / kxtj3-1057 (auto-keystone)
- **IR Receiver:** Remote control input
- **Thermal Management:** PWM fan + thermal sensor
- **HDMI Input:** Video capture capability

### Storage
- **eMMC:** 8GB+ internal storage (HS200 capable)
- **Analysis:** `/docs/HY300_EMMC_STORAGE_ANALYSIS.md`

---

## Phase I: Hardware Baseline Establishment

**Status:** 🎯 **ACTIVE**  
**Duration:** 2-3 days  
**Prerequisites:** Root access (✅ Available)  
**Blocking:** None  
**Safety Level:** 🟢 LOW RISK (read-only operations)

### Objectives

1. **Complete System Documentation**
   - Document all running processes and services
   - Map kernel modules and their parameters
   - Identify hardware components and addresses
   - Extract device tree from running system
   - **Validate previous research findings** against live hardware

2. **Create Comprehensive Backups**
   - Full filesystem dump
   - Partition table and layout
   - Bootloader environment variables
   - Calibration and configuration data
   - **Privacy audit:** Document all telemetry/spyware components

3. **Hardware Component Inventory**
   - CPU, GPU, memory configuration
   - Display subsystem (MIPS co-processor + AV1 decoder)
   - Input devices (IR, motors, sensors)
   - Connectivity (WiFi, Bluetooth, HDMI)
   - Storage (eMMC layout and usage)
   - **Cross-reference** with confirmed components above

4. **Driver Analysis**
   - Extract all loaded kernel modules
   - Document module parameters and dependencies
   - **Identify spyware/telemetry drivers** for removal list
   - Analyze factory driver implementations
   - Identify mainline equivalents

### Tasks

#### Task 001: Root Access Verification and Setup ⏱️ 30 min
**Priority:** CRITICAL  
**Status:** pending

- Verify ADB/SSH root access
- Check available disk space
- Setup secure backup location
- Document access methods

**Deliverables:**
- Root access verification report
- Backup storage plan
- Access method documentation

#### Task 002: Complete System Dump 📦 2-3 hours
**Priority:** CRITICAL  
**Status:** pending  
**Depends on:** Task 001

- Dump complete filesystem via `tar`
- Extract partition table and layout
- Dump boot partition separately
- Create checksums for validation

**Deliverables:**
- `system_dump_YYYYMMDD.tar.gz`
- `partition_layout.txt`
- `boot_partition.img`
- `checksums.sha256`

#### Task 003: Kernel Module Documentation 📋 2-3 hours
**Priority:** HIGH  
**Status:** pending  
**Depends on:** Task 001

- List all loaded modules (`lsmod`)
- Extract module info (`modinfo` for each)
- Document module parameters (`/sys/module/`)
- Map module dependencies
- Extract module binaries

**Deliverables:**
- `kernel_modules_inventory.md`
- `module_dependency_graph.txt`
- `modules/` directory with extracted `.ko` files

#### Task 004: Hardware Register Mapping 🔬 4-6 hours
**Priority:** HIGH  
**Status:** pending  
**Depends on:** Task 001

- Extract device tree from running system
- Document memory-mapped I/O regions
- Map GPIO pin configurations
- Identify interrupt mappings
- Document clock configurations

**Deliverables:**
- `hardware_register_map.md`
- `factory.dtb` (extracted from kernel)
- `gpio_mappings.txt`
- `interrupt_map.txt`

#### Task 005: Calibration Data Extraction 📊 2-3 hours
**Priority:** HIGH  
**Status:** pending  
**Depends on:** Task 002

- Locate calibration files
- Extract keystone correction data
- Extract color calibration settings
- Document thermal management parameters
- Preserve WiFi/Bluetooth MAC addresses

**Deliverables:**
- `calibration_data/` directory
- `calibration_inventory.md`
- `thermal_parameters.txt`

#### Task 006: Boot Process Analysis 🔍 2-3 hours
**Priority:** MEDIUM  
**Status:** pending  
**Depends on:** Task 001

- Extract kernel boot logs (`dmesg`)
- Analyze init system (Android init.rc files)
- Document service startup sequence
- Map critical boot dependencies

**Deliverables:**
- `boot_process_documentation.md`
- `dmesg_output.txt`
- `init_rc_files/` directory

#### Task 007: Network Configuration Baseline 🌐 1-2 hours
**Priority:** MEDIUM  
**Status:** pending  
**Depends on:** Task 001

- Document WiFi chip and driver
- Extract firmware files
- Document Bluetooth configuration
- Capture working network setup

**Deliverables:**
- `network_baseline.md`
- `wifi_firmware/` directory
- `bluetooth_config.txt`

#### Task 008: Phase I Summary and Validation ✅ 2-3 hours
**Priority:** CRITICAL  
**Status:** pending  
**Depends on:** Tasks 001-007

- Validate all backups
- Verify data integrity
- Create Phase I completion report
- Prepare Phase II prerequisites

**Deliverables:**
- `PHASE_I_COMPLETION_REPORT.md`
- Backup verification checklist
- Phase II readiness assessment

### Success Criteria

- [ ] Complete filesystem backup created and verified
- [ ] All kernel modules documented with source files
- [ ] Hardware register map complete
- [ ] Calibration data extracted and preserved
- [ ] Boot process fully documented
- [ ] Network configuration baseline established
- [ ] All backups validated with checksums

### Risk Assessment

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| Storage space insufficient | Low | High | Pre-check available space |
| Root access lost | Low | Critical | Document access method |
| Backup corruption | Medium | High | Multiple backup copies |
| Missing calibration data | Medium | Medium | Extensive filesystem search |

---

## Phase II: UART Access & Boot Analysis

**Status:** ✅ **COMPLETE**  
**Duration:** ~6 hours (Nov 6, 2025, 03:00-15:00 UTC)  
**Completion Date:** November 6, 2025  
**Prerequisites:** Phase I complete ✅  
**Deliverables:** All 8 documentation files + RESEARCH_MAPPING.md validated

### Objectives (ALL MET)

1. **Establish Serial Console** ✅
   - UART pins identified (RX/TX on PCB header)
   - Serial connection via CDC ACM (/dev/ttyACM0) at 115200 baud
   - U-Boot bootloader access confirmed & responsive
   - All console settings documented

2. **Bootloader Analysis** ✅
   - U-Boot environment: 100+ variables extracted
   - Boot commands: 53 commands documented & tested
   - Bootloader features: sunxi_flash, FEL mode, A/B partitioning verified
   - Full eMMC backup: 7.3GB image available (no separate Task 012 needed)

3. **Boot Sequence Monitoring** ✅
   - Complete boot log captured: 673 lines (TASK010_CHECKLIST.log)
   - Early boot process: BOOT0 → SPL → ATF → OP-TEE → U-Boot → Linux documented
   - Boot timing: ~2.7 seconds pre-kernel (analyzed from factory logs)
   - Partition layout: 26 GPT partitions with A/B redundancy mapped

### Tasks (ALL COMPLETED)

#### Task 009: UART Hardware Connection ⏱️ COMPLETE
**Priority:** CRITICAL  
**Status:** ✅ completed  
**Actual Duration:** ~4 hours (physical setup + testing)

- ✅ UART pins identified on PCB header
- ✅ CDC ACM USB adapter working reliably
- ✅ Baud rate 115200 bps verified stable
- ✅ U-Boot console responsive to all commands

**Deliverables:**
- UART connection procedure documented in `hardware-access/root-access-verification.md`
- Serial configuration: /dev/ttyACM0, 115200 bps, 8N1
- Test results: 100+ commands executed without timeouts

#### Task 010: U-Boot Environment Extraction ⏱️ COMPLETE
**Priority:** HIGH  
**Status:** ✅ completed  
**Actual Duration:** ~1 hour

- ✅ STEP 1: printenv executed × 9 commands → 100+ variables extracted
- ✅ STEP 2: help executed × 8 commands → 53 U-Boot commands documented
- ✅ STEP 3: bdinfo + mmc info × 4 commands → hardware config captured
- ✅ STEP 4: md.l × 6 addresses → memory map validated (SRAM protected as expected)
- ✅ STEP 5: Boot script analysis → sunxi_flash method confirmed
- ✅ STEP 6: Network commands → TFTP/DHCP unavailable (intentional, FEL fallback available)

**Deliverables:**
- `backup/uboot_environment.txt` (167 lines, 100+ variables)
- `backup/uboot_board_info.txt` (70 lines, hardware specs)
- `hardware-access/uboot-commands-reference.md` (6KB, 53 commands)
- `phases/phase2-uart-access/memory-map-analysis.md` (8KB, detailed memory tests)
- `phases/phase2-uart-access/boot-script-analysis.md` (7KB, boot sequence)
- `hardware-access/uboot-network-boot.md` (6KB, network analysis)

#### Task 011: Complete Boot Log Capture ⏱️ COMPLETE
**Priority:** HIGH  
**Status:** ✅ completed  
**Actual Duration:** ~30 min

- ✅ Full U-Boot console session captured: 673 lines
- ✅ All 6 STEPS with full command output logged
- ✅ Boot timing analysis: ~2.7 seconds from BOOT0 to U-Boot prompt
- ✅ Compared with Phase I Android dmesg (timing baseline established)

**Deliverables:**
- `phases/phase2-uart-access/TASK010_CHECKLIST.log` (673 lines, complete session)
- `phases/phase2-uart-access/boot-timing-analysis.md` (8KB, performance baseline)

#### Task 012: Bootloader Backup ⏱️ OBSOLETE (Not Needed)
**Priority:** CRITICAL  
**Status:** ⏭️ skipped (full backup already available)
**Reason:** Full eMMC backup (`backup/dumps/full_emmc_dump_clean_root.img`, 7.3GB) contains all bootloader partitions + individual bootloader_a.bin already in `backup/dumps/partitions/`

**Alternative Sources:**
- Full dump: `backup/dumps/full_emmc_dump_clean_root.img`
- Individual partitions: `backup/dumps/partitions/bootloader_a.bin` (64 KB)
- Extraction procedure documented in `phases/phase2-uart-access/task012-bootloader-backup.md` (for reference/Phase III recovery)

#### Task 013: Phase II Summary ⏱️ COMPLETE
**Priority:** CRITICAL  
**Status:** ✅ completed  
**Actual Duration:** ~30 min

- ✅ UART setup procedure fully documented
- ✅ Bootloader capabilities: 53 commands, A/B partitioning, FEL recovery
- ✅ Phase III prerequisites: All met (see below)
- ✅ RESEARCH_MAPPING.md updated: 6 new Phase II findings validated

**Deliverables:**
- `phases/research-validation/RESEARCH_MAPPING.md` updated with 6 Phase II validations
- Phase III gate: OPEN ✓

### Success Criteria (100% MET)

- [x] Reliable UART serial console access (stable 115200 bps, 100+ commands executed)
- [x] U-Boot environment fully documented (100+ variables extracted)
- [x] Complete boot log captured (673 lines, all 6 STEPS)
- [x] Bootloader partitions backed up (full 7.3GB eMMC dump + individual .bin files)
- [x] Boot process timing documented (~2.7s pre-kernel established)

### Phase II Validation Results

**Hardware Findings Confirmed:**
1. ✅ CPU: Allwinner H713 (ARMv8, sun50iw12) - UART verified
2. ✅ DRAM: 1 GiB @ 0x40000000-0x80000000, 624 MHz - md.l tests passed
3. ✅ eMMC: 7.3 GB, Kingston 8GME4, GPT 26 partitions - mmc commands confirmed
4. ✅ Bootloader: U-Boot 2018.05, secure boot disabled, FEL recovery available
5. ✅ Memory Map: SRAM protected (expected), DRAM accessible, FDT @ 0x77e8de70
6. ✅ Boot Sequence: BOOT0 → SPL → ATF → OP-TEE → U-Boot → Linux (confirmed)

**Documentation Created:**
- 8 comprehensive documentation files (55+ KB total)
- 6 hardware validations added to RESEARCH_MAPPING.md
- All evidence cross-referenced with UART logs

### Phase III Readiness (✅ GATE OPEN)

**Prerequisites Met:**
- [x] UART console fully functional and tested
- [x] Bootloader environment completely understood
- [x] Memory map validated (no address conflicts)
- [x] FEL mode available (recovery confirmed)
- [x] Secure boot disabled (safe for modification)
- [x] Full eMMC backup secured
- [x] A/B partition strategy confirmed

**Next Phase (III) Approved:**
- FEL mode bootloader flashing ready
- SRAM testing procedure documented
- Recovery procedures established
- No blockers identified

---

## Phase III: U-Boot Replacement

**Status:** 🟡 **READY (Awaiting FEL Mode Validation)**  
**Duration:** 3-4 days (estimated)  
**Prerequisites:** Phase II complete ✅, UART console tested ✅, backups secured ✅  
**Blocking:** FEL mode bootloader flashing (pending safety validation)  
**Gate:** Phase II complete (Nov 6, 2025) - Ready to proceed after FEL testing

### Objectives

1. **Mainline U-Boot Configuration**
   - Configure U-Boot for H713 (sun50iw12)
   - Integrate DRAM parameters from Phase II baseline (0x40000000, 1GB, 624 MHz)
   - Setup device tree from factory DTB
   - Enable required features (MMC, USB, network, display panel)

2. **Safe Bootloader Replacement**
   - Test U-Boot via UART/FEL upload first (SRAM testing)
   - Validate boot with factory kernel (compatibility)
   - Flash to boot partition via FEL mode
   - Verify fallback/recovery mechanisms (A/B partitions)

3. **Boot Validation**
   - Verify factory Android kernel still boots with new U-Boot
   - Test U-Boot commands and features (53 commands available)
   - Document new boot procedure (compared to factory)
   - Establish emergency recovery (FEL mode confirmed available)

### Tasks

#### Task 014: Mainline U-Boot Configuration ⏱️ 4-6 hours
**Priority:** CRITICAL  
**Status:** pending  
**Depends on:** Phase II completion

- Create H713 board configuration
- Integrate DRAM parameters from Phase I
- Configure MMC, USB, UART support
- Enable network boot (optional)
- Build U-Boot binaries

**Deliverables:**
- `configs/hy300_h713_uboot_defconfig`
- `u-boot-sunxi-with-spl.bin`
- Build log and configuration notes

#### Task 015: U-Boot Testing via UART ⏱️ 2-3 hours
**Priority:** CRITICAL  
**Status:** pending  
**Depends on:** Task 014

- Load U-Boot via UART/FEL mode
- Test basic commands
- Attempt to boot factory kernel
- Verify MMC access
- Test environment save/load

**Deliverables:**
- `uboot_test_log.txt`
- Command test results
- Issues and fixes documentation

#### Task 016: Device Tree Integration ⏱️ 3-4 hours
**Priority:** HIGH  
**Status:** pending  
**Depends on:** Task 014

- Create minimal device tree for U-Boot
- Include essential hardware (MMC, UART)
- Test device tree loading
- Validate with factory kernel

**Deliverables:**
- `u-boot.dtb`
- Device tree source documentation

#### Task 017: Safe Bootloader Flash ⏱️ 1-2 hours
**Priority:** CRITICAL  
**Status:** pending  
**Depends on:** Tasks 014-016

- Document rollback procedure
- Flash U-Boot to boot partition
- Verify boot with factory kernel
- Test recovery mechanisms

**Deliverables:**
- `bootloader_flash_procedure.md`
- Flash verification log
- Recovery procedure documentation

#### Task 018: Phase III Summary ⏱️ 1-2 hours
**Priority:** CRITICAL  
**Status:** pending  
**Depends on:** Tasks 014-017

- Document U-Boot replacement process
- Validate all boot scenarios
- Create Phase IV prerequisites
- Update emergency recovery docs

**Deliverables:**
- `PHASE_III_COMPLETION_REPORT.md`
- Updated recovery procedures
- Phase IV readiness assessment

### Success Criteria

- [ ] Mainline U-Boot boots reliably
- [ ] Factory Android kernel still boots
- [ ] U-Boot environment persistent
- [ ] Recovery mechanism verified
- [ ] UART access remains functional

---

## Phase IV: Mainline Kernel Bootstrap

**Status:** ⏸️ **PENDING**  
**Duration:** 1 week  
**Prerequisites:** Phase III complete, working U-Boot  
**Blocking:** U-Boot replacement

### Objectives

1. **Minimal Device Tree Creation**
   - Create mainline kernel device tree
   - Include essential hardware only
   - Based on Phase I hardware baseline
   - Test device tree compilation

2. **Essential Driver Configuration**
   - Identify critical drivers for boot
   - Configure minimal kernel
   - Enable serial console
   - Enable MMC/storage access

3. **First Mainline Boot**
   - Build minimal kernel
   - Boot via U-Boot
   - Achieve serial console
   - Mount root filesystem

### Tasks

#### Task 019: Mainline Device Tree Creation ⏱️ 6-8 hours
**Priority:** CRITICAL  
**Status:** pending  
**Depends on:** Phase III completion

- Create `sun50i-h713-hy300.dts` for mainline
- Include CPU, memory, UART, MMC
- Reference Phase I hardware baseline
- Compile and validate device tree

**Deliverables:**
- `sun50i-h713-hy300.dts`
- `sun50i-h713-hy300.dtb`
- Device tree documentation

#### Task 020: Minimal Kernel Configuration ⏱️ 4-6 hours
**Priority:** CRITICAL  
**Status:** pending  
**Depends on:** Task 019

- Start with sunxi defconfig
- Enable H6/H713 platform support
- Configure essential drivers
- Disable unnecessary features
- Build kernel image

**Deliverables:**
- `hy300_minimal_defconfig`
- `Image` (kernel binary)
- Kernel configuration notes

#### Task 021: Initial Boot Attempt ⏱️ 2-4 hours
**Priority:** CRITICAL  
**Status:** pending  
**Depends on:** Tasks 019-020

- Load kernel via U-Boot
- Monitor boot via UART
- Debug boot failures
- Iterate on device tree/config

**Deliverables:**
- Boot logs (success or failure)
- Debug notes
- Required fixes

#### Task 022: Root Filesystem Setup ⏱️ 3-4 hours
**Priority:** HIGH  
**Status:** pending  
**Depends on:** Task 021 (partial boot)

- Create minimal ARM64 rootfs
- Configure init system
- Setup essential services
- Mount from MMC/SD

**Deliverables:**
- `rootfs.tar.gz`
- Filesystem setup documentation

#### Task 023: Serial Console Validation ⏱️ 1-2 hours
**Priority:** HIGH  
**Status:** pending  
**Depends on:** Tasks 021-022

- Verify serial console login
- Test basic system commands
- Validate filesystem access
- Document any issues

**Deliverables:**
- Serial console test log
- System functionality report

#### Task 024: Phase IV Summary ⏱️ 2-3 hours
**Priority:** CRITICAL  
**Status:** pending  
**Depends on:** Tasks 019-023

- Document mainline boot process
- List working/non-working hardware
- Identify Phase V driver priorities
- Create driver porting roadmap

**Deliverables:**
- `PHASE_IV_COMPLETION_REPORT.md`
- Hardware status matrix
- Driver porting priorities

### Success Criteria

- [ ] Mainline Linux kernel boots
- [ ] Serial console accessible
- [ ] Root filesystem mounts
- [ ] Basic system commands work
- [ ] Device tree loads correctly
- [ ] MMC/storage accessible

---

## Phase V: Driver Porting

**Status:** ⏸️ **PENDING**  
**Duration:** 2-3 weeks  
**Prerequisites:** Phase IV complete, booting mainline kernel  
**Blocking:** Mainline kernel boot

### Objectives

1. **Critical Driver Identification**
   - Prioritize drivers by importance
   - Analyze factory driver implementations
   - Identify mainline equivalents
   - Plan porting strategy

2. **Display Subsystem**
   - MIPS co-processor driver
   - Display pipeline drivers
   - GPU driver (Mali)
   - HDMI output

3. **Input Devices**
   - IR remote receiver
   - Motor control (keystone)
   - Accelerometer/sensors

4. **Connectivity**
   - WiFi (AIC8800)
   - Bluetooth
   - HDMI input (capture)

### Task Groups

#### Display Subsystem Tasks (1 week)

**Task 025-030:** MIPS co-processor driver development  
**Task 031-035:** Display pipeline integration  
**Task 036-040:** Mali GPU driver setup

#### Input Device Tasks (3-4 days)

**Task 041-043:** IR remote driver  
**Task 044-046:** Motor control driver  
**Task 047-049:** Sensor drivers

#### Connectivity Tasks (1 week)

**Task 050-055:** WiFi driver porting  
**Task 056-058:** Bluetooth driver  
**Task 059-062:** HDMI input driver

### Success Criteria

- [ ] Display output functional
- [ ] IR remote working
- [ ] Keystone motor control operational
- [ ] WiFi connectivity established
- [ ] Bluetooth functional
- [ ] HDMI input working

---

## Phase VI: Armbian Custom ROM Integration

**Status:** ⏸️ **PENDING**  
**Duration:** 1-2 weeks  
**Prerequisites:** Phase V complete, all drivers working  
**Blocking:** Driver porting  
**Safety Level:** 🟡 MEDIUM RISK (system replacement, UART recovery required)

### Objectives

1. **Armbian Base System**
   - Build Armbian for H713 (H6 base)
   - Integrate device tree and drivers
   - Configure boot system
   - Create custom bootloader scripts

2. **Driver Integration into Armbian**
   - Package all ported drivers as DKMS modules
   - Create Armbian board support package
   - Configure device-specific services
   - Setup hardware initialization

3. **Build Environment Setup**
   - Armbian build framework configuration
   - Cross-compilation environment
   - Automated build pipeline
   - Version control and release management

4. **System Services**
   - Systemd service units for hardware
   - Keystone motor control daemon
   - Thermal management service
   - HDMI input monitoring service

### Task Groups

**Task 063-068:** Armbian build system setup  
**Task 069-073:** Driver packaging and integration  
**Task 074-078:** Board support package creation  
**Task 079-083:** System services implementation  
**Task 084-088:** Boot optimization and testing

### Success Criteria

- [ ] Armbian boots reliably from eMMC
- [ ] All drivers load automatically
- [ ] System services start correctly
- [ ] Boot time < 45 seconds
- [ ] SSH access working
- [ ] Network connectivity functional

### Build Environment Requirements

**Cross-compilation Toolchain:**
```bash
# Already available in Nix environment
aarch64-unknown-linux-gnu-gcc
aarch64-unknown-linux-gnu-binutils
```

**Armbian Build Dependencies:**
- Armbian build framework (git clone)
- Device tree compiler (dtc)
- U-Boot tools (mkimage)
- Kernel build dependencies
- Root filesystem tools

---

## Phase VII: Privacy Hardening & Spyware Removal

**Status:** ⏸️ **PENDING**  
**Duration:** 3-4 days  
**Prerequisites:** Phase VI complete, Armbian booting  
**Blocking:** Armbian integration  
**Safety Level:** 🟢 LOW RISK (software-only changes)

### Objectives

1. **Spyware Identification and Removal**
   - Audit all factory Android components
   - Identify telemetry endpoints
   - Document malware components
   - Create removal blocklist

2. **Network Privacy**
   - Disable all cloud services
   - Block known telemetry domains
   - Configure firewall rules
   - Setup local-only operation mode

3. **System Hardening**
   - Minimize attack surface
   - Disable unnecessary services
   - Secure SSH configuration
   - Setup encrypted storage (optional)

4. **Privacy Validation**
   - Network traffic analysis
   - Verify no outbound connections
   - Test offline functionality
   - Document privacy features

### Task Groups

**Task 089-092:** Factory firmware privacy audit  
**Task 093-096:** Spyware removal verification  
**Task 097-100:** Network privacy configuration  
**Task 101-104:** System hardening implementation  
**Task 105:** Privacy validation and testing

### Success Criteria

- [ ] Zero telemetry/spyware components
- [ ] No unexpected network connections
- [ ] Fully functional offline
- [ ] Firewall rules active
- [ ] Security audit passed
- [ ] Privacy documentation complete

### Known Spyware Components (To Remove)

**From factory Android (to be audited in Phase I):**
- Cloud connectivity services
- Telemetry collection modules
- Third-party analytics
- Advertising frameworks
- Remote management agents
- Unidentified network services

---

## Phase VIII: System Validation & Final Testing

**Status:** ⏸️ **PENDING**  
**Duration:** 3-4 days  
**Prerequisites:** Phase VII complete  
**Blocking:** Privacy hardening  
**Safety Level:** 🟢 LOW RISK (testing only)

### Objectives

1. **A/B Validation Testing**
   - Deploy to Device A (primary test)
   - Validate on Device B (secondary test)
   - Compare functionality with factory
   - Document any regressions

2. **Hardware Feature Testing**
   - All projector functions working
   - Keystone correction validated
   - Display quality assessment
   - Thermal management under load
   - Input device responsiveness

3. **Performance Benchmarking**
   - Boot time measurement
   - Video playback performance
   - System responsiveness
   - Power consumption analysis

4. **Long-term Stability**
   - 24-hour stress test
   - Thermal cycling test
   - Power cycle testing
   - Memory leak detection

### Task Groups

**Task 106-110:** A/B deployment and comparison  
**Task 111-115:** Hardware feature validation  
**Task 116-120:** Performance benchmarking  
**Task 121-125:** Stability testing  
**Task 126:** Final documentation and release

### Success Criteria

- [ ] All hardware features functional
- [ ] Performance meets or exceeds factory
- [ ] No stability issues in 24h test
- [ ] Both devices working identically
- [ ] Complete documentation
- [ ] Recovery procedures verified

### Testing Protocol

**Device A (Primary Test Device):**
1. Flash custom ROM
2. Validate all features
3. Run stress tests
4. Document any issues

**Device B (Secondary/Control Device):**
1. Maintain factory firmware initially
2. Use for comparison testing
3. Deploy custom ROM after Device A validation
4. Verify identical behavior

**Recovery Testing:**
1. Verify UART recovery works
2. Test factory restore from backup
3. Document recovery procedures
4. Validate on both devices

---

## Timeline Summary

| Phase | Duration | Start | End | Safety Level |
|-------|----------|-------|-----|--------------|
| I - Hardware Baseline | 2-3 days | Day 1 | Day 3 | 🟢 Low Risk |
| II - UART Access | 1-2 days | Day 4 | Day 5 | 🟢 Low Risk |
| III - U-Boot | 3-4 days | Day 6 | Day 9 | 🔴 High Risk |
| IV - Mainline Kernel | 1 week | Day 10 | Day 16 | 🟡 Medium Risk |
| V - Driver Porting | 2-3 weeks | Day 17 | Day 37 | 🟢 Low Risk |
| VI - Armbian Integration | 1-2 weeks | Day 38 | Day 51 | 🟡 Medium Risk |
| VII - Privacy Hardening | 3-4 days | Day 52 | Day 55 | 🟢 Low Risk |
| VIII - System Validation | 3-4 days | Day 56 | Day 59 | 🟢 Low Risk |

**Total Estimated Duration:** 7-9 weeks

**High-Risk Phases (UART Recovery Required):**
- Phase III: U-Boot Replacement (bootloader modification)
- Phase VI: Armbian Integration (complete system replacement)

---

## Dependencies Graph

```
Phase I (Baseline) ─────────┐
                            ├──► Phase II (UART) ───┐
                            │                        │
                            │                        ├──► Phase III (U-Boot) ───┐
                            │                        │                           │
                            │                        │                           ├──► Phase IV (Kernel) ───┐
                            │                        │                           │                          │
                            │                        │                           │                          ├──► Phase V (Drivers) ───┐
                            │                        │                           │                          │                           │
                            │                        │                           │                          │                           ├──► Phase VI (Integration)
                            │                        │                           │                          │                           │
Hardware Access ────────────┴────────────────────────┴───────────────────────────┴──────────────────────────┴───────────────────────────┘
```

---

## Build Environment Setup

### Nix Development Environment (Current)

**Already configured in project:**
```bash
# Enter development shell
cd /home/luca/Desktop/sun50iw12p1-research
nix develop

# Available tools:
- aarch64-unknown-linux-gnu-gcc (cross-compiler)
- aarch64-unknown-linux-gnu-binutils
- Device tree compiler (dtc)
- Sunxi tools (sunxi-fel)
- Firmware analysis tools (binwalk, hexdump)
```

**Configuration:** `flake.nix` in project root

### Armbian Build Environment (Phase VI)

**Setup Steps:**
```bash
# 1. Clone Armbian build framework
git clone https://github.com/armbian/build.git armbian-build
cd armbian-build

# 2. Add HY300 board support
# Create: config/boards/hy300.conf
# Create: config/sources/families/sun50iw12.conf

# 3. Integrate custom device tree
cp ../sun50i-h713-hy300.dts \
   config/kernel/linux-sunxi-current/arch/arm64/boot/dts/allwinner/

# 4. Add custom drivers
cp -r ../drivers/* \
   config/kernel/linux-sunxi-current/drivers/

# 5. Build custom image
./compile.sh BOARD=hy300 BRANCH=current RELEASE=bookworm
```

### Cross-Compilation Environment

**Kernel Compilation:**
```bash
export ARCH=arm64
export CROSS_COMPILE=aarch64-unknown-linux-gnu-
make hy300_defconfig
make -j$(nproc) Image dtbs modules
```

**U-Boot Compilation:**
```bash
export ARCH=arm
export CROSS_COMPILE=aarch64-unknown-linux-gnu-
make hy300_h713_defconfig
make -j$(nproc)
```

### Required Tools Matrix

| Tool | Phase I-II | Phase III | Phase IV-V | Phase VI-VIII |
|------|-----------|-----------|------------|---------------|
| adb | ✅ Required | - | - | - |
| UART tools | - | ✅ Required | ✅ Required | ✅ Required |
| Cross-compiler | - | ✅ Required | ✅ Required | ✅ Required |
| dtc | - | ✅ Required | ✅ Required | ✅ Required |
| Armbian build | - | - | - | ✅ Required |
| Network tools | ✅ Required | - | - | ✅ Required |

---

## Risk Management

### Critical Path Risks

1. **UART Access Delay**
   - Impact: Blocks Phase II-VIII (HIGH SEVERITY)
   - Mitigation: Maximize Phase I analysis, prepare documentation in parallel
   - **A/B Strategy:** UART must be working before any risky operations

2. **Bootloader Bricking (PHASE III)**
   - Impact: Device recovery required (CRITICAL)
   - **Mitigation:**
     - ✅ Complete factory backup exists
     - ✅ Two devices available for A/B testing
     - ✅ UART recovery procedures documented
     - ✅ Test on Device B first for critical changes
     - ✅ Always maintain one working device

3. **Driver Porting Complexity (PHASE V)**
   - Impact: Extended timeline, possible feature loss
   - Mitigation:
     - Complete factory driver analysis in Phase I
     - Community driver resources (AIC8800, Mali, etc.)
     - Progressive implementation (essential drivers first)
     - Factory kernel as fallback option

4. **Privacy/Spyware Components (PHASE VII)**
   - Impact: Incomplete removal, privacy compromise
   - Mitigation:
     - Thorough audit in Phase I
     - Network traffic monitoring
     - Complete offline operation testing
     - Community security review

5. **Hardware Incompatibility**
   - Impact: Feature loss, development rework
   - Mitigation:
     - Complete baseline in Phase I
     - Cross-reference with previous research
     - Hardware validation at each step
     - A/B testing to catch regressions

### Mitigation Strategies

**Safety Protocol:**
- ✅ **Two-device A/B testing** at all times
- ✅ **Complete factory backup** for recovery
- ✅ **UART recovery** mandatory before Phase III
- ✅ **One working device** always maintained
- ✅ **Reversible changes** at every step

**Development Strategy:**
- **Multiple backups** at every phase boundary
- **UART recovery** always available
- **Factory fallback** kernel and bootloader preserved
- **Incremental testing** validate each component separately
- **Comprehensive documentation** at every step
- **A/B validation** for all critical changes

**Quality Assurance:**
- Hardware validation after each change
- Regression testing against Device B
- Performance benchmarking vs factory
- Long-term stability testing
- Community review for security

---

**Last Updated:** November 3, 2025  
**Next Review:** Phase I completion  
**Project Status:** Phase I Active
