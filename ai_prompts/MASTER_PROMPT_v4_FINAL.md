# CO-PILOT MASTER PROMPT v4 (FINAL)
# HY300 Mainline Linux Kernel Validierung & Armbian-Portierung

**Autor:** Luca (srgneisner) - HY300 Hardware Testing & Validation  
**Datum:** November 9, 2025  
**Version:** 4.0 (Final - Alle Erkenntnisse integriert)  
**Status:** Ready for Claude Sonnet 4.5 via GitHub Copilot  

---

## 📋 INHALTSVERZEICHNIS

1. [Kontextbeschreibung](#kontextbeschreibung)
2. [Strategisches Gesamtziel](#strategisches-gesamtziel)
3. [Input-Struktur und Projektarchitektur](#input-struktur)
4. [Detaillierte Aufgabenstellung](#aufgabenstellung)
5. [Output-Struktur und Formate](#output-struktur)
6. [Spezielle Hinweise und Anforderungen](#spezielle-hinweise)
7. [Verwendete Modelle und Timing](#modelle-timing)

---

## <a name="kontextbeschreibung"></a>1. KONTEXTBESCHREIBUNG

### 1.1 Das Hardware-Projekt: HY300 Android Projektor

Du arbeitest mit einem **Allwinner H713 SoC basierten Android-Projektor** namens **Magcubic HY300**. Dieser Projektor war ursprünglich mit proprietärer Android-Firmware ausgeliefert worden, die umfangreiche Telemetrie und Spyware-Komponenten enthält (Baidu MobStat SDK, Magcubic-Tracking-Services, PPP/VPN-Backdoor-Infrastruktur etc.).

Das Ziel ist es, diese Geräte mit einem **sicheren, privaten, schlanken Linux-System** auszustatten, das auf Armbian basiert und alle Hardware-Funktionen korrekt nutzt.

### 1.2 Die drei Repository-Varianten

Es gibt **drei separate Repositories** in dieser Analyse:

#### 1.2.1 Original-Repository: shift/sun50iw12p1-research

**GitHub:** `https://github.com/shift/sun50iw12p1-research`

**Was:** Ein umfassendes, theoretisches Linux-Portierungsprojekt für den Allwinner H713 SoC.

**Charakteristiken:**
- ✅ Vollständig in **Phasen I bis VIII** dokumentiert (Firmware-Analyse, U-Boot-Port, Device Tree, Kernel-Module, NixOS-VM-Testing)
- ✅ Mainline-Linux-Kernel vollständig für H713 konfiguriert (`sun50i-h713-hy300.dts` mit 967 Zeilen)
- ✅ Alle kritischen Kernel-Module implementiert:
  - `sunxi-mipsloader.c`: Treiber für den MIPS-Coprozessor (Display-Pipeline & Keystone-Motor)
  - `sunxi-tvcap.c`: V4L2-Treiber für HDMI-Input (1.760 Zeilen)
- ✅ VM-Testing durchgeführt (NixOS mit Kodi, Prometheus-Metriken, Python-Services)
- ❌ **Kritische Schwäche:** Kein Zugriff auf echte Hardware während der Entwicklung. Alles ist theoretisch validiert.
- ❌ **Zielbetriebs system:** Fokussiert auf NixOS + Kodi, nicht auf Armbian.

#### 1.2.2 Variante A: Hardware-First (Explorative Forschung)

**Speicherort:** `my_contributions/variant_a_hardware_first/`

**Was:** Deine unabhängige, praktische Forschungsarbeit mit **zwei echten HY300-Geräten** mit Root-Zugang.

**Charakteristiken:**
- ✅ **Echt:** 2x funktionsfähige HY300-Projektoren, beide root-geknackt via Magisk
- ✅ **UART-Konsole:** CP2102 Adapter angelötet, 115.200 Baud stabil
- ✅ **Boot-Logs:** 3x komplette Boot-Sequenzen erfasst (BOOT0 → ATF → OP-TEE → U-Boot → Linux)
- ✅ **System-Dumps:** 418 Dateien vom laufenden System (full eMMC Backups, Kernel-Module, Kalibrierungsdaten, Register-Maps)
- ✅ **Device-Dumps:** Zwei separate Device-Dumps (Device A: Prime, Device B: Control/Factory-ROM)
- ✅ **Safety-Protokolle:** UART Bootloader Safety Protocol, Recovery Procedures, Hardware Testing Methodology - alle **auf echter Hardware getestet**
- ✅ **Privacy-Audit:** 10+ Sicherheitsbedrohungen identifiziert und dokumentiert (Baidu MobStat, com.toofifi.lineserver, PPP/VPN-Backdoor, Audio-Rekorder, Kamera-Fähigkeit etc.)
- ✅ **Dokumentation:** Vollständige Konversations-History über 1 Woche hinweg (`full_thread_FINAL.md` - 1.9 MB)
- **Format:** Organisch gewachsen, teilweise unstrukturiert (aber wertvoll)

**Wert für diese Analyse:** Das "Labor-Tagebuch". Alle praktischen, von-der-Hardware-stammenden Erkenntnisse befinden sich hier.

#### 1.2.3 Variante B: Testing-First (Strukturierte Verifizierung)

**Speicherort:** `my_contributions/variant_b_testing_first/`

**Was:** Deine Reorganisation und strukturierte Verifizierung von `shift`'s theoretischen Arbeit gegen echte Hardware.

**Charakteristiken:**
- ✅ **Ziel:** Jede Annahme von `shift` auf dem laufenden, gerooteten System überprüfen
- ✅ **AI-Context-Infrastruktur:** `ai/contexts/` mit 25+ detailliert dokumentierten Kontextdateien
  - Entwicklungs-Standards (Git, Dokumentation, Delegation)
  - Phase-spezifische Dokumentation (Phase I-IX)
  - Hardware-Testing-Protokolle, Safety-Verfahren
- ✅ **Phase I: Hardware Baseline (9/9 Tasks):** Alle vollständig mit echtem Hardware-Feedback
- ✅ **Organisierte Struktur:** Saubere Ordnerstrukturen, klare Dokumentation, standardisierte Formate
- ✅ **For-future-ready:** Aufgebaut so, dass KI-Assistenten die Struktur verstehen und fortführen können
- **Format:** Professionell strukturiert, aber möglicherweise weniger rohe experimentelle Daten

**Wert für diese Analyse:** Die "Peer-Review-Dokumentation". Hier wird systematisch gezeigt, welche von `shift`'s Annahmen richtig, teilweise richtig oder falsch sind.

### 1.3 Dein Tool-Setup

Du verwendest **GitHub Copilot** mit folgenden Modellen:
- **Claude Sonnet 4.5:** Ausgewählt (optimal für lange Kontexte und Analyse)
- Weitere verfügbar: GPT-4o, GPT-5-Codex, Gemini 2.5 Pro, etc.

**Strategie:**
- **Diese Analyse:** Claude Sonnet 4.5 (großes Kontextfenster, exzellent für lange Dokumenten-Analyse)
- **Später - Implementierung:** Potentieller Wechsel zu GPT-5-Codex oder Gemini 2.5 Pro für Code-Generierung (optional)

---

## <a name="strategisches-gesamtziel"></a>2. STRATEGISCHES GESAMTZIEL IN ZWEI PHASEN

### Phase A: Mainline-Kernel-Validierung und Boot (Unmittelbares Ziel)

**Übergeordnetes Ziel:**
Nimm die theoretische Arbeit aus `shift/sun50iw12p1-research` und ergänze sie durch deine praktischen Hardware-Validierungsergebnisse, um einen **bootfähigen Mainline-Linux-Kernel** auf echtem HY300-Hardware zum Laufen zu bringen.

**Konkrete Erfolgskriterien für Phase A:**
1. Der Kernel bootet auf echter Hardware (nicht nur in der VM)
2. Alle kritischen Komponenten werden initialisiert:
   - UART-Konsole funktioniert
   - DRAM wird korrekt erkannt
   - Device Tree wird geladen
   - Kernel-Module werden geladen (MIPS-Coprozessor, GPU, WiFi)
3. Hardware-Features sind funktionsfähig:
   - Keystone-Motor antwortet auf Befehle
   - Display zeigt Bild
   - HDMI-Eingang ist erreichbar
4. Das System ist stabil genug für weitere Entwicklung

**Kritischer Unterschied zu `shift`'s Arbeit:**
- `shift` hat alles in einer NixOS-VM validiert. Das ist eine **Simulation**, nicht die echte Hardware.
- Deine Aufgabe: Den echten Hardware-Weg nehmen und dabei die Erkenntnisse von `shift` nutzen, aber mit deinen gemessenen, echten Werten korrigieren.

### Phase B: Armbian-Portierung (Finales Ziel)

**Übergeordnetes Ziel:**
Sobald Phase A erfolgreich ist (stabiler Mainline-Kernel auf echter Hardware), nutze diesen als Fundament für einen **produktionsreifen Armbian-Build**.

**Konkrete Erfolgskriterien für Phase B:**
1. Ein bootfähiges Armbian-Image (`.img`-Datei) für HY300
2. Das Image enthält:
   - Den validierten Mainline-Kernel aus Phase A
   - Alle benötigten Kernel-Module (MIPS, GPU, WiFi, HDMI)
   - Entfernte Telemetrie und Spyware (basierend auf deiner Privacy-Audit)
   - Ein minimales User-Interface (nicht Kodi, sondern z.B. `mpv` für Medien-Streaming)
3. Erste Boot-Erfahrung ist sauber und dokumentiert
4. Grundlegende Funktionen sind getestet und dokumentiert

**Unterschied zu `shift`'s Ansatz:**
- `shift` zielt auf NixOS + Kodi (ein "Smart TV"-ähnliches System)
- Du zielst auf Armbian + minimales System (ein "Linux-basierter Projektor")
- Dein System wird von Anfang an Privacy-gehärtet sein

---

## <a name="input-struktur"></a>3. INPUT-STRUKTUR UND PROJEKTARCHITEKTUR

### 3.1 Projektverzeichnis-Anatomie

Du hast den Fork geklont und folgende Struktur erstellt:

```
hy300-integration-project/
│
├── .git/                          # Git-History vom Original-Repo
├── README.md                      # Dokumentation von shift
├── flake.nix                      # NixOS-Konfiguration von shift
│
├── firmware/                      # Von shift: Firmware-Analyse
│   ├── ROM_ANALYSIS.md
│   ├── boot0.bin
│   └── ...
│
├── docs/                          # Von shift: Dokumentation
│   ├── FACTORY_DTB_ANALYSIS.md
│   ├── HY300_HARDWARE_ENABLEMENT_STATUS.md
│   ├── DTB_ANALYSIS_COMPARISON.md
│   ├── ARM_MIPS_COMMUNICATION_PROTOCOL.md
│   ├── MIPS_HDMI_COMMAND_ANALYSIS.md
│   ├── MISSING_DRIVERS_IMPLEMENTATION_SPEC.md
│   ├── HY300_TESTING_METHODOLOGY.md
│   └── tasks/completed/
│
├── drivers/                       # Von shift: Kernel-Module
│   ├── misc/sunxi-mipsloader.c
│   └── media/platform/sunxi/sunxi-tvcap.c
│
├── nixos/                         # Von shift: NixOS VM-Testing
│   ├── flake.nix
│   ├── BUILD.md
│   └── VM-TESTING.md
│
└── my_contributions/              # DEINE BEITRÄGE
    │
    ├── variant_a_hardware_first/
    │   ├── full_thread_FINAL.md    (1.9 MB - kompletter Forschungs-Thread)
    │   ├── README.md
    │   ├── uart-logs/
    │   │   ├── boot-cycle-001.log  (kompletter Boot-Trace)
    │   │   ├── boot-cycle-002.log
    │   │   ├── boot-cycle-003.log
    │   │   └── UART_ANALYSIS.md    (Extrahierte Parameter)
    │   ├── device-dumps/
    │   │   ├── device-a/           (Primary-Gerät mit Root)
    │   │   │   ├── system-backup.img (8 GB eMMC-Dump)
    │   │   │   ├── kernel-modules.txt
    │   │   │   ├── device-tree.dtb
    │   │   │   └── calibration-data/
    │   │   │       ├── motor-parameters.txt
    │   │   │       ├── audio-calibration.txt
    │   │   │       └── display-config.txt
    │   │   └── device-b/           (Control: Factory ROM)
    │   │       └── [gleiche Struktur]
    │   ├── safety-protocols/
    │   │   ├── UART_BOOTLOADER_SAFETY_PROTOCOL.md
    │   │   ├── RECOVERY_TEMPLATE.md
    │   │   └── HARDWARE_TESTING_PROTOCOL.md
    │   └── privacy-audit/
    │       └── SPYWARE_FINDINGS.md (10+ identifizierte Threats)
    │
    └── variant_b_testing_first/
        ├── README.md
        ├── ai/contexts/            (25+ Kontextdateien)
        │   ├── 01-PROJECT-STATUS.md
        │   ├── 05-RESEARCH-INTEGRATION.md
        │   ├── hardware-testing-protocol.md
        │   ├── live-system-analysis.md
        │   └── ...
        ├── ai/sessions/
        ├── docs/standards/         (Git, Documentation, Delegation Standards)
        ├── docs/phases/            (Phase-spezifische Docs)
        └── [alle 418 organisierten Dateien]
```

### 3.2 Was ist Variante A, was ist Variante B?

**Wichtige Klarstellung:**

- **Variante A (`variant_a_hardware_first`):**
  - Das ist deine **explorative Forschungsphase**. Du hast systematisch die Hardware erforscht.
  - Enthält: Rohdaten, Logs, Konversations-Threads, teilweise ungeordnet, aber wertvoll.
  - Timeline: Über ~1 Woche entstanden.
  - Mindset: "Lass mich herausfinden, wie diese Hardware wirklich funktioniert."

- **Variante B (`variant_b_testing_first`):**
  - Das ist deine **strukturierte Verifizierungsphase**. Du hast gezielt versucht, shift's theoretische Arbeit gegen echte Hardware zu überprüfen.
  - Enthält: Organisierte Struktur, Standards, Dokumentation, AI-Context.
  - Timeline: Eine Reorganisation/Neuanfang.
  - Mindset: "Ich überprüfe systematisch, ob shift's Annahmen in der Realität stimmen."

**Der entscheidende Unterschied:**
- Variante A = "Was kann ich herausfinden?" (Forschung)
- Variante B = "Stimmt shift's Theorie?" (Verifizierung)

Beide sind wertvoll, spielen aber unterschiedliche Rollen in deiner Gesamtstrategie.

---

## <a name="aufgabenstellung"></a>4. DETAILLIERTE AUFGABENSTELLUNG

### 4.1 AUFGABE 1: Szenario-Analyse (Für Phase A - Mainline-Validierung)

**Zielsetzung dieser Aufgabe:**
Du sollst rekonstruieren und verstehen, was in Variante A (explorative Forschung) und Variante B (Verifizierung) herausgefunden wurde, und dies in eine actionable "Theorie vs. Praxis"-Matrix überführen, die zeigt, wo shift's Arbeit korrekt ist und wo sie korrigiert werden muss.

**Aufgabe 1a: Rekonstruktion von Variante A**

Lese die gesamte `full_thread_FINAL.md` (1.9 MB - der komplette Forschungs-Thread) und die `uart-logs/` Dateien.

**Gefragt:** Erstelle ein Dokument namens `01_VARIANT_A_RESEARCH_RECAP.md` (ca. 3.000-4.000 Worte), das folgende Punkte detailliert abdeckt:

1. **Explorative Phase (Was wurde entdeckt?):**
   - Welche Erkenntnisse wurden Schritt für Schritt gewonnen?
   - Welche Hardware-Komponenten wurden identifiziert? (MIPS-Coprozessor, GPU, WiFi, HDMI, Motors etc.)
   - Welche Probleme wurden gefunden und wie wurden sie analysiert?
   - Welche Kalibrierungsdaten wurden extrahiert? (Motor-Parameter, Display-Timings, Audio-Einstellungen)

2. **Boot-Sequenz-Analyse (Was bootet wie?):**
   - Detailliere die komplette Boot-Kette anhand der 3x erfassten UART-Logs:
     - BOOT0 Ausführung (Timing, Parameter)
     - ATF (ARM Trusted Firmware) Load
     - OP-TEE (Open Portable TEE) Initialisierung
     - U-Boot Start und Konfiguration (Version 2018.05-00027-ge159793)
     - Linux Kernel Load und Initialisierung
   - Welche Speicheradressen und Größen wurden gemessen?
   - Welche Device Tree Load-Adressen wurden beobachtet?

3. **Device Dumps Analyse (Was verraten die Backups?):**
   - Struktur der 418 erfassten Dateien
   - Welche Kernel-Module sind normaler Weise geladen? (Zeige die Liste)
   - Welche Treiber sind vorhanden? (GPU, WiFi, HDMI, etc.)
   - Kalibrierungsdaten: Welche Werte sind dort gelagert und warum sind sie wichtig?

4. **Privacy & Security Findings (Was ist problematisch?):**
   - Detailliere die 10+ identifizierten Sicherheitsbedrohungen:
     - Baidu MobStat SDK: Wie arbeitet es? Welche Daten sammelt es?
     - com.toofifi.lineserver: Was ist das? Wie kommuniziert es?
     - PPP/VPN-Backdoor: Welche Gefahr stellt das dar?
     - Audio/Video-Aufzeichnung: Ist das hardwareseitig unterstützt?
   - Welche Entfernung/Isolation ist technisch möglich?

5. **Kritische Erkenntnisse:**
   - Top 5 wichtigste Erkenntnisse aus dieser explorativen Phase
   - Was wissen wir jetzt über die Hardware, das `shift` nicht wusste?

**Aufgabe 1b: Rekonstruktion von Variante B**

Lese alle Dateien in `variant_b_testing_first/`, besonders die Kontextdateien in `ai/contexts/`.

**Gefragt:** Erstelle ein Dokument namens `02_VARIANT_B_VERIFICATION_RECAP.md` (ca. 2.000-3.000 Worte), das folgende Punkte abdeckt:

1. **Verifizierungs-Strategie (Wie wurde vorgegangen?):**
   - Was war die Struktur der Verifizierungs-Phase?
   - Welche 9 Hardware-Baseline-Tasks wurden durchgeführt?
   - Wie wurde gegen echte Hardware validiert?

2. **Findings pro Komponente:**
   - Für jede kritische Komponente (MIPS, GPU, WiFi, HDMI, Motors, Thermal): Was war die Theorie (shift), was ist die Realität?

3. **Abweichungen und Korrektionen:**
   - Wo stimmt shift's Arbeit und wo nicht?
   - Welche Parameter sind korrigiert worden?
   - Welche neuen Parameter wurden entdeckt?

4. **AI-Context-Infrastruktur:**
   - Welche Dokumentations-Standards wurden etabliert?
   - Wie sind die Kontexte organisiert?
   - Welche Protokolle wurden definiert?

**Aufgabe 1c: Theorie vs. Praxis Matrix**

**Gefragt:** Erstelle ein Dokument namens `03_THEORY_VS_PRACTICE_VALIDATION_MATRIX.md` (ca. 2.000-3.000 Worte) mit einer detaillierten Tabelle, die **jede relevante Annahme von shift** gegen **deine gemessenen Realwerte** abgleicht.

Struktur der Tabelle:
```
| Komponente | Theorie (shift) | Praxis (deine Messung) | Status | Abweichung | Kritikalität | Aktion erforderlich? |
|------------|-----------------|------------------------|--------|-----------|--------------|---------------------|
| U-Boot Version | 2018.05-00027-ge159793 | Gemessen: 2018.05-00027-ge159793 | ✅ Bestätigt | 0% | - | Nein |
| DRAM Größe | 2 GB | Gemessen: 2 GB | ✅ Bestätigt | 0% | - | Nein |
| DRAM Type | DDR3-1600 | Gemessen: DDR3-1600 | ✅ Bestätigt | 0% | - | Nein |
| Device Tree Load Addr | 0x... | Gemessen: 0x... | ✅ / ❌ / ⚠️ | X% | Hoch/Mittel/Niedrig | Ja/Nein |
| MIPS Coprozessor Memory | 40.3 MB @ 0x4b100000 | Gemessen: ... | ✅ / ❌ / ⚠️ | X% | Hoch | Ja/Nein |
| GPU Type | Mali-T720 | Gemessen: Mali-T720 | ✅ Bestätigt | 0% | - | Nein |
| WiFi Chipset | AIC8800 | Gemessen: AIC8800 | ✅ Bestätigt | 0% | - | Nein |
| HDMI Input | V4L2 via sunxi-tvcap | Gemessen: ... | ✅ / ❌ / ⚠️ | X% | Hoch | Ja/Nein |
| Keystone Motor | MIPS-controlled PWM | Gemessen: ... | ✅ / ❌ / ⚠️ | X% | Mittel | Ja/Nein |
| Display Panel | Resolution 720p | Gemessen: ... | ✅ / ❌ / ⚠️ | X% | Hoch | Ja/Nein |
| Boot Time | ~3-5 seconds | Gemessen: X seconds | ✅ / ❌ / ⚠️ | X% | Niedrig | Ja/Nein |
| ... | ... | ... | ... | ... | ... | ... |
```

**Für jede Zeile der Tabelle**, füge auch eine **Detailanalyse** hinzu:
- **Abweichung:** Prozentuale oder absolute Differenz
- **Kritikalität:** Wie wichtig ist diese Komponente für einen erfolgreichen Boot?
  - 🔴 **Kritisch:** Boot funktioniert nicht ohne Korrektur
  - 🟡 **Wichtig:** Funktionalität beeinträchtigt, kann aber gelöst werden
  - 🟢 **Niedrig:** Optimierungspotential, nicht blocking
- **Aktion erforderlich?** Was muss behoben, getestet oder angepasst werden?

**Aufgabe 1d: Top 5 Kritischste Abweichungen**

**Gefragt:** Erstelle ein Dokument namens `04_CRITICAL_DEVIATIONS_REPORT.md` (ca. 1.000-1.500 Worte), das die **5 kritischsten Abweichungen** identifiziert, wo Theorie (shift) und Praxis (deine Hardware) divergieren.

Für jede Abweichung:
1. **Komponente:** Was ist betroffen?
2. **Theorie:** Was dachte shift?
3. **Realität:** Was misst du?
4. **Auswirkung:** Was passiert, wenn man das ignoriert?
5. **Lösungsweg:** Wie wird das korrigiert? (Grober Plan)
6. **Priorität:** Muss das vor oder nach dem First Boot gelöst sein?

---

### 4.2 AUFGABE 2: Integrationsplan für Mainline-Kernel (Für Phase A)

**Zielsetzung:**
Basierend auf den Erkenntnissen aus Aufgabe 1, erstelle einen technischen Plan, um `shift`'s Repository mit deinen Korrektionen zu patchen und den Kernel bootfähig zu machen.

**Aufgabe 2a: Hardware Abstraction Layer (HAL) Inventar**

**Gefragt:** Erstelle ein Dokument namens `05_HARDWARE_ABSTRACTION_ASSETS.md` (ca. 2.000 Worte), das alle wiederverwendbaren, **OS-unabhängigen** Komponenten aus shift's Arbeit katalogisiert.

Struktur:

```markdown
## 1. Bootloader-Komponenten (U-Boot)

### 1.1 U-Boot Binary
- **Datei:** `u-boot-sunxi-with-spl.bin` (732 KB)
- **Was:** Kompletter U-Boot mit SPL
- **Von shift:** Ja, vollständig getestet in VM
- **Hardware-Validierung:** Deine Messung zeigt... [aus UART-Logs]
- **Aktion:** [Muss angepasst werden / Kann so verwendet werden / Braucht Patch]
- **Details:** ...

### 1.2 DRAM Konfiguration
- **Extrahiert aus:** `boot0.bin`
- **Wert:** DDR3-1600, ... [weitere Parameter]
- **Von shift:** Dokumentiert in ROM_ANALYSIS.md
- **Hardware-Validierung:** Deine UART-Logs zeigen... [was du gemessen hast]
- **Match?:** Ja / Nein / Teilweise
- **Aktion:** ...

## 2. Kernel-Komponenten

### 2.1 Device Tree (.dts)
- **Datei:** `sun50i-h713-hy300.dts` (967 Zeilen, 14 KB DTB)
- **Abdeckung:** [Aufzählung aller Komponenten, die im DTS definiert sind]
- **Hardware-Validierung:** 
  - Theorie: DTS definiert X und Y
  - Praxis: Deine UART-Logs zeigen Z
  - Match-Grad: [Prozentsatz]
- **Erforderliche Patches:** [Liste]
- **Detailanalyse:** ...

### 2.2 Kernel-Module
- **Modul 1: sunxi-mipsloader.c**
  - **Zweck:** Treiber für MIPS-Coprozessor (Display/Keystone)
  - **Größe:** 905 Zeilen
  - **Kompilierung:** Getestet in VM
  - **Hardware-Test:** [Deine Findings]
  - **Kann direkt verwendet werden?:** Ja / Braucht Patches
  - **Details:** ...

- **Modul 2: sunxi-tvcap.c**
  - **Zweck:** V4L2-Treiber für HDMI-Input
  - **Größe:** 1.760 Zeilen
  - **Hardware-Test:** [Deine Findings]
  - **Details:** ...

## 3. Calibration & Configuration Data
- **Quelle:** Deine device-dumps/calibration-data/
- **Komponente 1:** Motor-Parameter
- **Komponente 2:** Audio-Kalibrierung
- **Komponente 3:** Display-Config
- **Wie werden diese in Mainline genutzt?:** ...

## 4. Privacy & Security Baseline
- **Aus:** Deine privacy-audit/ findings
- **Zu entfernende Komponenten:** [Liste aus Android-Factory-ROM]
- **Firewall-Regeln:** [Block-Domains, etc.]
- **Kernel-Level Isolationen:** ...
```

**Aufgabe 2b: Roadmap to First Boot**

**Gefragt:** Erstelle ein Dokument namens `06_ROADMAP_TO_FIRST_BOOT.md` (ca. 3.000-4.000 Worte), das einen schritt-für-schritt Aktionsplan mit **exakten Befehlen** und Verifikationspunkten aufzeigt.

Struktur:

```markdown
# Roadmap to First Boot: Mainline Kernel auf HY300

## Voraussetzungen
- 2x bootfähige HY300-Geräte mit Root-Zugang
- UART-Verbindung etabliert
- FEL-Mode zugänglich
- Device B als Fallback-Control vorhanden

## Phase 1: Vorbereitung (Tag 1)

### 1.1 Workspace Setup
**Ziel:** Eine saubere, isolierte Build-Umgebung
**Befehle:**
```bash
# Klone shift's Repo in isoliertes Verzeichnis
git clone https://github.com/shift/sun50iw12p1-research.git hy300-mainline-port
cd hy300-mainline-port
git checkout -b hardware-validated-mainline

# Installiere Dependencies [detaillierte Liste für Ubuntu/Debian]
sudo apt update
sudo apt install -y [alle Dependencies]

# Verifiziere Toolchain
aarch64-linux-gnu-gcc --version
```

**Verifikations-Checkpoint 1.1:**
- [ ] Repo ist geclont
- [ ] Branch existiert
- [ ] Toolchain funktioniert

### 1.2 Patch Generation (Basierend auf deinen Erkenntnissen)
**Ziel:** Erstelle `.patch`-Dateien für alle Korrektionen

Für jede kritische Abweichung aus Aufgabe 1d:
```
**Abweichung X:** [Was ist falsch in shift's Code]
- **File:** [Welche Datei]
- **Zeile:** [Welche Zeile(n)]
- **Alter Code:**
```c
[Zeige den Alt-Code]
```
- **Neuer Code (basierend auf deinen UART-Messungen):**
```c
[Zeige den Neu-Code mit Werten aus deinen Logs]
```
- **Patch-Befehl:**
```bash
git apply < patch_deviation_X.patch
```
```

... [weitere Deviations]

## Phase 2: U-Boot Kompilierung (Tag 2)

### 2.1 U-Boot Build
**Ziel:** U-Boot mit deinen Korrektionen kompilieren

**Befehle:**
```bash
cd u-boot  # Falls separates Repo
# Oder nutze shift's integrierte U-Boot-Config

# Konfiguriere für H713 mit Deviations-Patches
make sun50i_h713_config
make -j$(nproc)  # Multithreaded build
```

**Verifikations-Checkpoint 2.1:**
- [ ] Build erfolgreich ohne Fehler
- [ ] Binaries vorhanden: `u-boot.bin`, `spl/u-boot-spl.bin`

### 2.2 U-Boot Testing (FEL-Modus)
**Ziel:** Validate U-Boot ohne etwas zu zerstören

**Befehle:**
```bash
# Stelle sicher Device B (Control) wird nicht modifiziert!
# Nutze Device A (Primary)

# U-Boot via UART/FEL booten (SRAM - völlig sicher!)
sunxi-fel spl spl/u-boot-spl.bin
sunxi-fel write 0x4a000000 u-boot.bin
sunxi-fel exe 0x4a000000

# Über UART monitoren
picocom -b 115200 /dev/ttyUSB0
# Du solltest den U-Boot-Prompt sehen: `=>`
```

**Verifikations-Checkpoint 2.2:**
- [ ] U-Boot lädt ohne Fehler
- [ ] U-Boot-Prompt ist verfügbar via UART
- [ ] `printenv` zeigt korrekte Umgebungsvariablen [mit Deviations angepasst]

## Phase 3: Kernel Kompilierung (Tag 3)

### 3.1 Device Tree Compilation
**Ziel:** DTB mit deinen Patches kompilieren

**Befehle:**
```bash
# Patch Device Tree mit Corrections
cd arch/arm64/boot/dts/
# Wende patches an für jede Deviation
git apply < ../../.. /patches/dts_deviation_Y.patch

# Kompiliere DTB
make dtbs
```

**Verifikations-Checkpoint 3.1:**
- [ ] DTB kompiliert ohne Fehler
- [ ] DTB-Größe: [soll sein ca. X KB, du misst Y KB]

### 3.2 Kernel Compilation
**Ziel:** Mainline-Kernel mit allen Patches kompilieren

**Befehle:**
```bash
# Wende alle Patches an
for patch in patches/kernel_*.patch; do
  git apply < $patch
done

# Kernel-Konfiguration
make menuconfig  # Oder nutze .config von shift
# Stelle sicher folgende sind enabled:
# - CONFIG_MIPS_LOADER=y
# - CONFIG_TVCAP=m (für HDMI)
# - CONFIG_GPU_PANFROST=m
# - etc.

# Kompiliere
make -j$(nproc) ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-

# Kompiliere Module
make modules_install INSTALL_MOD_PATH=./modules ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
```

**Verifikations-Checkpoint 3.2:**
- [ ] Kernel kompiliert ohne Fehler
- [ ] Kernel-Image vorhanden: `arch/arm64/boot/Image`
- [ ] DTB vorhanden: `arch/arm64/boot/dts/sun50i-h713-hy300.dtb`
- [ ] Module vorhanden in `./modules/lib/modules/`

## Phase 4: Boot Preparation (Tag 3 Abend)

### 4.1 Filesystem Preparation
**Ziel:** Ein minimales Root-Filesystem für den First Boot

**Befehle:**
```bash
# Nutze eine minimal Alpine Linux oder Debian rootfs
wget https://[...]/alpine-minirootfs-arm64.tar.gz

# Extrahiere in tmpfs (um schnell zu starten)
mkdir rootfs
cd rootfs
tar xf ../alpine-minirootfs-arm64.tar.gz

# Kopiere Module
cp -r ../modules/lib/modules/* lib/modules/

# Kopiere kritische Treiber-Test-Skripte
cat > init_test.sh << 'EOF'
#!/bin/sh
# Test: Laden aller Module
lsmod
# Test: UART Verfügbarkeit
cat /proc/tty/drivers
# Test: MIPS-Loader Check
cat /sys/class/panelparam/ 2>/dev/null || echo "MIPS nicht geladen"
# Test: GPU Check
grep mali /proc/devices
# Test: HDMI-Input Check
v4l2-ctl --list-devices 2>/dev/null || echo "V4L2 tools nicht vorhanden"
EOF
chmod +x init_test.sh
```

**Verifikations-Checkpoint 4.1:**
- [ ] Rootfs mit Kernel-Modulen vorbereitet
- [ ] Test-Skripte vorhanden

### 4.2 Create SD Card Image
**Ziel:** Ein flashbares `.img` für Device A

**Befehle:**
```bash
# Erstelle partitioniertes Image
# Layout:
# - Boot-Partition: 128 MB (vfat, enthält U-Boot + DTB + Kernel)
# - Root-Partition: Rest (ext4)

# Detaillierte Befehle für dd, fdisk, mkfs, mount, etc.
# [... Details ...]
```

**Verifikations-Checkpoint 4.2:**
- [ ] Image-Datei erstellt: `hy300-mainline-test.img`
- [ ] Größe ist korrekt
- [ ] Partitionen sind vorhanden und korrekt formatiert

## Phase 5: First Boot Test (Tag 4)

### 5.1 Flash Image auf Device A
**Ziel:** Image auf Device A schreiben (VORSICHT!)

**Befehle:**
```bash
# WICHTIG: Überprüfe Device B ist NICHT verbunden!
# WICHTIG: Stelle sicher du schreibst auf die richtige SD-Karte!

# Identifiziere SD-Karte
lsblk

# Schreibe Image
sudo dd if=hy300-mainline-test.img of=/dev/sdX bs=4M status=progress conv=fsync
sync

# Eject
sudo eject /dev/sdX
```

**Verifikations-Checkpoint 5.1:**
- [ ] DD-Befehl erfolgreich ausgeführt (status=progress zeigte 100%)
- [ ] SD-Karte ist eject worden

### 5.2 Boot Device A mit neuem Image
**Ziel:** Testen ob der Mainline-Kernel bootet

**Befehle:**
```bash
# Lege SD-Karte in Device A ein
# Verbinde UART
picocom -b 115200 /dev/ttyUSB0

# Power-on Device A
# Beobachte Boot-Sequenz in UART
# Erwartete Output (Zeile für Zeile):
# [BOOT0] ...
# [ATF] ...
# [OP-TEE] ...
# U-Boot ...
# Loading device tree from ...
# Starting kernel ...
# [Linux boot messages]
# [Init scripts laufen]
```

**Verifikations-Checkpoint 5.2:**
- [ ] Kernel bootet
- [ ] UART zeigt Linux Kernel Messages
- [ ] Init-Prozess startet
- [ ] Login-Prompt erscheint (oder Hang ist identifizierbar)

### 5.3 Diagnostics Execution
**Ziel:** System-Health überprüfen

**Befehle:**
```bash
# Nach erfolgreichem Boot - über UART oder SSH:
lsmod  # Sind alle Module geladen?
dmesg | tail -50  # Fehler in Kernel-Logs?
cat /proc/cpuinfo  # CPU wird erkannt?
free -h  # Speicher wird erkannt?
# ... weitere Tests
```

**Verifikations-Checkpoints 5.3:**
- [ ] Linux lädt alle Kernel-Module ohne Fehler
- [ ] dmesg zeigt keine kritischen Fehler
- [ ] Hardware wird korrekt erkannt

## Troubleshooting-Guide

[Für jedes mögliche Fehlerszenario: Ursache, Lösungsweg, nächster Schritt]
```

---

### 4.3 AUFGABE 3: Armbian-Portierungsstrategie (Für Phase B)

**Zielsetzung:**
Sobald Phase A erfolgreich ist (Mainline-Kernel bootet), erstelle einen vollständigen Plan zur Portierung auf Armbian als finales Betriebssystem.

**Aufgabe 3a: Armbian Board-Konfiguration**

**Gefragt:** Erstelle ein Dokument namens `07_ARMBIAN_BOARD_CONFIGURATION.md` (ca. 2.000 Worte), das zeigt, wie man ein Armbian für HY300 baut.

**Outline:**
- Armbian-Basis wählen (Jammy vs. Bookworm, Kernel-Branch)
- Neue Board-Konfiguration erstellen: `userpatches/config/boards/hy300.conf`
- U-Boot-Patchin für Armbian's Build-System
- Kernel-Patches integrieren
- Device Tree Integration
- Externe Module (DKMS) aufsetzen

**Aufgabe 3b: Privacy-Gehärtetes Image**

**Gefragt:** Erstelle ein Dokument namens `08_PRIVACY_HARDENED_IMAGE_BUILD.md` (ca. 1.500 Worte), das zeigt, wie man das Armbian-Image mit deinem Privacy-Audit "gehärtet" werden kann:
- Welche Android-Komponenten muss man in Armbian entfernen (nicht vorhanden)?
- Welche Netzwerk-Isolationen sind nötig?
- Wie wird `debloat.sh` Post-Build angewendet?
- Firewall-Regeln für Tracking-Domains

**Aufgabe 3c: First Boot Guide für Armbian**

**Gefragt:** Erstelle ein Dokument namens `09_ARMBIAN_FIRST_BOOT_GUIDE.md` (ca. 1.500 Worte):
- Wie flasht man das fertige Image?
- Erste Anmeldung und Basis-Konfiguration
- Hardware-Validierung (Keystone, Display, WLAN)
- Mediacenter-Setup (mpv statt Kodi)

---

## <a name="output-struktur"></a>5. OUTPUT-STRUKTUR UND FORMATE

### 5.1 Finale Output-Dateien

Der Co-Pilot sollte folgende Dokumente liefern (alle als Markdown `.md`):

```
CO_PILOT_COMPLETE_ANALYSIS_OUTPUT/
│
├── 00_EXECUTIVE_SUMMARY.md (1 Seite)
│   ├─ Überblick über beide Phasen
│   ├─ Top 3 kritische Erkenntnisse
│   ├─ Empfohlene nächste Schritte
│   └─ Zeitschätzung für Implementation
│
├── PHASE_A_MAINLINE_VALIDATION/
│   ├── 01_VARIANT_A_RESEARCH_RECAP.md (3.000-4.000 Worte)
│   ├── 02_VARIANT_B_VERIFICATION_RECAP.md (2.000-3.000 Worte)
│   ├── 03_THEORY_VS_PRACTICE_VALIDATION_MATRIX.md (2.000-3.000 Worte)
│   ├── 04_CRITICAL_DEVIATIONS_REPORT.md (1.000-1.500 Worte)
│   ├── 05_HARDWARE_ABSTRACTION_ASSETS.md (2.000 Worte)
│   ├── 06_ROADMAP_TO_FIRST_BOOT.md (3.000-4.000 Worte)
│   └── 07_DETAILED_PATCH_SPECIFICATIONS.md (2.000 Worte)
│
├── PHASE_B_ARMBIAN_PORTING/
│   ├── 07_ARMBIAN_BOARD_CONFIGURATION.md (2.000 Worte)
│   ├── 08_PRIVACY_HARDENED_IMAGE_BUILD.md (1.500 Worte)
│   ├── 09_ARMBIAN_FIRST_BOOT_GUIDE.md (1.500 Worte)
│   └── 10_ARMBIAN_POST_BOOT_HARDENING.md (1.000 Worte)
│
└── APPENDIX/
    ├── A_GLOSSARY.md (Begriffe erklärt)
    ├── B_TROUBLESHOOTING_GUIDE.md (Probleme & Lösungen)
    ├── C_REFERENCE_COMMANDS.md (Alle verwendeten Befehle)
    └── D_FILE_STRUCTURE_MAPPING.md (Wo kommen die Dateien her, wohin gehen sie)
```

### 5.2 Output-Format-Spezifikationen

**Alle Markdown-Dateien müssen folgen:**

1. **Überschriften:** Hierarchisch korrekt (# → ## → ### → ####, nie überspringen)
2. **Code-Blöcke:** Mit Syntax-Highlighting (```bash, ```c, etc.)
3. **Tabellen:** Für Vergleiche und Matrizen
4. **Listen:** Ungeordnet (für "Was sind die Komponenten") oder geordnet (für "Schritte")
5. **Links:** Internal `[Abschnitt 3.1](#abschnitt-31)` und external `[Shift Repo](https://github.com/shift/sun50iw12p1-research)`
6. **Inline Code:** `$variable` oder `command --option`
7. **Kursiv für Emphasis:** *wichtig* oder _kritisch_
8. **Fett für Highlights:** **ACHTUNG** oder **KOMPLETT NEU**

---

## <a name="spezielle-hinweise"></a>6. SPEZIELLE HINWEISE UND ANFORDERUNGEN

### 6.1 Absolute Anforderungen

1. **Sei konkret und spezifisch:**
   - NICHT: "Passe U-Boot an"
   - JA: "Ändere `arch/arm/lib/asm/dram.c` Zeile 42 von `0x...` zu `0x...` (basierend auf UART-Messung)"

2. **Alle Befehle müssen funktionieren:**
   - Sie sollten copy-paste-ready sein
   - Sie sollten nicht davon ausgehen, dass bestimmte Tools vorhanden sind
   - Sie sollten klar machen, wenn sudo benötigt wird

3. **Verdopplungen vermeiden:**
   - Wenn `06_ROADMAP_TO_FIRST_BOOT.md` einen Befehl enthält, dann nicht nochmal in `07_PATCH_SPECIFICATIONS.md`
   - Nutze Cross-References stattdessen: "[Siehe Schritt 2.1 in Roadmap](#21-u-boot-build)"

4. **Evidenzbasiert:**
   - Behauptungen sollten auf deinen UART-Logs, Device-Dumps oder shift's Dokumentation basieren
   - "Laut UART-Log boot-cycle-001.log, Zeile 234..." ist gut
   - "Vermutlich..." ist nicht gut

5. **Realitäts-Checks einbauen:**
   - Nach jedem kritischen Schritt: "Verifikations-Checkpoint"
   - Checkpoints sollten konkrete, testbare Kriterien haben (Datei vorhanden? Befehl erfolgreich? Output enthält X?)

### 6.2 Kontextuelle Nuancen

- **Variante A ist "Forschung":** Sie ist ungeordnet, aber wertvoll. Du extrahierst die Insights.
- **Variante B ist "Struktur":** Sie ist organisiert, aber möglicherweise zu formell für Raw-Findings.
- **Deine Aufgabe:** Das beste aus beiden kombinieren.

- **shift arbeitet theoretisch:** Er hatte keine echte Hardware. Das ist nicht schlecht, aber es bedeutet, dass seine Arbeit überprüft/validiert werden muss.
- **Deine Arbeit ist praktisch:** Du hast die Hardware. Das ist wertvoll, kann aber chaotisch sein.
- **Diese Analyse:** Bringt beide zusammen.

### 6.3 Häufige Fallen

- ❌ NICHT: "Update shift's Repo" - Du darfst shift's Repo NICHT verändern, du analysierst nur
- ✅ JA: "Diese Patches müssten auf shift's Code angewendet werden"

- ❌ NICHT: Zu viel Theorie - "Theoretisch könnte..."
- ✅ JA: "Deine UART-Logs zeigen konkret X, daher musst du Y machen"

- ❌ NICHT: Zu viel Detail in Phase A, wenn Phase B auch wichtig ist
- ✅ JA: Priorisiere. Phase A (First Boot) ist wichtiger als Armbian-Optimierungen

---

## <a name="modelle-timing"></a>7. VERWENDETE MODELLE UND TIMING

### 7.1 Modell-Empfehlung nach Aufgabe

**Diese Analyse (Aufgabe 1):**
- **Empfohlenes Modell:** Claude Sonnet 4.5
- **Begründung:** Große Kontextfenster (100K+ Tokens), exzellent für lange Dokumente-Analyse (deine 1.9MB full_thread_FINAL.md), logical reasoning über komplexe Szenarien
- **Timing:** Ca. 30-45 Minuten für komplette Analyse

**Roadmap & Befehle (Aufgabe 2):**
- **Modell 1 (Prioär):** Claude Sonnet 4.5 (für konsistente Struktur)
- **Modell 2 (Alternative):** GPT-5-Codex oder Gemini 2.5 Pro (stärker in Code-Generierung)
- **Timing:** Ca. 20-30 Minuten

**Armbian-Strategie (Aufgabe 3):**
- **Modell:** Claude Sonnet 4.5 oder Gemini 2.5 Pro
- **Begründung:** Muss bekanntes Armbian-Build-System verstehen
- **Timing:** Ca. 20-30 Minuten

**Gesamtdauer:** ~1,5-2 Stunden für komplette Analyse + Planung

### 7.2 Wie man den Prompt verwendet

1. **Kopiere diesen Master-Prompt komplett in GitHub Copilot**
2. **Wechsle zum Modell "Claude Sonnet 4.5"**
3. **Gib deinen Projektordner (`hy300-integration-project/`) als Kontext an** (wenn Copilot Datei-Upload unterstützt)
4. **Starte mit:** "Hier ist der Master-Prompt. Führe bitte AUFGABE 1 durch. Beginne mit Aufgabe 1a."
5. **Warte auf Output**, speichere als Markdown-Datei
6. **Dann:** "Jetzt Aufgabe 1b" etc.

### 7.3 Iterations-Schleife (Falls Output ungenau ist)

Falls der Co-Pilot etwas verpasst oder zu oberflächlich behandelt:

1. Gib konkrete Feedback: "Du hast die UART-Logs aus boot-cycle-002.log nicht analysiert. Kannst du nochmal hinschauen?"
2. Der Co-Pilot kann iterativ verfeinern
3. Nutze "Follow-ups" statt neuer Prompts

---

**ENDE DES MASTER-PROMPTS**

---

## Anwendungshinweise

**Speichere diese Datei als:** `ai_prompts/00_MASTER_PROMPT_v4.md`

**Git-Integration:**
```bash
cd hy300-integration-project
mkdir -p ai_prompts
cp 00_MASTER_PROMPT_v4.md ai_prompts/
git add ai_prompts/
git commit -m "docs: Add complete Master Prompt v4 for Co-Pilot analysis"
git push origin hardware-validated-mainline
```

**Nächster Schritt:** Siehe `HOW_TO_USE_CO_PILOT_v4_DETAILED.md` für konkrete Implementierungsschritte.
