# Detaillierte Erklärung der „Global Network Traffic Rules“ (Globale Netzwerkverkehrsregeln)** in **Veeam Backup & Replication**, inklusive praktischer **Beispiele**

## 🔹 Was sind „Global Network Traffic Rules“ bei Veeam?

Die **Global Network Traffic Rules** (Globale Netzwerkverkehrsregeln) in Veeam Backup & Replication ermöglichen es dir, **Verkehrsrichtlinien** zwischen den Komponenten der Veeam-Infrastruktur zu konfigurieren. Ziel ist es, die **Netzwerknutzung zu steuern**, insbesondere bei langsamen Verbindungen (z. B. zwischen Rechenzentren, Büros oder WAN-Strecken).

---

## 🔸 Warum sind sie wichtig?

* Reduzierung der Bandbreite bei langsamen Verbindungen (WAN).
* Vermeidung von Netzwerküberlastungen.
* Durchsetzung von Komprimierung oder Verschlüsselung beim Datentransfer.
* Optimierung der Backup-Performance.

---

## 🔹 Wo konfiguriert man diese Regeln?

1. Öffne **Veeam Backup & Replication Console**.
2. Gehe zu **[Main Menu] > [Network Traffic Rules]**.
3. Dort kannst du **globale Regeln** hinzufügen, die **für alle Jobs gelten** (nicht nur einzelne).

---

## 🔸 Optionen in einer Regel

Beim Erstellen einer Regel konfigurierst du Folgendes:

| Feld                   | Bedeutung                                      |
|------------------------|------------------------------------------------|
| **Source IP Range**    | Quell-IP-Adresse oder Bereich                  |
| **Target IP Range**    | Ziel-IP-Adresse oder Bereich                   |
| **Traffic Throttling** | Bandbreitenbegrenzung in Mbps                  |
| **Use Gateway Server** | Option zur Nutzung eines Gateway-Servers       |
| **Encrypt traffic**    | Aktiviert Verschlüsselung für diese Verbindung |
| **Compress traffic**   | Aktiviert Datenkomprimierung                   |

---

## 🔹 Beispiel 1: Backup-Datenverkehr zwischen zwei Standorten begrenzen

**Szenario:** Du hast zwei Standorte:

* **Hauptstandort** mit IPs: `192.168.1.0/24`
* **Außenstelle** mit IPs: `10.10.10.0/24`

Zwischen den Standorten besteht eine **langsame VPN-Verbindung** (10 Mbit/s).

### 🛠 Regel

| Feld               | Wert             |
|--------------------|------------------|
| Source IP Range    | `10.10.10.0/24`  |
| Target IP Range    | `192.168.1.0/24` |
| Traffic Throttling | `5 Mbps`         |
| Encrypt traffic    | ✔ (aktiviert)    |
| Compress traffic   | ✔ (aktiviert)    |

➡️ Diese Regel stellt sicher, dass Daten von der Außenstelle nur mit maximal 5 Mbit/s übertragen werden – **verschlüsselt und komprimiert**, um Bandbreite zu sparen.

---

## 🔹 Beispiel 2: Keine Begrenzung im LAN, aber WAN verschlüsseln

**Szenario:** Lokale Backups sollen **nicht limitiert**, aber **über WAN verschlüsselt** werden.

### 🛠 Regel

| Feld               | Wert             |
|--------------------|------------------|
| Source IP Range    | `192.168.1.0/24` |
| Target IP Range    | `172.16.0.0/24`  |
| Traffic Throttling | Keine            |
| Encrypt traffic    | ✔                |
| Compress traffic   | ❌               |

➡️ Im lokalen Netzwerk gibt es keine Drosselung, aber sobald die Daten zu einem anderen Standort geschickt werden, erfolgt **Verschlüsselung**.

---

## 🔸 Was passiert, wenn keine Regel zutrifft?

Wenn keine Regel auf einen bestimmten Netzwerkpfad zutrifft, verwendet Veeam die **Standardübertragungsoptionen**:

* Keine Begrenzung.
* Keine erzwungene Verschlüsselung oder Komprimierung.
* Verwendung der Standard-Transportmethoden.

---

## 🔹 Tipps zur Nutzung

1. **Setze nur Regeln, wo nötig** – z. B. bei WAN-Strecken.
2. **Teste die Bandbreitenlimits** vor produktivem Einsatz.
3. **Nutze Verschlüsselung**, wenn Daten über ungesicherte Netze laufen.
4. Denke daran, dass **Traffic Compression** CPU-Ressourcen benötigt – insbesondere bei schwachen Servern.

---

## 🔸 Fazit

Die **Global Network Traffic Rules** sind ein mächtiges Werkzeug, um den Netzwerkverkehr in Veeam gezielt zu steuern. Sie sorgen für bessere Performance, reduzierte Kosten bei WAN-Verbindungen und erhöhte Sicherheit durch Verschlüsselung.

---
