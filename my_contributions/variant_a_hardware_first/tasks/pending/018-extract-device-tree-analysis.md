---
id: "018"
title: "Extract and Analyze Device Tree"
priority: "HIGH"
phase: "2"
status: "pending"
created: "2025-11-08"
estimated_time: "45 minutes"
blocks: ["Phase IV mainline kernel", "Device tree creation"]
---

# Task 018: Extract and Analyze Device Tree

## Objective
Extract the running kernel's Device Tree Blob (DTB) from Device A, decompile to source format (.dts), and analyze differences with research device tree. Identify critical missing nodes that are causing boot errors.

## Priority Justification
🟠 **HIGH** - U-Boot boot log shows multiple device tree errors:
```
E/TC:0 0 init_external_dt:1033 Device Tree missing
[03.961]## error: update_fdt_dram_para : FDT_ERR_NOTFOUND
unable to find pwm led node in device tree.
Failed to get bl id property
Failed to get pwm_id property
```

Without a corrected device tree, mainline kernel will fail to:
- Initialize DRAM correctly
- Control PWM (fan, LEDs, backlight)
- Detect hardware properly

## Prerequisites
- [ ] Root access to Device A
- [ ] Device Tree Compiler (`dtc`) installed on host
- [ ] Research device tree at `research/sun50i-h713-hy300.dts`
- [ ] `backup/device-tree/` directory created

## Background
Device trees describe hardware to the kernel. Factory device tree has errors. We need to:
1. Extract running (corrected) version
2. Compare with research version
3. Identify what's missing
4. Create corrected mainline version

## Steps

### 1. Verify DTС Installation
```bash
# Check if dtc is installed
which dtc
dtc --version

# If not installed:
sudo apt-get install device-tree-compiler  # Debian/Ubuntu
# or check flake.nix for Nix environment
```

### 2. Extract Device Tree from Running Kernel
```bash
# Method 1: From /sys/firmware/fdt (preferred)
adb shell su -c "cat /sys/firmware/fdt" > backup/device-tree/running-kernel.dtb

# Verify it's not empty
ls -lh backup/device-tree/running-kernel.dtb
# Should be ~50-200 KB

# Check if it's valid DTB format
file backup/device-tree/running-kernel.dtb
# Should say: "Device Tree Blob version X"
```

### 3. Alternative Extraction Methods (if Method 1 fails)
```bash
# Method 2: From /proc/device-tree
adb shell su -c "find /proc/device-tree -type f" > backup/device-tree/proc-dt-files.txt
# This gives individual property files, harder to reassemble

# Method 3: From boot partition
adb shell su -c "find /dev/block -name '*dtb*' -o -name '*dtbo*'"
adb pull /dev/block/by-name/dtb backup/device-tree/boot-partition.dtb

# Method 4: Extract from kernel image
adb pull /dev/block/by-name/boot backup/device-tree/boot.img
# Use abootimg or similar to extract DTB from boot.img
```

### 4. Decompile DTB to Source (.dts)
```bash
cd backup/device-tree

# Decompile with dtc
dtc -I dtb -O dts -o running-kernel.dts running-kernel.dtb

# Check for errors during decompilation
# Warnings are normal, errors indicate corruption

# Verify output
ls -lh running-kernel.dts
# Should be larger than DTB (text format)
head -50 running-kernel.dts
```

### 5. Compare with Research Device Tree
```bash
# Diff against research version
diff -u /home/luca/Desktop/hy300-linux-porting/research/sun50i-h713-hy300.dts \
        backup/device-tree/running-kernel.dts \
        > backup/device-tree/research-vs-running.diff

# Count differences
wc -l backup/device-tree/research-vs-running.diff

# Generate side-by-side comparison
sdiff -w 200 research/sun50i-h713-hy300.dts backup/device-tree/running-kernel.dts \
      > backup/device-tree/side-by-side-comparison.txt
```

### 6. Identify Critical Missing Nodes
```bash
cd backup/device-tree

# Search for hardware-specific nodes in running DTB
grep -E "aic8800|wifi|bluetooth|bt" running-kernel.dts > nodes-wifi-bt.txt
grep -E "mali|gpu" running-kernel.dts > nodes-gpu.txt
grep -E "av1|cedar|video" running-kernel.dts > nodes-video.txt
grep -E "panel|display|lcd|dsi" running-kernel.dts > nodes-display.txt
grep -E "pwm" running-kernel.dts > nodes-pwm.txt

# Check for nodes mentioned in boot errors
grep -E "bl_id|pwm_id|fdt_dram" running-kernel.dts > nodes-boot-errors.txt
```

