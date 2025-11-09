# U-Boot Commands Reference

**Device:** HY300 (sun50iw12)
**U-Boot Version:** 2018.05-00027-ge159793
**Extracted:** 2025-11-06 03:05:58

## Available Commands (from 'help')

# U-Boot Command Reference
# Extracted: 2025-11-06 03:05:58
# Device: HY300 (sun50iw12)
# U-Boot Version: 2018.05-00027-ge159793

## Available U-Boot Commands on HY300

This device runs a customized U-Boot build with vendor-specific commands. Total: 53 commands

### Command Categories

---

## System & Utility Commands

| Command | Description |
|---------|-------------|
| **?** | Alias for 'help' |
| **help** | Print command description/usage |
| **version** | Print monitor, compiler and linker version |
| **reset** | Perform RESET of the CPU |
| **sleep** | Delay execution for some time |

---

## Memory Commands

| Command | Description |
|---------|-------------|
| **md** | Memory display `md [.b, .w, .l] address [# of objects]` |
| **mw** | Memory write (fill) `mw [.b, .w, .l] address value [count]` |
| **mm** | Memory modify (auto-incrementing address) |
| **nm** | Memory modify (constant address) |
| **cp** | Memory copy |
| **cmp** | Memory compare |
| **base** | Print or set address offset |
| **crc32** | Checksum calculation |
| **memtester** | Start application at address 'addr' |

---

## Boot Commands

| Command | Description |
|---------|-------------|
| **boot** | Boot default, i.e., run 'bootcmd' |
| **bootd** | Boot default, i.e., run 'bootcmd' |
| **bootm** | Boot application image from memory `bootm [addr [arg ...]]` |
| **bootr** | Boot application image from memory |
| **sunxi_mips** | Boot application image from memory |

---

## Environment Commands

| Command | Description |
|---------|-------------|
| **printenv** | Print environment variables |
| **setenv** | Set environment variables |
| **editenv** | Edit environment variable |
| **saveenv** | Save environment variables to persistent storage |
| **env** | Environment handling commands |
| **run** | Run commands in an environment variable |
| **setexpr** | Set environment variable as result of eval expression |
| **echo** | Echo args to console |
| **itest** | Return true/false on integer compare |

---

## Storage/Partition Commands

| Command | Description |
|---------|-------------|
| **mmc** | MMC sub system |
| **mmcinfo** | Display MMC info |
| **part** | Disk partition related commands |
| **gpt** | GUID Partition Table |
| **fatinfo** | Print information about filesystem |
| **fatload** | Load binary file from a dos filesystem |
| **fatls** | List files in a directory (default /) |
| **fatsize** | Determine a file's size |
| **fatwrite** | Write file into a dos filesystem |

---

## Board Information Commands

| Command | Description |
|---------|-------------|
| **bdinfo** | Print Board Info structure |
| **coninfo** | Print console devices and information |

---

## Flash/Storage Commands

| Command | Description |
|---------|-------------|
| **flinfo** | Print FLASH memory information |
| **erase** | Erase FLASH memory |
| **protect** | Enable or disable FLASH write protection |
| **pbread** | Read data from private data |
| **pst** | Read data from secure storage erase flag |

---

## Device Tree Commands

| Command | Description |
|---------|-------------|
| **fdt** | Flattened device tree utility commands |
| **set_working_fdt** | Set_working_fdt fdt_addr |

---

## Serial/USB Commands

| Command | Description |
|---------|-------------|
| **loadb** | Load binary file over serial line (kermit mode) |
| **loads** | Load S-Record file over serial line |
| **loadx** | Load binary file over serial line (xmodem mode) |
| **loady** | Load binary file over serial line (ymodem mode) |
| **fastboot** | Fastboot - enter USB Fastboot protocol |
| **usb** | USB sub-system |
| **usbboot** | Boot from USB device |
| **source** | Run script from memory |

---

## Allwinner-Specific Commands

| Command | Description |
|---------|-------------|
| **sunxi_flash** | Sunxi_flash sub-system (proprietary storage) |
| **sunxi_fel** | Do FEL from boot (FEL mode recovery) |
| **sunxi_card0_probe** | Probe sunxi card0 device |
| **sunxi_dma** | Do DMA test |
| **sunxi_nand_test** | Sunxi_nand_test sub system |
| **sunxi_so** | Sunxi_so sub-system |
| **efex** | Run to efex |
| **uburn** | Do a burn from boot |
| **auto_update_v2** | Do TFCard of Udisk update |

---

## Test Commands

| Command | Description |
|---------|-------------|
| **checkboard** | Set backlight |
| **key_test** | Test the key value |
| **factory_test** | Factory test |
| **timer_test** | Do a timer and int test |
| **timer_test1** | Do a timer and int test |
| **sprite_test** | Do a sprite test |
| **screen_char** | Show default screen chars |
| **pwm_led** | PWM_led - set pwm led |

---

## Important Notes on This Build

### NOT AVAILABLE:
- **tftp** - Not compiled in (no network boot support)
- **dhcp** - Not compiled in (no network boot support)  
- **ext4load** - Not compiled in (no ext4 filesystem support)
- **ext4ls** - Not compiled in (cannot access ext4 partitions)

### Network Boot Not Supported:
This U-Boot build does not include network booting capabilities:
```
=> help tftp
Unknown command 'tftp' - try 'help' without arguments for list of all known commands

=> help dhcp
Unknown command 'dhcp' - try 'help' without arguments for list of all known commands
```

### Proprietary Storage System:
The device uses Allwinner `sunxi_flash` subsystem instead of standard MMC commands for boot partition access.

---

## Relevant Command Details

### MMC Commands
```
Usage:
mmc info - display info of the current MMC device
mmc read addr blk# cnt
mmc write addr blk# cnt
mmc erase blk# cnt
mmc rescan
mmc part - lists available partition on current mmc device
mmc dev [dev] [part] - show or set current mmc device [partition]
mmc list - lists available devices
mmc hwpartition [args...] - does hardware partitioning
```

### FatLoad Command
```
Usage:
fatload <interface> [<dev[:part]> [<addr> [<filename> [bytes [pos]]]]]
    - Load binary file 'filename' from 'dev' on 'interface'
      to address 'addr' from dos filesystem.
```

### Memory Display Command
```
Usage:
md [.b, .w, .l] address [# of objects]
```

### Memory Write Command  
```
Usage:
mw [.b, .w, .l] address value [count]
```

### Boot Command (Kernel)
```
Usage:
bootm [addr [arg ...]]
    - boot application image stored in memory
    - passing arguments 'arg'; when booting a Linux kernel,
      'arg' can be the address of an initrd image
```

---

## Phase III Relevant Commands

For bootloader replacement (Phase III), these commands are most relevant:

- **sunxi_fel** - FEL mode entry (recovery/flashing)
- **mmc** - MMC device configuration
- **mw** - Memory write (testing SRAM areas)
- **md** - Memory read (validation)
- **bootm** - Kernel boot (validation after replacement)
- **reset** - Soft reset

---

## Summary

Total Commands: 53 documented commands
- Vendor-specific: 11 Allwinner commands (sunxi_*)
- Standard: 42 U-Boot commands
- Network boot: ❌ Not supported
- Ext4 filesystem: ❌ Not supported
- Recovery capability: ✅ FEL mode available

This build is optimized for Allwinner display/media applications with minimal network support.
