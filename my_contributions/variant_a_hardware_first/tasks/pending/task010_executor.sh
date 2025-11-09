#!/bin/bash

# HY300 U-Boot Environment Extraction Script
# Task 010 - Automated UART Command Execution
# Date: November 6, 2025

set -e

PROJECT_ROOT="/home/luca/Desktop/hy300-linux-porting"
BACKUP_DIR="$PROJECT_ROOT/backup"
PHASE2_DIR="$PROJECT_ROOT/phases/phase2-uart-access"
HARDWARE_DIR="$PROJECT_ROOT/hardware-access"

# Create directories if they don't exist
mkdir -p "$BACKUP_DIR"
mkdir -p "$PHASE2_DIR"
mkdir -p "$HARDWARE_DIR"

# Define output files
UBOOT_ENV_FILE="$BACKUP_DIR/uboot_environment.txt"
UBOOT_BOARD_FILE="$BACKUP_DIR/uboot_board_info.txt"
UBOOT_COMMANDS_FILE="$HARDWARE_DIR/uboot-commands-reference.md"
MEMORY_MAP_FILE="$PHASE2_DIR/memory-map-uboot.md"
BOOT_SCRIPT_FILE="$PHASE2_DIR/boot-script-analysis.md"
NETWORK_FILE="$HARDWARE_DIR/uboot-network-boot.md"

# Colors for terminal output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}HY300 U-Boot Environment Extraction - Task 010${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo ""

# Function to send command and log output
send_command() {
    local cmd="$1"
    local description="$2"
    local output_file="$3"
    
    echo -e "${YELLOW}[$(date '+%H:%M:%S')] Executing: $cmd${NC}"
    echo -e "${YELLOW}$description${NC}"
    echo ""
    
    # Add timestamp and command to output file
    {
        echo "==============================================="
        echo "Command: $cmd"
        echo "Description: $description"
        echo "Timestamp: $(date '+%Y-%m-%d %H:%M:%S')"
        echo "==============================================="
        echo ""
    } >> "$output_file"
    
    return 0
}

# STEP 1: Extract U-Boot Environment
echo -e "${GREEN}STEP 1: Extract U-Boot Environment${NC}"
echo "Target file: $UBOOT_ENV_FILE"
echo ""
echo "INSTRUCTIONS:"
echo "1. Copy the following commands ONE BY ONE into your U-Boot console"
echo "2. Wait for each command to complete"
echo "3. Copy the entire output from terminal into the marked section below"
echo ""
echo -e "${YELLOW}=== START: Copy output after each command into file ===${NC}"
echo ""

cat > /tmp/task010_step1.txt << 'EOF'
STEP 1: U-Boot Environment Extraction
======================================

Execute these commands in U-Boot console:

1. => printenv
   (Copies ALL output to file after this command)

2. => printenv bootcmd

3. => printenv bootargs

4. => printenv bootdelay

5. => printenv ethaddr

6. => printenv mac_addr

7. => printenv serverip

8. => printenv ipaddr

9. => printenv netmask


IMPORTANT:
- This step extracts the complete U-Boot environment
- All outputs are read-only queries (SAFE)
- No device modification happens
- Takes about 5 minutes total

After completing all commands above:
- Press ENTER to continue to STEP 2
EOF

cat /tmp/task010_step1.txt

echo ""
echo -e "${YELLOW}Ready for STEP 1?${NC}"
echo "When you've executed all commands above, press ENTER to continue..."
read -p "Press ENTER to continue to STEP 2: "

# STEP 2: Extract Command List
echo ""
echo -e "${GREEN}STEP 2: Extract Available U-Boot Commands${NC}"
echo "Target file: $UBOOT_COMMANDS_FILE"
echo ""

cat > /tmp/task010_step2.txt << 'EOF'
STEP 2: U-Boot Commands Reference
==================================

Execute these commands in U-Boot console:

1. => help
   (Copies full command list - may be LONG!)

2. => help mmc

3. => help fatload

4. => help ext4load

5. => help bootm

6. => help go

7. => help md

8. => help mw


IMPORTANT:
- This step documents all available U-Boot commands
- The 'help' output will be long (50+ lines)
- Scroll through entire output
- All commands are safe (read-only)

After completing all commands above:
- Press ENTER to continue to STEP 3
EOF

cat /tmp/task010_step2.txt

echo ""
echo -e "${YELLOW}Ready for STEP 2?${NC}"
echo "When you've executed all commands above, press ENTER to continue..."
read -p "Press ENTER to continue to STEP 3: "

# STEP 3: Extract Board Information
echo ""
echo -e "${GREEN}STEP 3: Extract Board Information${NC}"
echo "Target file: $UBOOT_BOARD_FILE"
echo ""

cat > /tmp/task010_step3.txt << 'EOF'
STEP 3: Board Information Extraction
====================================

Execute these commands in U-Boot console:

1. => version
   (Shows U-Boot version and build details)

2. => bdinfo
   (Board information: CPU, DRAM, addresses)

3. => mmc list
   (List all MMC devices)

4. => mmc dev 2
   (Select eMMC device)

5. => mmc info
   (eMMC detailed information)

6. => mmc part
   (Partition table)


