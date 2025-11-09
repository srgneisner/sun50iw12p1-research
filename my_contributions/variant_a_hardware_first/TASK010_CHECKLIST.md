# 🚀 TASK 010 START - DEINE BEFEHLS-CHECKLISTE

**Dein Status:** Du bist IN U-BOOT ✅  
**Zeit:** ~25-30 Minuten für alle 6 Steps  
**Risiko:** 🟢 ZERO - Alles ist read-only!

---

## CHECKLIST: KOPIER-PASTE DIESE BEFEHLE

### ✅ STEP 1: printenv Befehle (5 min)

In deine U-Boot Konsole tippen:

```
=> printenv
=> printenv bootcmd
=> printenv bootargs
=> printenv bootdelay
=> printenv ethaddr
=> printenv mac_addr
=> printenv serverip
=> printenv ipaddr
=> printenv netmask
```

📁 **Speichern:** `backup/uboot_environment.txt`

---

### ✅ STEP 2: help Befehle (3 min)

In deine U-Boot Konsole tippen:

```
=> help
=> help mmc
=> help fatload
=> help ext4load
=> help bootm
=> help go
=> help md
=> help mw
```

📁 **Speichern:** `hardware-access/uboot-commands-reference.md`

---

### ✅ STEP 3: Board Info (3 min)

In deine U-Boot Konsole tippen:

```
=> version
=> bdinfo
=> mmc list
=> mmc dev 2
=> mmc info
=> mmc part
```

📁 **Speichern:** `backup/uboot_board_info.txt`

---

### ✅ STEP 4: Memory Dumps (2 min)

In deine U-Boot Konsole tippen:

```
=> md.l 0x00020000 0x10
=> md.l 0x00044000 0x10
=> md.l 0x40000000 0x20
=> md.l 0x4a000000 0x20
=> md.l 0x77e8de70 0x20
=> md.l 0x4a0003e8 0x10
```

📁 **Speichern:** `phases/phase2-uart-access/memory-map-uboot.md`

---

### ✅ STEP 5: Boot Script (3 min)

In deine U-Boot Konsole tippen:

```
=> mmc dev 2
=> fatls mmc 2:0
=> ext4ls mmc 2:0 /boot
=> ext4load mmc 2:0 0x43000000 /boot/boot.scr
=> md.l 0x43000000 0x100
=> printenv bootcmd
```

📁 **Speichern:** `phases/phase2-uart-access/boot-script-analysis.md`

---

### ✅ STEP 6: Netzwerk (2 min)

In deine U-Boot Konsole tippen:

```
=> printenv serverip
=> printenv ipaddr
=> printenv netmask
=> printenv gatewayip
=> help tftp
=> help dhcp
```

📁 **Speichern:** `hardware-access/uboot-network-boot.md`

---

## 💾 WIE DU SPEICHERST

### Methode A: Mit `script` (EMPFOHLEN)

```bash
# In normalem Terminal (NICHT U-Boot):
script /tmp/uboot_task010.log
screen /dev/ttyACM0 115200

# Jetzt alle Befehle in U-Boot eingeben
# Am Ende: Ctrl+D drücken

# Fertig! Alles ist in /tmp/uboot_task010.log
```

### Methode B: Manuell

```bash
# Nach jedem Befehl:
# 1. Output mit Maus markieren
# 2. Ctrl+Shift+C kopieren
# 3. In Datei einfügen
```

---

## 📊 OUTPUT-DATEIEN NACH FERTIG

Diese Dateien sollten dann gefüllt sein:

```
✓ backup/uboot_environment.txt
✓ backup/uboot_board_info.txt
✓ hardware-access/uboot-commands-reference.md
✓ hardware-access/uboot-network-boot.md
✓ phases/phase2-uart-access/memory-map-uboot.md
✓ phases/phase2-uart-access/boot-script-analysis.md
```

---

## 🎯 NÄCHSTER MOVE

### JETZT SOFORT:

1. ✅ Gehe zurück zu deinem U-Boot Terminal (screen)
2. ✅ Starte mit STEP 1 - tippe erste `printenv`
3. ✅ Kopiere Output in `backup/uboot_environment.txt`
4. ✅ Mache die anderen Befehle von STEP 1
5. ✅ Dann STEP 2, 3, 4, 5, 6
6. ✅ Fertig in ~30 Minuten!

---

## 🆘 FALLS ETWAS SCHIEF GEHT

| Problem | Lösung |
|---------|--------|
| U-Boot antwortet nicht | Power cycle, reconnect zu UART |
| Befehl unknown | OK - dokumentieren, nächster Befehl |
| Output zu lang | Mit Ctrl+U löschen, in Teile teilen |
| Screen hängt fest | Ctrl+A dann D um auszusteigen |

---

## ✨ DANACH

Nach Task 010:

```bash
# Dateien überprüfen:
ls -lh backup/uboot_*.txt
ls -lh hardware-access/uboot*.md
ls -lh phases/phase2-uart-access/*analysis.md

# Task als complete markieren:
cd /home/luca/Desktop/hy300-linux-porting
ai/tools/task-manager complete 010

# Git commit:
git add -A
git commit -m "Task 010: U-Boot environment fully extracted"
```

---

**VIEL ERFOLG! Du schaffst das! 🚀**
