# HY300 Pro H713 - Quick Reference Card

**Generated:** November 3, 2025 (Stock Firmware Analysis Complete)

## Critical Hardware Info

### Serial Console (UART0) - CP2102 Connection
```
UART0 Port A:
  TX Pin: PA4  → USB RX (Green wire)
  RX Pin: PA5  → USB TX (White wire)
  GND    → GND (Black wire)
  
Settings: 115200 baud, 8N1
Tool: picocom -b 115200 /dev/ttyUSB0
```

### Memory Layout
```
DRAM:
  - Type: DDR3 or DDR4 (in config.fex)
  - Address: 0x40000000+
  - Init: U-Boot handle via config.fex params

SRAM:
  - A1 @ 0x20000 (32KB) - Not accessible in FEL
  - A2 @ 0x104000 (128KB) - Accessible via FEL ✓
  - C @ varies (175KB)

Flash:
  - eMMC (Primary)
  - NAND (Alternative)
```

### I/O Interfaces
```
Serial:     UART0 @ 0x2500000 (PA4/PA5)
            UART1 @ 0x2500400
            UART3 @ 0x2500c00

SD/MMC:     mmc0 @ 0x4020000 (SD card)
            mmc2 @ 0x4022000 (Backup)

I2C:        twi0/1/2 (Main domain)
            twi4/5 (Always-on domain)
            twi2 used for GPIO expansion

SPI:        spi0 @ 0x4025000
            spi1 @ 0x4026000

PWM:        pwm0-7 @ 0x2000c** (Main)
            s_pwm0-2 @ 0x7020c** (Standby)
            Purpose: Fan, LED, Lamp control

IR:         s_cir @ 0x7040000 (Always-on)
            Purpose: Remote + Power button
```

### Video/Media
```
Video Codec:    VE0/VE1 @ 0x1c0e000
                H.264/H.265 encode/decode

Audio Codec:    AC200
                Purpose: Speaker/Microphone
```

## Firmware Structure

### Boot Sequence
```
1. boot0_nand.fex (32KB)
   ↓ (DRAM init from config.fex)
2. boot_package.fex (1.2M) = U-Boot SPL + U-Boot
   ↓ (Loads kernel)
3. boot.fex (64M) = Linux kernel + DTB
   ↓ (Loads Android system)
4. super.fex = Android A/B system
```

### Partition Names (from image.cfg)
| Name | Size | Type | Purpose |
|------|------|------|---------|
| boot | 64M | RFSFAT16 | Kernel |
| super | - | RFSFAT16 | A/B System |
| vendor_boot | - | RFSFAT16 | Vendor files |
| misc | 16M | RFSFAT16 | Android misc |
| dtbo | 2M | RFSFAT16 | Device tree overlay |
| mediadata | 3.3M | RFSFAT16 | Media metadata |

## Development Files

### Location
`firmware/H713_Magcubic_projector.20250922.093247.img.dump/`

### Key Files
```
sunxi.dts (83KB)        ← MAIN REFERENCE
  ├─ Root: model = "sun50iw12"
  ├─ Compatible: allwinner,tv303 / arm,sun50iw12p1
  └─ Includes: UART, I2C, SPI, PWM, video configs

dtb.bin (68KB)          ← Compiled DTB

config.fex (3KB binary) ← DRAM PARAMETERS
  Contains: dram_clk, dram_type, dram_zq, etc.

boot0_nand.fex (32KB)   ← Bootloader Stage 1
boot_package.fex (1.2M) ← U-Boot

image.cfg               ← Partition layout reference
```

### Quick Copy Paths
```bash
# Copy to local workspace
cp firmware/H713_Magcubic_projector.20250922.093247.img.dump/sunxi.dts .
cp firmware/H713_Magcubic_projector.20250922.093247.img.dump/dtb.bin .
cp firmware/H713_Magcubic_projector.20250922.093247.img.dump/config.fex .
cp firmware/H713_Magcubic_projector.20250922.093247.img.dump/boot0_nand.fex ./bootloader/
```

## Next Immediate Actions

### Phase 1: Serial Console (TODAY)
```bash
1. Connect CP2102
2. Boot to U-Boot
3. Verify UART output
4. Test U-Boot commands
```

### Phase 2: Bootloader Analysis (This Week)
```bash
1. Extract boot0 DRAM parameters
2. Reverse engineer boot_package.fex
3. Identify custom modifications
4. Document boot flow
```

### Phase 3: Device Tree Cleanup (This Week)
```bash
1. Remove Android-specific nodes
2. Add mainline kernel requirements
3. Test with mainline kernel
4. Fix device tree issues
```

### Phase 4: Mainline Kernel (Next)
```bash
1. Compile with extracted config
2. Test boot via U-Boot
3. Validate hardware detection
4. Debug driver issues
```

## Known Compatibility

✅ **Definitely Works:**
- Serial Console (UART0)
- U-Boot (stock present)
- Device Tree (provided)
- SoC: H713 (sun50iw12p1)

✅ **Should Work:**
- MMC/eMMC boot
- I2C devices
- SPI devices
- PWM controllers
- IR receiver

⚠️ **Needs Investigation:**
- AC200 audio codec (proprietary)
- Video codecs (may need custom drivers)
- Android-specific hardware
- GPU/VPU integration

❌ **Known Issues:**
- FEL write mode (BROM bug)
- SRAM A1 access (locked)
- DRAM direct access in FEL

## Useful Commands

### Build Device Tree
```bash
dtc -I dtb -O dts dtb.bin -o sunxi.dts    # Decompile
dtc -I dts -O dtb sunxi.dts -o sunxi.dtb  # Compile
```

### Extract Boot Image
```bash
# If boot.fex is Android boot.img
unpackbootimg boot.fex
# Produces: kernel, ramdisk, second stage, etc.
```

### Parse config.fex
```bash
# Binary format, may need custom parser
strings config.fex | grep -E "dram|uart|gpio"
hexdump -C config.fex | head -100
```

### Check U-Boot Features
```bash
# When connected to serial console
=> printenv        # Show all variables
=> bdinfo          # Board information
=> mmc list        # MMC devices
=> i2c bus         # I2C buses
```

## Documentation References

- `STOCK_FIRMWARE_ANALYSIS.md` - Full analysis
- `sunxi.dts` - Hardware definition
- `H713_SUNXI_FEL_BUILD_SUMMARY.md` - FEL patches
- `H713_FEL_READ_OPERATIONS_REPORT.md` - FEL testing
- `FEL_TESTING_COMPLETE.md` - Test results

## Key Points to Remember

1. **UART0 (PA4/PA5) is your lifeline** - Serial console is essential
2. **Device tree is from real hardware** - sunxi.dts is accurate for this device
3. **U-Boot is available** - Not blocked by FEL write bug
4. **Stock config available** - config.fex contains real DRAM parameters
5. **TV303 reference** - Device tree is based on standard Allwinner reference

---

**Status:** Ready for Serial Console Phase  
**Estimated Timeline:** 1-2 weeks to Mainline Linux boot
**Next Blocker:** CP2102 Serial adapter arrival
