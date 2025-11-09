#!/bin/bash

# HY300 U-Boot Output Parser
# Automatically extracts and organizes U-Boot command outputs
# Usage: ./parse_uboot_output.sh <input_file>

set -e

PROJECT_ROOT="/home/luca/Desktop/hy300-linux-porting"
BACKUP_DIR="$PROJECT_ROOT/backup"
PHASE2_DIR="$PROJECT_ROOT/phases/phase2-uart-access"
HARDWARE_DIR="$PROJECT_ROOT/hardware-access"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

INPUT_FILE="${1:-/tmp/uboot_session.log}"

if [ ! -f "$INPUT_FILE" ]; then
    echo -e "${RED}Error: Input file not found: $INPUT_FILE${NC}"
    echo "Usage: $0 <input_file>"
    echo ""
    echo "Example:"
    echo "  Copy your U-Boot console session to: /tmp/uboot_session.log"
    echo "  Then run: $0 /tmp/uboot_session.log"
    exit 1
fi

echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}U-Boot Output Parser${NC}"
echo -e "${BLUE}Input: $INPUT_FILE${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo ""

# Function to extract section between markers
extract_section() {
    local start_marker="$1"
    local end_marker="$2"
    local output_file="$3"
    local description="$4"
    
    echo -e "${YELLOW}Extracting: $description${NC}"
    
    if grep -q "$start_marker" "$INPUT_FILE"; then
        # Extract from start_marker to end_marker
        sed -n "/$start_marker/,/$end_marker/p" "$INPUT_FILE" | \
            sed '1d;$d' >> "$output_file" 2>/dev/null || true
        echo -e "${GREEN}  ✓ Added to: $output_file${NC}"
    else
        echo -e "${YELLOW}  ⚠ Marker not found: $start_marker${NC}"
    fi
}

# Initialize output files
echo -e "${BLUE}Creating output files...${NC}"

# 1. Environment Variables
{
    echo "# U-Boot Environment Variables"
    echo "# Extracted: $(date '+%Y-%m-%d %H:%M:%S')"
    echo "# Device: HY300"
    echo "# U-Boot Version: 2018.05"
    echo ""
    echo "## All Environment Variables (printenv output)"
    echo ""
    echo "\`\`\`"
} > "$BACKUP_DIR/uboot_environment.txt"

# 2. Board Information
{
    echo "# U-Boot Board Information"
    echo "# Extracted: $(date '+%Y-%m-%d %H:%M:%S')"
    echo "# Device: HY300"
    echo ""
    echo "## Version Information"
    echo "\`\`\`"
} > "$BACKUP_DIR/uboot_board_info.txt"

# 3. Commands Reference
{
    echo "# U-Boot Commands Reference"
    echo ""
    echo "**Device:** HY300 (sun50iw12)"
    echo "**U-Boot Version:** 2018.05-00027-ge159793"
    echo "**Extracted:** $(date '+%Y-%m-%d %H:%M:%S')"
    echo ""
    echo "## Available Commands"
    echo ""
    echo "### Core Commands"
    echo "\`\`\`"
} > "$HARDWARE_DIR/uboot-commands-reference.md"

# 4. Memory Map
{
    echo "# U-Boot Memory Map"
    echo ""
    echo "**Device:** HY300 (sun50iw12)"
    echo "**Extracted:** $(date '+%Y-%m-%d %H:%M:%S')"
    echo ""
    echo "## SRAM Regions"
    echo ""
    echo "### SRAM A1 (0x00020000 - 128KB)"
    echo "\`\`\`"
} > "$PHASE2_DIR/memory-map-uboot.md"

# 5. Boot Script Analysis
{
    echo "# U-Boot Boot Script Analysis"
    echo ""
    echo "**Device:** HY300 (sun50iw12)"
    echo "**Extracted:** $(date '+%Y-%m-%d %H:%M:%S')"
    echo ""
    echo "## Boot Process"
    echo ""
    echo "### Boot Command"
    echo "\`\`\`bash"
} > "$PHASE2_DIR/boot-script-analysis.md"

# 6. Network Configuration
{
    echo "# U-Boot Network Boot Configuration"
    echo ""
    echo "**Device:** HY300 (sun50iw12)"
    echo "**Extracted:** $(date '+%Y-%m-%d %H:%M:%S')"
    echo ""
    echo "## Network Settings"
    echo ""
    echo "### Current Configuration"
    echo "\`\`\`"
} > "$HARDWARE_DIR/uboot-network-boot.md"

echo -e "${GREEN}Output files initialized${NC}"
echo ""

# Parse printenv output
echo -e "${YELLOW}Parsing printenv output...${NC}"
if grep -A 200 "^=> printenv$" "$INPUT_FILE" | head -200 >> "$BACKUP_DIR/uboot_environment.txt"; then
    echo -e "${GREEN}  ✓ Environment variables extracted${NC}"
fi

# Parse help output
echo -e "${YELLOW}Parsing help output...${NC}"
if grep -A 100 "^=> help$" "$INPUT_FILE" | head -100 >> "$HARDWARE_DIR/uboot-commands-reference.md"; then
    echo -e "${GREEN}  ✓ Commands list extracted${NC}"
fi

# Parse bdinfo
echo -e "${YELLOW}Parsing board info...${NC}"
if grep -A 20 "^=> bdinfo$" "$INPUT_FILE" >> "$BACKUP_DIR/uboot_board_info.txt"; then
    echo -e "${GREEN}  ✓ Board info extracted${NC}"
fi

# Parse memory dumps
echo -e "${YELLOW}Parsing memory dumps...${NC}"
if grep "md\.l 0x00020000" "$INPUT_FILE" -A 10 >> "$PHASE2_DIR/memory-map-uboot.md"; then
    echo -e "${GREEN}  ✓ Memory dumps extracted${NC}"
fi

echo ""
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}Parsing Complete!${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo ""
echo "Output files created/updated:"
ls -lh "$BACKUP_DIR/uboot_environment.txt" 2>/dev/null && echo "  ✓ uboot_environment.txt"
ls -lh "$BACKUP_DIR/uboot_board_info.txt" 2>/dev/null && echo "  ✓ uboot_board_info.txt"
ls -lh "$HARDWARE_DIR/uboot-commands-reference.md" 2>/dev/null && echo "  ✓ uboot-commands-reference.md"
ls -lh "$PHASE2_DIR/memory-map-uboot.md" 2>/dev/null && echo "  ✓ memory-map-uboot.md"
ls -lh "$PHASE2_DIR/boot-script-analysis.md" 2>/dev/null && echo "  ✓ boot-script-analysis.md"
ls -lh "$HARDWARE_DIR/uboot-network-boot.md" 2>/dev/null && echo "  ✓ uboot-network-boot.md"
echo ""
echo "NEXT STEPS:"
echo "1. Review generated files for completeness"
echo "2. If needed, manually edit files to clean up formatting"
echo "3. Run: update_research_mapping.sh (to integrate findings)"
echo ""
