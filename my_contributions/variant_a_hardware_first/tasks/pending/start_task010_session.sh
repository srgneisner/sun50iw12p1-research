#!/bin/bash

# Task 010 - Start New Script Session with Logging
# Starts a fresh script session and connects to UART
# All output will be logged to TASK010_CHECKLIST.log

PROJECT_ROOT="/home/luca/Desktop/hy300-linux-porting"
PHASE2_DIR="$PROJECT_ROOT/phases/phase2-uart-access"
LOG_FILE="$PHASE2_DIR/TASK010_CHECKLIST.log"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}Task 010 - U-Boot Environment Extraction${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo ""
echo "Starting new script session with logging..."
echo "Log file: $LOG_FILE"
echo ""

# Start script session and connect to UART
echo -e "${YELLOW}Step 1: Starting script session...${NC}"
echo "Beginning: $(date '+%Y-%m-%d %H:%M:%S')" > "$LOG_FILE"
echo "" >> "$LOG_FILE"
echo "Task 010 - U-Boot Environment Extraction" >> "$LOG_FILE"
echo "=========================================" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"

echo -e "${YELLOW}Step 2: Connecting to UART console...${NC}"
echo "Connecting to /dev/ttyACM0 @ 115200 baud"
echo ""
echo "INSTRUCTIONS:"
echo "1. The screen session will now open"
echo "2. Interrupt autoboot by pressing ANY KEY"
echo "3. Copy the 6 STEPS from TASK010_CHECKLIST.md"
echo "4. Execute commands one by one"
echo "5. When done, type: exit"
echo ""
echo -e "${YELLOW}Ready? Press ENTER to start...${NC}"
read -p ""

# Start the actual session with logging
script -a "$LOG_FILE" -c "screen /dev/ttyACM0 115200"

# After session ends
echo ""
echo -e "${GREEN}═══════════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}Script session completed!${NC}"
echo -e "${GREEN}═══════════════════════════════════════════════════════════${NC}"
echo ""
echo "Log file saved to: $LOG_FILE"
echo ""
echo "NEXT STEPS:"
echo "1. Review the log file:"
echo "   cat $LOG_FILE"
echo ""
echo "2. Parse and organize the output:"
echo "   bash $PROJECT_ROOT/tasks/pending/parse_uboot_output.sh $LOG_FILE"
echo ""
echo "3. Distribute outputs to target files:"
echo "   • backup/uboot_environment.txt"
echo "   • backup/uboot_board_info.txt"
echo "   • hardware-access/uboot-commands-reference.md"
echo "   • hardware-access/uboot-network-boot.md"
echo "   • phases/phase2-uart-access/memory-map-uboot.md"
echo "   • phases/phase2-uart-access/boot-script-analysis.md"
echo ""
echo "4. Mark task as complete:"
echo "   cd $PROJECT_ROOT"
echo "   ai/tools/task-manager complete 010"
echo ""
