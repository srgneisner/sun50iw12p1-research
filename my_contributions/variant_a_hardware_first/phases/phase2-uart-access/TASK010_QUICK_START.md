# Task 010 - PRAKTISCHE ANLEITUNG (Du bist JETZT im U-Boot!)

**Status:** 🎯 DEINE U-BOOT SESSION LÄUFT NOCH ✅  
**Datei:** `hy300_first_uart_console.log` (Screen-Session läuft weiter)  
**Zeit:** November 6, 2025  

---

## 🎯 DEIN NÄCHSTER SCHRITT (JETZT GLEICH!)

Du hast UART-Zugang. Die `screen`-Session läuft noch. Das ist PERFEKT!

### Anleitung in 3 Schritten:

**SCHRITT A: Zurück zur U-Boot Konsole**

```bash
# In deinem Terminal:
# Drücke Ctrl+A, dann D um aus screen auszusteigen
# ODER: Minimiere das Fenster und mach folgendes in neuem Terminal:

# Öffne ein NEUES TERMINAL in VSCode oder deinem Shell
cd /home/luca/Desktop/hy300-linux-porting
```

**SCHRITT B: Interaktives Task-Skript starten**

```bash
# Führe aus:
bash tasks/pending/task010_executor.sh

# Das Skript wird dir JEDEN Schritt erklären
# Zeigt dir welche Befehle zu tippen sind
# Und sagt dir wann du weiter machst
```

**SCHRITT C: Die Befehle in U-Boot eingeben**

Das Skript wird dir sagen:

```
STEP 1: Execute these commands:
1. => printenv
2. => printenv bootcmd
3. => printenv bootargs
...
```

Du tippst diese Befehle in deine U-Boot Konsole:

```bash
# IN DEINER U-BOOT KONSOLE (screen /dev/ttyACM0):
=> printenv
=> printenv bootcmd
=> printenv bootargs
...
```

---

## 📋 KURZ-ANLEITUNG (Wenn du das Skript nicht nutzen möchtest)

Falls du lieber manuell arbeiten möchtest, hier sind die 6 Schritte:

### STEP 1: U-Boot Environment (5 min)

```bash
=> printenv              # Alle Umgebungsvariablen
=> printenv bootcmd      # Boot-Befehl
=> printenv bootargs     # Kernel-Parameter
=> printenv bootdelay    # Boot-Verzögerung
=> printenv ethaddr      # Ethernet-Adresse
=> printenv mac_addr     # MAC-Adresse
=> printenv serverip     # Server IP
=> printenv ipaddr       # Gerät IP
=> printenv netmask      # Netzwerk-Maske
```

**Speichern:** ALLE Ausgaben kopieren in → `backup/uboot_environment.txt`

### STEP 2: U-Boot Befehle (3 min)

```bash
=> help                  # LANGE Liste - ganzen Output kopieren!
=> help mmc
=> help fatload
=> help ext4load
=> help bootm
=> help go
=> help md
=> help mw
```

**Speichern:** ALLE Ausgaben kopieren in → `hardware-access/uboot-commands-reference.md`

### STEP 3: Board-Informationen (3 min)

```bash
=> version               # Version & Build-Info
=> bdinfo                # Board Info
=> mmc list              # MMC-Geräte auflisten
=> mmc dev 2             # eMMC wählen
=> mmc info              # eMMC Details
=> mmc part              # Partitionstabelle
```

**Speichern:** ALLE Ausgaben kopieren in → `backup/uboot_board_info.txt`

### STEP 4: Memory Map (2 min)

```bash
# SRAM Regionen:
=> md.l 0x00020000 0x10  # SRAM A1 (128KB)
=> md.l 0x00044000 0x10  # SRAM C (64KB)

# DRAM Regionen:
=> md.l 0x40000000 0x20  # Kernel Load-Adresse
=> md.l 0x4a000000 0x20  # U-Boot Base

# Special:
=> md.l 0x77e8de70 0x20  # Device Tree
=> md.l 0x4a0003e8 0x10  # Tuning Data
```

**Speichern:** ALLE Ausgaben kopieren in → `phases/phase2-uart-access/memory-map-uboot.md`

### STEP 5: Boot-Script (3 min)

```bash
=> mmc dev 2             # eMMC ausgewählt?
=> fatls mmc 2:0         # FAT Dateisystem auflisten
=> ext4ls mmc 2:0 /boot  # /boot Verzeichnis
=> ext4load mmc 2:0 0x43000000 /boot/boot.scr  # Boot-Script laden
=> md.l 0x43000000 0x100 # Script-Inhalt
=> printenv bootcmd      # Boot-Befehl nochmal
```

**Speichern:** ALLE Ausgaben kopieren in → `phases/phase2-uart-access/boot-script-analysis.md`

### STEP 6: Netzwerk (2 min)

