
---
created: 2024-08-01T13:48:42 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/nas_proxies.html
author: 
---

# Datei-Backup-Proxy | Veeam Backup & Replikations-Best-Practice-Leitfaden

---
## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/nas_proxies.html#proxy-placement)Proxy-Platzierung

Grundsätzlich sollte der Proxy so nah wie möglich an den Quelldaten mit einer Hochgeschwindigkeitsverbindung platziert werden. Der Datenverkehr von der Quelle zum Proxy ist noch nicht optimiert, was bedeutet, dass 100% der Backup-Daten über diese Verbindung übertragen werden.

Berücksichtigen Sie auch eine gute Verbindung zwischen Proxy und Repository. Optimierte Daten, die vom Proxy verarbeitet wurden, werden hier übertragen.

**Hinweis**: In v12 wurde der Backup-Proxy für Datei-Backups in **Allzweck-Backup-Proxy** umbenannt.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/nas_proxies.html#proxy-os-requirements)Proxy-Betriebssystemanforderungen

Wir empfehlen die Verwendung der neuesten unterstützten Betriebssystemversion mit den neuesten Updates, um alle sicherheits- und leistungsbezogenen Updates einzuschließen.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/nas_proxies.html#proxy-sizing)Proxy-Dimensionierung

Die richtige Menge an Verarbeitungskapazität ist entscheidend, um die von der Geschäftswelt definierten RTO/RPO zu erreichen. In diesem Abschnitt geben wir Empfehlungen zur angemessenen Dimensionierung.

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/nas_proxies.html#processing-resources)Verarbeitungsressourcen

Proxies haben mehrere Task-Slots zur Verarbeitung von Quelldaten, abhängig von der Anzahl der verfügbaren CPU-Kerne. Eine Proxy-Aufgabe verarbeitet **eine Dateifreigabe gleichzeitig** und CPU/RAM-Ressourcen werden für Inline-Komprimierung und/oder Verschlüsselung verwendet.

Es ist Best Practice, **4 GB RAM für jede gleichzeitige Proxy-Aufgabe** einzuplanen. Bei der Dimensionierung eines Proxys dürfen Sie nicht vergessen, die notwendigen Ressourcen für das Betriebssystem zu berücksichtigen.

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/nas_proxies.html#example-one)Beispiel eins

3 PB Quelldaten, 800M Dateien, 3% Änderungsrate, 8 Stunden Backup-Fenster, 2 Proxy-Aufgaben pro Kern (v12).

| Dimensionierung | Formel | Größe |
| --- | --- | --- |
| Erforderliche inkrementelle Durchsatzrate | (3PB x 2%) / 8 Stunden | 7,68TB/h (bei 100MB/s) |
| Dateien (M), die pro Stunde verarbeitet werden müssen | 800M / 8 Stunden | 100 M/h |
| Datei-Proxy-Durchsatz | 0,34 TB/Stunde (100 MB/s) |   |
| Datei-Proxy-Dateiverarbeitung | 5 Millionen Dateien/Stunde |   |
| CPU-Kern-Anzahl basierend auf inkrementellem Durchsatz | 7,68 / 0,34 / 2 | 12 Datei-Proxy-Kerne |
| CPU-Kern-Anzahl basierend auf Millionen von Dateien | 100 / 5 / 2 | 10 Datei-Proxy-Kerne |
| Höchste CPU-Kern-Anzahl | 12 (höchste Kernanzahl aufgerundet auf gerade Zahl) |   |
| Erforderlicher Speicher in GB | 12 \* 2 \* 2 | 48 |

**Erforderliche Ressourcen für Datei-Proxies sind 12 Kerne und 48GB RAM.** Denken Sie daran, zusätzliche Ressourcen für das Betriebssystem zu berücksichtigen. Diese Ressourcen können auf einem einzelnen physischen Proxy (mit mindestens 14 Kernen) oder zwei virtuellen Proxies (jeweils acht Kerne) bereitgestellt werden. Die Einstellung „Normal“ und höher für Backup-IO-Kontrolle kann verwendet werden.

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/nas_proxies.html#example-two)Beispiel zwei

300TB Quelldaten, 300M Dateien, 2 Freigaben, 3% Änderungsrate, 8 Stunden Backup-Fenster, 2 Proxy-Aufgaben pro Kern (v12).

| Dimensionierung | Formel | Größe |
| --- | --- | --- |
| Erforderliche inkrementelle Durchsatzrate | (300TB x 3%) / 8 Stunden | 1,125TB/h (bei 100MB/s) |
| Dateien (M), die pro Stunde verarbeitet werden müssen | 300M / 8 Stunden | 37,5M/h |
| Datei-Proxy-Durchsatz | 0,34 TB/Stunde (100 MB/s) |   |
| Datei-Proxy-Dateiverarbeitung | 5 Millionen Dateien/Stunde |   |
| CPU-Kern-Anzahl basierend auf inkrementellem Durchsatz | 1,125 / 0,34 / 2 | 2 Datei-Proxy-Kerne |
| CPU-Kern-Anzahl basierend auf Millionen von Dateien | 37,5 / 5 / 2 | 4 Datei-Proxy-Kerne |
| Höchste CPU-Kern-Anzahl | 4 (höchste Kernanzahl aufgerundet auf gerade Zahl) |   |
| Erforderlicher Speicher in GB | 4 \* 2 \* 2 | 16 |

**Erforderliche Ressourcen für Datei-Proxies sind 4 Kerne und 16GB RAM.** Denken Sie daran, zusätzliche Ressourcen für das Betriebssystem zu berücksichtigen. Diese Ressourcen könnten auf mindestens zwei Proxies (zwei Freigaben, eine Proxy-Aufgabe pro Freigabe) mit jeweils vier Kernen bereitgestellt werden. Die Einstellung „Normal“ und höher für Backup-IO-Kontrolle kann verwendet werden.

___
