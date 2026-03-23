> *This project is in German because it is specifically designed for the German keyboard layout and primarily targets German-speaking users.*

---

![DeutschlandPlus](https://github.com/user-attachments/assets/d099144d-bb52-43f0-a631-8ba978e43764)

# DeutschlandPlus – Das QWERTZ-Upgrade

**Bequem tippen ohne AltGr-Verrenkungen. Schnelle Navigation aus der Grundstellung. Kostenlos, kompatibel, sofort nutzbar.**

DeutschlandPlus ist eine Erweiterung für das deutsche Standardlayout – und bleibt dabei zu 100 % damit kompatibel. Wer programmiert, LaTeX schreibt oder einfach nur das `@`-Zeichen bequem eingeben will, profitiert sofort.

---

## Das Problem

Im deutschen Tastaturlayout sind wichtige Zeichen wie `[ ] { } \ @` nur über **AltGr** erreichbar – eine Taste, die für Tastschreiber schlecht sitzt und oft beide Hände bindet. Viele weichen deshalb auf das englische Layout aus, verlieren dabei aber die Umlaute und können den Rechner schlecht mit anderen teilen.

## Die Lösung

DeutschlandPlus macht die **CapsLock-Taste** zur zusätzlichen Modifier-Taste. Damit sind alle wichtigen Sonderzeichen und die Navigation bequem aus der Grundstellung erreichbar – ohne dass sich an der deutschen Standardbelegung irgendetwas ändert.

### Sonderzeichen

| Tastenkombination | Zeichen | Merkhilfe |
|---|---|---|
| `CapsLock + 7` | `{` | |
| `CapsLock + 8` | `[` | |
| `CapsLock + 9` | `]` | |
| `CapsLock + 0` | `}` | |
| `CapsLock + -` | `\` | |
| `CapsLock + 5` | `€` | |
| `CapsLock + Ä` | `@` | „ät" |
| `CapsLock + <` | `\|` | auch auf US-Tastaturen |

### Navigation aus der Grundstellung

| Tastenkombination | Funktion |
|---|---|
| `CapsLock + H / J / K / L` | ← ↓ ↑ → (wie Vim) |
| `CapsLock + Y / O` | Pos1 / Ende |
| `CapsLock + U / I` | Bild↑ / Bild↓ |
| `CapsLock + Ö` | Backspace |
| `CapsLock + Ü` | Entfernen (Del) |
| `CapsLock + Enter` | Alt+Tab (Programmwechsel) |
| `CapsLock + Leertaste` | ESC |

Zusätzlich gibt es **Textkürzel (Hotstrings)** für weitere Sonderzeichen, z. B. `=>` → `⇒` oder `alpha#` → `α`.

---

## Installation (Windows)

**Option A – Ausführbare Datei (empfohlen)**

1. `.exe`-Datei und `DeutschlandPlus-Hilfe.html` herunterladen
2. Beide Dateien in einen Ordner deiner Wahl kopieren
3. `.exe` starten – fertig. Keine Installation nötig, läuft auch vom USB-Stick ohne Admin-Rechte.

**Option B – AutoHotkey-Skript (für Anpassungen)**

1. [AutoHotkey](https://www.autohotkey.com/) installieren
2. Das `.ahk`-Skript herunterladen und bei Bedarf anpassen
3. Verknüpfung zum Skript im Autostart-Ordner ablegen

Das Skript ist gut dokumentiert und lässt sich leicht um eigene Hotstrings und Tastenkombinationen erweitern.

> **Hinweis:** Das Konzept lässt sich auch unter Linux und macOS umsetzen – die vorliegenden Dateien sind jedoch für Windows entwickelt.

---

## Hilfe

`CapsLock + F1` öffnet eine Übersicht aller verfügbaren Zeichen und Funktionen.

Eine ausführliche Beschreibung mit Screenshots, Lernreihenfolge und bekannten Limitationen findet sich im Begleitartikel:  
👉 [DeutschlandPlus – Das QWERTZ-Upgrade](https://rpnfan.github.io/keyboard-heaven/after-party/deutschlandplus/)

---

## Hintergrund & Weiterentwicklung

DeutschlandPlus hat sich seit 2008 in der täglichen Nutzung bewährt. Wer noch weiter gehen und tiefer in optimierte Tastaturlayouts einsteigen will, findet in [Spacemak](https://github.com/rpnfan/Spacemak) und [Anymak](https://github.com/rpnfan/Anymak) die nächsten Schritte.