```bash
=> printenv serverip     # TFTP Server IP
=> printenv ipaddr       # Gerät IP
=> printenv netmask      # Netzwerk-Maske
=> printenv gatewayip    # Gateway IP
=> help tftp             # TFTP Hilfe
=> help dhcp             # DHCP Hilfe
```

**Speichern:** ALLE Ausgaben kopieren in → `hardware-access/uboot-network-boot.md`

---

## 💾 WIE DU DIE AUSGABEN SPEICHERST

### Option A: Mit `script` Befehl (BEST)

```bash
# IN DEINER SHELL (NICHT U-Boot):
script /tmp/uboot_commands.log

# Jetzt startest du screen neu:
screen /dev/ttyACM0 115200

# Du tippst alle U-Boot Befehle
# Alles wird aufgezeichnet

# Dann: Ctrl+D um zu beenden
# Die Datei: /tmp/uboot_commands.log hat ALLES
```

### Option B: Manuell Kopieren-Einfügen

```bash
# Nach jedem Befehl:
# 1. Markiere den Output mit der Maus
# 2. Ctrl+Shift+C zum Kopieren
# 3. Öffne die entsprechende Datei
# 4. Einfügen
```

### Option C: Mit `socat` (Advanced)

```bash
# Startet eine Logging-Session:
socat -d -d pty,raw,echo=0 pty,raw,echo=0 | tee /tmp/uart.log &
```

---

## 📊 WICHTIGE OUTPUTS ZUM SPEICHERN

Nach jedem Schritt solltest du diese Dateien haben:

```
backup/
├── uboot_environment.txt       # printenv Output
└── uboot_board_info.txt        # version, bdinfo, mmc info Output

hardware-access/
├── uboot-commands-reference.md # help Output
└── uboot-network-boot.md       # Netzwerk-Befehle

phases/phase2-uart-access/
├── memory-map-uboot.md         # md.l Outputs
└── boot-script-analysis.md     # Boot-Script & fatls/ext4ls
```

---

## ✅ NACH TASK 010 FERTIG

**Wenn alle 6 Steps erledigt:**

```bash
# 1. Alle Dateien sollten gefüllt sein
ls -lh backup/uboot_*.txt
ls -lh hardware-access/uboot-*.md
ls -lh phases/phase2-uart-access/*analysis.md

# 2. Optional: Parse-Skript zum Formatieren:
bash tasks/pending/parse_uboot_output.sh /tmp/uboot_commands.log

# 3. Task als complete markieren:
ai/tools/task-manager complete 010

# 4. Status aktualisieren:
git add -A
git commit -m "Task 010: U-Boot environment extracted"
```

---

## 🎯 DEIN NÄCHSTER MOVE

**JETZT SOFORT:**

1. ✅ Wechsel zu deinem U-Boot Terminal (screen)
2. ✅ Starte mit STEP 1 (printenv Befehle)
3. ✅ Kopiere alle Outputs
4. ✅ Speichere in die entsprechenden Dateien
5. ✅ Arbeite durch alle 6 Steps

**Geschätzter Aufwand:** 20-30 Minuten (sehr einfach!)

---

## ⚡ SCHNELLE BEFEHLS-REFERENZ

Wenn du eine Checkliste brauchst:

```bash
# Copy-Paste diesen Block in U-Boot:
printenv
printenv bootcmd
printenv bootargs
printenv bootdelay
printenv ethaddr
printenv mac_addr
printenv serverip
printenv ipaddr
printenv netmask
help
help mmc
help fatload
help ext4load
help bootm
help go
help md
help mw
version
bdinfo
mmc list
mmc dev 2
mmc info
mmc part
md.l 0x00020000 0x10
md.l 0x00044000 0x10
md.l 0x40000000 0x20
md.l 0x4a000000 0x20
md.l 0x77e8de70 0x20
md.l 0x4a0003e8 0x10
mmc dev 2
fatls mmc 2:0
ext4ls mmc 2:0 /boot
ext4load mmc 2:0 0x43000000 /boot/boot.scr
md.l 0x43000000 0x100
printenv bootcmd
printenv serverip
printenv ipaddr
printenv netmask
printenv gatewayip
help tftp
help dhcp
```

---

## 🆘 FALLS ETWAS NICHT KLAPPT

**U-Boot hängt fest?**
→ Power cycle (Gerät ausstecken/wieder einstecken)
→ Reconnect zu UART

**Befehl nicht gefunden?**
→ Dokumentieren (diese Version hat den vielleicht nicht)
→ Weitermachen mit nächstem Befehl

**Output ist zu lang?**
→ Mit `Ctrl+U` History löschen
→ Output in mehrere Teile splitten

---

**Du packst das! Los geht's! 🚀**

Kontaktiere mich wenn du fertig bist oder Fragen hast!
