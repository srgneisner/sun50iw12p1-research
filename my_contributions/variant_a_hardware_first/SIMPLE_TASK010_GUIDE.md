# 🚀 TASK 010 - EINFACHE ANLEITUNG

**Dein Plan:** 
1. ✅ Starte `script` Session
2. ✅ Führe 6 STEPS aus TASK010_CHECKLIST.md in U-Boot aus
3. ✅ Log wird in `TASK010_CHECKLIST.log` gespeichert
4. ✅ Danach: Gib Bescheid und wir parsen alles

---

## SCHRITT 1: Neue Script-Session starten

```bash
# In deinem Terminal (NICHT U-Boot):
cd /home/luca/Desktop/hy300-linux-porting/phases/phase2-uart-access
script TASK010_CHECKLIST.log
screen /dev/ttyACM0 115200
```

---

## SCHRITT 2: Die 6 STEPS in U-Boot ausführen

**Kopier-Paste diese Befehle in deine U-Boot Konsole:**

### STEP 1: printenv (5 min)
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

### STEP 2: help (3 min)
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

### STEP 3: Board Info (3 min)
```
=> version
=> bdinfo
=> mmc list
=> mmc dev 2
=> mmc info
=> mmc part
```

### STEP 4: Memory Dumps (2 min)
```
=> md.l 0x00020000 0x10
=> md.l 0x00044000 0x10
=> md.l 0x40000000 0x20
=> md.l 0x4a000000 0x20
=> md.l 0x77e8de70 0x20
=> md.l 0x4a0003e8 0x10
```

### STEP 5: Boot Script (3 min)
```
=> mmc dev 2
=> fatls mmc 2:0
=> ext4ls mmc 2:0 /boot
=> ext4load mmc 2:0 0x43000000 /boot/boot.scr
=> md.l 0x43000000 0x100
=> printenv bootcmd
```

### STEP 6: Netzwerk (2 min)
```
=> printenv serverip
=> printenv ipaddr
=> printenv netmask
=> printenv gatewayip
=> help tftp
=> help dhcp
```

---

## SCHRITT 3: Session beenden

Wenn alle STEPS fertig:

```bash
# In deinem Terminal:
exit
```

Das beendet die `script`-Session und speichert alles in `TASK010_CHECKLIST.log`

---

## FERTIG!

**Die Log-Datei wird hier gespeichert:**
```
/home/luca/Desktop/hy300-linux-porting/phases/phase2-uart-access/TASK010_CHECKLIST.log
```

**Dann:** Gib mir Bescheid und wir parsen alles mit:
```bash
bash parse_uboot_output.sh TASK010_CHECKLIST.log
```

---

**Viel Erfolg! 🚀**
