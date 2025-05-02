# joboverview.ps1

## Overview

- **Script Name**: joboverview.ps1  
- **Description**:  
  Dieses Skript dient zur Analyse von Veeam Backup & Replication Job-Konfigurationen (v12). Es extrahiert Informationen über Speichereinstellungen, Aufbewahrungsrichtlinien sowie NAS-spezifische Jobs und exportiert diese als CSV-Berichte.  
- **Author**: Stephan Herzig, Veeam Software  
- **Modified By**: mho@anio.at  
- **Version**: 1.4  
- **Last Modified**: *Unbekannt*  
- **Prerequisites**:  
  - PowerShell  
  - Veeam Backup & Replication v12  
  - Schreibrechte für das angegebene Output-Verzeichnis

---

## Dependencies

### Built-in Modules / Cmdlets

- `Get-Date`
- `New-Item`
- `Test-Path`
- `Write-Output`, `Write-Error`
- `Export-Csv`

### Third-Party Modules

- Keine direkten Anforderungen erkannt

### Custom Scripts / Functions

- **[FindBackupTargetRepository]** – wird aufgerufen, ist jedoch nicht im Projekt enthalten  
  *(Vermutlich früher in einem externen Modul oder ausgelagertem Funktionsskript definiert.)*

---

## Defined Functions

Es werden **keine Funktionen** im Skript `joboverview.ps1` definiert. Die gesamte Logik befindet sich auf Skriptebene.

---

## Call Flow Overview

1. Start
   - Eingabeparameter `$OutputDirectory` prüfen
   - Ordner erstellen, wenn nicht vorhanden
   - Aktuelles Datum/Zeit generieren
   - Ergebnisse initialisieren
2. `Get-VBRJob` – Backup-Jobs abrufen
   - durchlaufen mit `foreach`
   - Filterung nach Speichereinstellungen, Aufbewahrung, etc.
   - `FindBackupTargetRepository` aufrufen (nicht definiert)
3. `Get-VBRNASBackupJob` – NAS-Jobs abrufen
4. Ergebnisse nach Typ gruppieren:
   - Speicher-Zuordnung → `$outputCsvStorage`
   - Aufbewahrung → `$outputCsvRetention`
   - NAS → `$outputCsvNAS`
5. Export mit `Export-Csv`
6. End

---

## Error Handling

- **Directory-Check & Erstellung**:  

```powershell
  if (-not (Test-Path -Path $OutputDirectory)) {
      try {
          New-Item ... -Force | Out-Null
      } catch {
          Write-Error ... ; exit 1
      }
  }
```

- Kein globales `$ErrorActionPreference` gesetzt  
- Kein zentraler Fehler-Logger, aber manuelle Fehlerbehandlung im Verzeichnis-Check

---

## Output Artifacts

- **CSV-Dateien**:
  - `$OutputDirectory\BackupStorage_<timestamp>.csv`
  - `$OutputDirectory\BackupRetention_<timestamp>.csv`
  - `$OutputDirectory\BackupNAS_<timestamp>.csv`
- **Datenstruktur**:
  - Inhalt variiert je nach Jobtyp, enthält u.a. Repository-Namen, Aufbewahrungstage, Komprimierungslevel etc.

---

## Usage Examples and Notes

```powershell
.\joboverview.ps1 -OutputDirectory "D:\Reports\Veeam"
```

### Hinweise:

- `$OutputDirectory` ist optional, Standard ist: `G:\Install\Anio-Reports`
- Script nutzt aktuelle Uhrzeit für eindeutige Dateinamen
- `FindBackupTargetRepository` muss ggf. ergänzt oder entfernt werden – derzeit **nicht verfügbar**

---

## Edge Cases / Known Limitations

- Die Funktion `FindBackupTargetRepository` ist im Projekt nicht vorhanden
- Wenn keine Veeam-Jobs vorhanden sind, bleiben die CSV-Dateien leer
- Keine direkte Prüfung, ob Veeam PowerShell Snap-in oder Modul geladen ist
- Kein Logging der Ergebnisse (z. B. mit `Start-Transcript`)

---

## Additional Notes

- Potenziell sollte das Skript modularisiert werden, z. B. mit `Export-JobReportStorage`, `Export-JobReportRetention`, etc.
- `FindBackupTargetRepository` sollte ersetzt oder dokumentiert werden
- Kandidat zur Integration in ein Modul wie `KOWVeeam.psm1`