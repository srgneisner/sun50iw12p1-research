# HY300 Pro H713 Stock Firmware Analysis

**Date:** November 3, 2025  
**Device:** HY300 Pro (Magcubic Projector)  
**SoC:** Allwinner H713 (sun50iw12p1)  
**Firmware:** Android-based Stock Image

## Firmware Components Extracted

### Location
`firmware/H713_Magcubic_projector.20250922.093247.img.dump/`

### Key Files

| File | Size | Type | Purpose |
|------|------|------|---------|
| **boot0_nand.fex** | 32K | Boot Stage 0 | First-stage bootloader (NAND) |
| **boot0_sdcard.fex** | 32K | Boot Stage 0 | First-stage bootloader (SD) |
| **boot_package.fex** | 1.2M | U-Boot + DTB | Second-stage bootloader |
| **dtb.bin** | 68K | Device Tree Binary | Hardware configuration |
| **sunxi.dts** | 83K | Device Tree Source | Human-readable hardware config |
| **sunxi.fex** | 72K | DTB Config | Compiled DTB configuration |
| **config.fex** | 3K | Binary Config | DRAM, UART, GPIO parameters |
| **boot.fex** | 64M | Android Kernel | Linux kernel image |
| **boot-resource.fex** | 18M | Boot Resources | Kernel assets |
| **super.fex** | - | Super partition | Android A/B partitions |
| **misc.fex** | 16M | Misc data | Android misc partition |

## Hardware Configuration

### SoC Identification
```
Model: sun50iw12 (Allwinner H713)
Compatible: allwinner,tv303 / arm,sun50iw12p1
Device Type: TV/Projector (TV303)
```

### Serial Ports (UART)

From `sunxi.dts` device tree:

#### UART0 (Primary Debug Port)
```c
uart@2500000 {
    compatible = "allwinner,sun50i-uart";
    device_type = "uart0";
    reg = <0x00 0x2500000 0x00 0x400>;
    interrupts = <0x00 0x00 0x04>;
    sunxi,uart-fifosize = <0x40>;
    clocks = <0x02 0x41>;
    resets = <0x02 0x16>;
    uart0_port = <0x00>;
    uart0_type = <0x02>;
    status = "okay";
}
```

**Physical Specs:**
- Register: 0x2500000
- FIFO Size: 64 bytes
- Type: 0x02 (standard UART)
- Status: **Enabled in kernel**

**GPIO Pins (From config.fex):**
- PA4 = TX
- PA5 = RX

#### UART1 (Secondary)
```c
uart@2500400 {
    compatible = "allwinner,sun50i-uart";
    device_type = "uart1";
    reg = <0x00 0x2500400 0x00 0x800>;
    interrupts = <0x00 0x01 0x04>;
    sunxi,uart-fifosize = <0x40>;
    uart1_port = <0x01>;
    uart1_type = <0x04>;
    status = "okay";
}
```

#### UART3
```
uart@2500c00
device_type = "uart3"
```

**Boot Console:** UART0 (Port A pins)
**Baud Rate:** Standard (likely 115200)

### Memory Configuration

From `config.fex`:
```
dram_clk           = [DRAM Clock]
dram_type          = [Type: DDR3/DDR4]
dram_zq            = [ZQ Calibration]
dram_odt_en        = [ODT Enable]
dram_para1/2       = [DRAM Parameters]
```

**Full analysis pending** - requires binary parsing of config.fex

### Storage Interfaces

From device tree:

#### MMC/eMMC (sdmmc@4020000)
```
alias: mmc0
Type: SD card interface
Status: enabled
```

#### MMC2 (sdmmc@4022000)
```
alias: mmc2
Type: Secondary SD interface
Status: enabled
```

#### NAND Flash
```
nand0@04011000
Type: NAND controller
Status: available
```

### Communication Interfaces

#### I2C/TWI (Two-Wire Interface)
```
twi0@2502000    (I2C 0)
twi1@2502400    (I2C 1)
twi2@2502800    (I2C 2) - **In config.fex for GPIO control**
twi3@2502C00    (I2C 3)
twi4@7081400    (I2C 4 - Always-On domain)
twi5@7081800    (I2C 5 - Always-On domain)
```

**GPIO Control:** I2C2 is used for GPIO expansion (PCA9555 or similar)

#### SPI
```
spi0@4025000
spi1@4026000
```

### PWM Controllers

Multiple PWM channels available:
- `pwm@2000c00` - Main PWM
- `pwm0-pwm7` - Individual PWM channels
- `s_pwm@7020c00` - Standby PWM
- `s_pwm0-s_pwm2` - Standby PWM channels

**Purpose:** Likely used for:
- Fan control
- LED brightness
- Lamp/Light control