### 7. Extract Key Device Tree Properties
```bash
# Create analysis document
cat > backup/device-tree/ANALYSIS.md << 'EOF'
# Device Tree Analysis - HY300

## Device Tree Source
- **Running Kernel DTB:** running-kernel.dtb
- **Decompiled Source:** running-kernel.dts
- **Research DTB:** research/sun50i-h713-hy300.dts

## Hardware Nodes Found

### WiFi/Bluetooth (AIC8800)
$(grep -A 10 -i "aic8800\|wifi\|btlpm" running-kernel.dts | head -50)

### Mali GPU
$(grep -A 10 "gpu@" running-kernel.dts)

### AV1 Decoder
$(grep -A 10 "av1@" running-kernel.dts)

### Display/Panel
$(grep -A 10 "panel\|dsi\|lcd" running-kernel.dts | head -50)

### PWM Controllers
$(grep -A 5 "pwm@" running-kernel.dts)

## Critical Missing Nodes (from boot errors)
- [ ] PWM LED node (for backlight control)
- [ ] bl_id property (backlight ID)
- [ ] pwm_id property (PWM channel ID)
- [ ] DRAM parameters (update_fdt_dram_para failed)

## Next Steps
1. Add missing nodes to mainline device tree
2. Correct DRAM timing parameters
3. Add PWM bindings
4. Test with mainline kernel
EOF
```

### 8. Extract Memory/DRAM Configuration
```bash
# Find DRAM-related nodes
grep -A 20 "memory@\|dram\|DRAM" running-kernel.dts > backup/device-tree/dram-config.txt

# From U-Boot log we know:
# - DRAM SIZE = 1024 M
# - DRAM CLK = 624 MHz
# - DRAM Type = 3 (DDR3)
# - DRAMC ZQ value: 0x7b7bfb
# - DRAM ODT value: 0x40

# Check if these are in device tree
grep -i "0x7b7bfb\|624000000\|1073741824" running-kernel.dts
```

### 9. Create Annotated Device Tree
```bash
# Copy running DTS and add comments
cp running-kernel.dts running-kernel-annotated.dts

# Add header comments
sed -i '1i // HY300 Device Tree - Extracted from Running Kernel\n// Date: '$(date)'\n// Source: Device A (Factory Android)\n// Decompiled from: running-kernel.dtb\n' running-kernel-annotated.dts
```

### 10. Generate Summary Report
```bash
cat > backup/device-tree/SUMMARY.txt << EOF
Device Tree Extraction Summary
Date: $(date)

Files Created:
- running-kernel.dtb ($(ls -lh running-kernel.dtb | awk '{print $5}'))
- running-kernel.dts ($(wc -l running-kernel.dts | awk '{print $1}') lines)
- research-vs-running.diff ($(wc -l research-vs-running.diff | awk '{print $1}') lines)

Critical Nodes Identified:
- WiFi/BT: $(grep -c "aic8800\|wifi\|bt" running-kernel.dts) references
- GPU: $(grep -c "gpu\|mali" running-kernel.dts) references
- Video: $(grep -c "av1\|cedar\|video" running-kernel.dts) references
- Display: $(grep -c "panel\|dsi\|lcd" running-kernel.dts) references
- PWM: $(grep -c "pwm" running-kernel.dts) references

Missing Nodes (from boot errors):
$(grep -L "pwm.*led\|bl_id\|pwm_id" running-kernel.dts && echo "- PWM LED node missing" || echo "- PWM nodes found")

Differences from Research DT:
$(diff research/sun50i-h713-hy300.dts running-kernel.dts | grep -c "^[<>]") lines differ
EOF

cat backup/device-tree/SUMMARY.txt
```

## Success Criteria
- [ ] `running-kernel.dtb` extracted (50-200 KB size)
- [ ] `running-kernel.dts` decompiled successfully
- [ ] Diff against research DT created
- [ ] Critical hardware nodes identified (WiFi, GPU, video, display)
- [ ] Missing nodes from boot errors documented
- [ ] DRAM configuration extracted
- [ ] Analysis document created

## Expected Output
```
backup/device-tree/
├── running-kernel.dtb           # Binary DTB from kernel
├── running-kernel.dts           # Decompiled source
├── running-kernel-annotated.dts # With comments
├── boot-partition.dtb           # Alternative extraction
├── research-vs-running.diff     # Comparison
├── side-by-side-comparison.txt  # Human-readable diff
├── nodes-wifi-bt.txt            # WiFi/BT node extracts
├── nodes-gpu.txt                # GPU node extracts
├── nodes-video.txt              # Video decoder extracts
├── nodes-display.txt            # Display/panel extracts
├── nodes-pwm.txt                # PWM extracts
├── nodes-boot-errors.txt        # Nodes related to errors
├── dram-config.txt              # Memory configuration
├── ANALYSIS.md                  # Detailed analysis
└── SUMMARY.txt                  # Summary report
```