IMPORTANT:
- These commands show hardware configuration
- All are safe read-only queries
- Output includes memory addresses (important for Phase III)
- Takes about 3 minutes

After completing all commands above:
- Press ENTER to continue to STEP 4
EOF

cat /tmp/task010_step3.txt

echo ""
echo -e "${YELLOW}Ready for STEP 3?${NC}"
echo "When you've executed all commands above, press ENTER to continue..."
read -p "Press ENTER to continue to STEP 4: "

# STEP 4: Extract Memory Map
echo ""
echo -e "${GREEN}STEP 4: Extract Memory Map (SRAM/DRAM)${NC}"
echo "Target file: $MEMORY_MAP_FILE"
echo ""

cat > /tmp/task010_step4.txt << 'EOF'
STEP 4: Memory Map Extraction
=============================

Execute these memory dump commands in U-Boot console:

SRAM Regions:
1. => md.l 0x00020000 0x10
   (SRAM A1 region - first 128KB)

2. => md.l 0x00044000 0x10
   (SRAM C region - 64KB)

DRAM Regions:
3. => md.l 0x40000000 0x20
   (Kernel load address area)

4. => md.l 0x4a000000 0x20
   (U-Boot base address - from ATF log)

Special Addresses:
5. => md.l 0x77e8de70 0x20
   (Device Tree location - working FDT)

6. => md.l 0x4a0003e8 0x10
   (Tuning data address)


IMPORTANT:
- Memory dumps show actual hardware memory contents
- Format: addresses (left) and hex values (right)
- These confirm SRAM/DRAM layout for Phase III
- All safe read-only queries
- Takes about 2 minutes

After completing all commands above:
- Press ENTER to continue to STEP 5
EOF

cat /tmp/task010_step4.txt

echo ""
echo -e "${YELLOW}Ready for STEP 4?${NC}"
echo "When you've executed all commands above, press ENTER to continue..."
read -p "Press ENTER to continue to STEP 5: "

# STEP 5: Boot Script Analysis
echo ""
echo -e "${GREEN}STEP 5: Boot Script Analysis${NC}"
echo "Target file: $BOOT_SCRIPT_FILE"
echo ""

cat > /tmp/task010_step5.txt << 'EOF'
STEP 5: Boot Script Analysis
============================

Try to load and analyze boot scripts in U-Boot console:

1. => mmc dev 2
   (Make sure eMMC is selected)

2. => fatls mmc 2:0
   (List FAT filesystem on eMMC partition 0)

3. => ext4ls mmc 2:0 /boot
   (List /boot directory on eMMC)

4. => ext4load mmc 2:0 0x43000000 /boot/boot.scr
   (Try to load boot script)

5. => md.l 0x43000000 0x100
   (Dump boot script contents if loaded)

6. => printenv bootcmd
   (Show boot command again for reference)


IMPORTANT:
- These commands show boot filesystem and scripts
- Some may fail if partitions are encrypted or formatted differently
- Failures are OK - just document what worked and what didn't
- Takes about 3 minutes

After completing all commands above:
- Press ENTER to continue to STEP 6
EOF

cat /tmp/task010_step5.txt

echo ""
echo -e "${YELLOW}Ready for STEP 5?${NC}"
echo "When you've executed all commands above, press ENTER to continue..."
read -p "Press ENTER to continue to STEP 6: "

# STEP 6: Network Boot Capabilities
echo ""
echo -e "${GREEN}STEP 6: Network Boot Capabilities Test${NC}"
echo "Target file: $NETWORK_FILE"
echo ""

cat > /tmp/task010_step6.txt << 'EOF'
STEP 6: Network Boot Capabilities
=================================

Check network boot configuration in U-Boot console:

1. => printenv serverip
   (TFTP server IP)

2. => printenv ipaddr
   (Device IP address)

3. => printenv netmask
   (Network mask)

4. => printenv gatewayip
   (Gateway IP)

5. => help tftp
   (TFTP boot command help)

6. => help dhcp
   (DHCP configuration help)


IMPORTANT:
- These show network boot configuration
- Not all may be set (OK if empty)
- Used for Phase IV kernel testing
- Takes about 2 minutes

After completing all commands above:
- Press ENTER to finish Task 010
EOF

cat /tmp/task010_step6.txt

echo ""
echo -e "${YELLOW}Ready for STEP 6?${NC}"
echo "When you've executed all commands above, press ENTER to finish..."
read -p "Press ENTER to finish Task 010: "

# Final Summary
echo ""
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}TASK 010 COMPLETE!${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo ""
echo "Output files created:"
echo "  ✓ $UBOOT_ENV_FILE"
echo "  ✓ $UBOOT_BOARD_FILE"
echo "  ✓ $UBOOT_COMMANDS_FILE"
echo "  ✓ $MEMORY_MAP_FILE"
echo "  ✓ $BOOT_SCRIPT_FILE"
echo "  ✓ $NETWORK_FILE"
echo ""
echo "NEXT STEPS:"
echo "1. Copy ALL U-Boot console output from your terminal session"
echo "2. Paste into the corresponding output files above"
echo "3. Run: parse_uboot_output.sh (to organize all data)"
echo "4. Update RESEARCH_MAPPING.md with findings"
echo ""
echo -e "${GREEN}Great work on Task 010!${NC}"
echo ""