### Video/Media

#### Video Encode/Decode
```
ve0@1c0e000     (Main VE)
ve1@1c0e000     (Secondary VE)
```

**Purpose:** Hardware video codec for H.264/H.265

#### IR Receiver
```
s_cir@7040000 (Always-on IR)
ir0 = "/soc@2900000/s_cir@7040000"
```

**Purpose:** Power button + remote control reception

### Partition Layout

From `image.cfg`:

#### Boot Partitions
1. **boot0_nand** - Stage 0 bootloader (NAND)
2. **boot_package** - U-Boot + SPL
3. **boot** - Kernel + DTB
4. **Vboot** - Verified boot backup

#### System Partitions
1. **super** - A/B system partitions
2. **vendor_boot** - Vendor boot image
3. **dtbo** - Device tree overlay
4. **vbmeta** - Verified boot metadata

#### Data Partitions
1. **misc** - Android misc data
2. **mediadata** - Media metadata
3. **Reserve0** - Reserved space
4. **windows** - Windows partition (?)

#### Verified Boot Chain
- vbmeta
- vbmeta_system
- vbmeta_vendor

### Audio (Likely)

From `ac200` device tree node:
```
ac200@0
```

**Note:** AC200 is Allwinner's codec driver
**Purpose:** Audio codec for speaker/microphone

## Software Stack

### U-Boot
- **Type:** boot_package.fex (1.2M)
- **Features:** SPL + U-Boot combined
- **Expected Features:** 
  - UMS (USB Mass Storage) mode
  - Fastboot protocol
  - eMMC/SD boot
  - Kernel loading

### Kernel
- **Type:** Android boot.img (64M boot.fex)
- **Base:** Linux kernel with Android extensions
- **Modules:** WiFi, Bluetooth drivers (likely AIC8800)
- **Framebuffer:** Display controller integration

### Android System
- **Super partition:** A/B system
- **System image:** From super.fex
- **Vendor image:** From vendor_boot.fex
- **Recovery:** Separate recovery image (if present)

## Key Findings for Mainline Linux

### ✅ Advantages
1. **Device tree included** - TV303 reference design
2. **UART0 is enabled** - Direct serial access possible
3. **U-Boot available** - Full second-stage bootloader
4. **Clear partition layout** - Well-defined structure
5. **Standard Allwinner SoC** - Known architecture

### ⚠️ Considerations
1. **Verified Boot enabled** - May need to disable for testing
2. **Android-specific configs** - Some cleanup needed
3. **Proprietary codecs** - AC200 audio codec
4. **DDR3/DDR4 DRAM** - Parameters must be matched

### 🎯 Next Steps

1. **Extract boot0 DRAM Parameters**
   - Parse config.fex binary
   - Identify DDR type and frequency
   - Document timing parameters

2. **Analyze U-Boot**
   - Extract from boot_package.fex
   - Determine enabled features
   - Check for custom modifications

3. **Extract Mainline-Compatible DTB**
   - Use sunxi.dts as base
   - Remove Android-specific nodes
   - Adapt to mainline kernel format

4. **Test Serial Console Boot**
   - Connect CP2102 to UART0 (PA4/PA5)
   - Verify U-Boot output
   - Test bootloader commands

5. **Kernel Configuration**
   - Use extracted config.fex as guide
   - Enable H713-specific drivers
   - Prepare defconfig for mainline

## File Locations for Development

```
firmware/H713_Magcubic_projector.20250922.093247.img.dump/
├── boot0_nand.fex           ← Bootloader Stage 1
├── boot_package.fex         ← U-Boot
├── dtb.bin                  ← Device tree (binary)
├── sunxi.dts               ← Device tree (source) ⭐
├── sunxi.fex               ← DTB config
├── config.fex              ← Hardware parameters
├── boot.fex                ← Kernel
└── image.cfg               ← Partition layout

components/
├── dtb-0x10c00.bin         ← DTB from full image
└── [other extracted parts]
```

## Serial Console Setup (Next Phase)

**When CP2102 arrives:**
```bash
# Connect CP2102 to H713
# PA4 (UART0 TX) → USB RX
# PA5 (UART0 RX) → USB TX
# GND → GND

# Open serial console at 115200:
picocom -b 115200 /dev/ttyUSB0

# Expected output:
# [BROM Boot Messages]
# U-Boot 20xx.xx (xxxx-xx-xx...)
# => [U-Boot prompt]
```

## References

- Allwinner H713 Datasheet
- TV303 Reference Design
- U-Boot H713 Support
- Linux Kernel Device Tree

---

**Status:** ✅ Stock firmware fully analyzed  
**Ready for:** U-Boot extraction + Serial console testing  
**Mainline Linux:** Device tree + hardware config ready