## Troubleshooting

### Issue: /sys/firmware/fdt doesn't exist
**Solution:**
```bash
# Check kernel config
adb shell cat /proc/config.gz | gunzip | grep CONFIG_PROC_DEVICETREE
# If =y, try /proc/device-tree instead

# Or extract from boot partition
adb shell find /dev/block -name "*dtb*"
```

### Issue: dtc decompilation fails
**Solution:**
```bash
# Try with -f flag (force)
dtc -f -I dtb -O dts -o running-kernel.dts running-kernel.dtb

# Or use fdtdump for raw analysis
fdtdump running-kernel.dtb > running-kernel.fdtdump.txt
```

### Issue: DTB file is 0 bytes or corrupt
**Solution:**
```bash
# Verify /sys/firmware/fdt is readable
adb shell su -c "ls -l /sys/firmware/fdt"

# Try reading in chunks
adb shell su -c "dd if=/sys/firmware/fdt bs=1024" > running-kernel.dtb

# Or extract from kernel itself
adb pull /proc/kallsyms
# Search for __dtb_start and __dtb_end addresses
```

### Issue: Diff shows thousands of lines changed
**Expected:** Device tree order might differ. Focus on specific nodes:
```bash
# Extract specific nodes for comparison
dtx_diff research/sun50i-h713-hy300.dts backup/device-tree/running-kernel.dts
```

## Device Tree Errors from Boot Log

### Error 1: Device Tree Missing (OP-TEE)
```
E/TC:0 0 init_external_dt:1033 Device Tree missing
```
**Meaning:** OP-TEE expects an external DTB parameter.  
**Solution:** U-Boot must pass DTB address to OP-TEE.

### Error 2: DRAM Parameter Update Failed
```
[03.961]## error: update_fdt_dram_para : FDT_ERR_NOTFOUND
```
**Meaning:** U-Boot tries to update `/memory` node but can't find it.  
**Solution:** Ensure memory node exists:
```dts
memory@40000000 {
    device_type = "memory";
    reg = <0x0 0x40000000 0x0 0x40000000>; // 1GB at 0x40000000
};
```

### Error 3: PWM Nodes Missing
```
unable to find pwm led node in device tree.
Failed to get pwm_id property
```
**Meaning:** U-Boot expects PWM backlight/LED controls.  
**Solution:** Add PWM nodes:
```dts
pwm: pwm@2000c00 {
    compatible = "allwinner,sun50i-h6-pwm";
    reg = <0x02000c00 0x400>;
    clocks = <&ccu CLK_PWM>;
    #pwm-cells = <3>;
};

backlight: backlight {
    compatible = "pwm-backlight";
    pwms = <&pwm 0 50000 0>;
    brightness-levels = <0 10 20 30 40 50 60 70 80 90 100>;
    default-brightness-level = <8>;
};
```

## Next Steps After Completion
1. Create corrected mainline device tree at `sun50i-h713-hy300-mainline.dts`
2. Add missing nodes identified in analysis
3. Compile test DTB: `dtc -I dts -O dtb -o test.dtb mainline.dts`
4. Validate with: `dtc -I dtb -O dts -o test-check.dts test.dtb`
5. Prepare for Phase IV kernel testing

## Related Tasks
- Task 016: Extract Firmware Blobs (provides firmware paths for DT)
- Task 017: Extract Reserve0 (provides panel timings for DT)
- Task 019: Document Memory Map (validates memory node)
- Phase IV: First mainline kernel boot (uses corrected DT)

## Related Documentation
- `CRITICAL_HARDWARE_FINDINGS.md` - Section 5 (Device Tree Issues)
- `Task015_UART-Uboot.log` - Lines 742-758 (DTB errors)
- `research/sun50i-h713-hy300.dts` - Research device tree
- Mainline: `arch/arm64/boot/dts/allwinner/sun50i-h616*.dts` (reference)

## Validation Commands
```bash
# Verify extraction
test -f backup/device-tree/running-kernel.dtb && echo "✓ DTB extracted"
test -s backup/device-tree/running-kernel.dtb && echo "✓ DTB not empty"
file backup/device-tree/running-kernel.dtb | grep -q "Device Tree" && echo "✓ Valid DTB format"

# Verify decompilation
test -f backup/device-tree/running-kernel.dts && echo "✓ DTS created"
grep -q "/dts-v1/" backup/device-tree/running-kernel.dts && echo "✓ Valid DTS format"

# Verify analysis
test -f backup/device-tree/ANALYSIS.md && echo "✓ Analysis created"
test -f backup/device-tree/SUMMARY.txt && echo "✓ Summary created"
```
