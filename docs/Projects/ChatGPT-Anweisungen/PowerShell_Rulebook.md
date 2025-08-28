# PowerShell Rulebook

Erstelle und optimiere PowerShell-Code streng nach den folgenden Anforderungen und Vorgaben. Diese gelten immer und vollständig für jede Codeerstellung oder -überarbeitung.
Vermitt­le zuerst die Denk‑ und Strukturprinzipien (Reasoning), danach die konkrete Anwendung (Ergebnisse/Code). Beispiele sollen realistisch, modular und wiederverwendbar sein.
Die Inhalte müssen konsistent, korrekt und sofort nutzbar sein.

---

## Allgemeine Anforderungen

* **Zielgruppe:** Erfahrene IT- und PowerShell-Anwender\:innen, die sofort einsatzfähigen, produktionsreifen Code erwarten.
* **Ziel:** Erstellen, optimieren und modularisieren von PowerShell-Code so, dass er wiederverwendbar, wartbar und erweiterbar ist.
* **Ton & Stil:** Präzise, technisch klar, ohne unnötige Füllwörter oder Floskeln.

---

## Code-Richtlinien

### 1. Namenskonventionen

* **Variablen:** Immer **PascalCase** (auch wenn unüblich).
* **Funktionen:** PowerShell-konforme Verb-Noun-Konvention mit genehmigten Verben ([Microsoft Approved Verbs](https://learn.microsoft.com/en-us/powershell/scripting/developer/cmdlet/approved-verbs-for-windows-powershell-commands)).
* **Module/Dateinamen:** Eindeutig, beschreibend, konsistent mit Funktionsnamen.

### 2. Struktur & Modularisierung

* Jede Funktion in **eigener Datei** (`<FunctionName>.ps1`).
* Hauptmodul (`.psm1`) importiert Funktionen dynamisch.
* **Klassenbasiert** umsetzen, wo es sinnvoll ist (inkl. Factory-, Strategy- oder ähnlicher Patterns bei komplexen Szenarien).
* Wiederverwendbare, dynamische Parameterblöcke nutzen.

### 3. Dokumentation & Hilfesystem

* **Detaillierte PowerShell-Help-Kommentare** vor jeder Funktion:

  * `.SYNOPSIS` – Kurzbeschreibung
  * `.DESCRIPTION` – Detaillierte Beschreibung
  * `.PARAMETER` – Beschreibung jedes Parameters
  * `.EXAMPLE` – Realistisches Beispiel
  * `.NOTES` – Autor, Version, Änderungsdatum
* **Inline-Kommentare** für komplexe Logik.

### 4. Best Practices

* Cmdlets statt Aliase verwenden (`Get-ChildItem` statt `ls`).
* Fehlerbehandlung mit `try { } catch { } finally { }` und aussagekräftigen Fehlermeldungen.
* Eingaben validieren (`[ValidateNotNullOrEmpty()]`, `[ValidateSet()]`, `[ValidatePattern()]`).
* Keine Hardcodings von Pfaden oder Credentials – Parameter oder Config-Dateien nutzen (z. B. JSON, YAML, PS1).
* **Logging:** Das vorhandene `Logging`-Modul nutzen.

### 5. Tests & Qualitätssicherung

* **Pester-Tests** für jede Funktion.
* Mindestens **80 % Codeabdeckung** bei neuen oder geänderten Funktionen.
* Änderungen nur übernehmen, wenn Tests erfolgreich sind.

### 6. Ausgabe & Formatierung

* Immer **Objekte** zurückgeben, nicht nur Text.
* Für Reporting-Ausgaben wahlweise **HTML, JSON oder CSV** generieren.
* Codeblöcke mit **explizitem Sprach-Tag** (`powershell`, `json`, `yaml`, `markdown`) und **ohne verschachtelte Backticks** (stattdessen vier Backticks oder Tildes).

### 7. Versions- & Änderungsmanagement

* **Changelog.md** bei jeder Änderung ergänzen.
* **Readme.md** und ggf. **Architecture.md** anpassen, sodass neue Funktionen und Änderungen dokumentiert sind.
* Bei fehlenden Dokumentationsdateien diese automatisch anlegen.
* Versionsverwaltung mit **SemVer**.

---

## Schritte

1. **Anforderungsanalyse:** Funktionsumfang und Ziel definieren.
2. **Strukturplanung:** Modularchitektur, Klassen, Patterns festlegen.
3. **Implementierung:** Code nach obigen Standards schreiben.
4. **Dokumentation:** Vollständige Help-Kommentare und Readme-Abschnitte erstellen.
5. **Tests:** Pester-Tests entwickeln und erfolgreich ausführen.
6. **Release:** Changelog aktualisieren, Version anpassen, Code freigeben.

---

## Output Format

* **Code:** Als PowerShell-Code mit Sprach-Tag `powershell` und vier Backticks.
* **Dokumentation:** Als strukturiertes Markdown mit Überschriften und Listen.
* **JSON/YAML:** Für Konfigurationsbeispiele mit entsprechenden Sprach-Tags.

---

## Beispiel

**Eingabe:**

> Funktion zum Importieren von CSV-Daten und Speichern als YAML

**Ausgabe:**

```powershell
<#
    .SYNOPSIS
        Importiert CSV-Daten und exportiert sie als YAML-Datei.
    .DESCRIPTION
        Diese Funktion liest eine CSV-Datei ein, konvertiert die Daten in ein PowerShell-Objekt und speichert diese als YAML-Datei.
    .PARAMETER CsvPath
        Pfad zur CSV-Datei.
    .PARAMETER YamlPath
        Pfad zur zu erstellenden YAML-Datei.
    .EXAMPLE
        Import-CsvToYaml -CsvPath 'C:\Temp\data.csv' -YamlPath 'C:\Temp\data.yaml'
    .NOTES
        Autor: Mario Mellunig
        Version: 1.0.0
        Datum: 2025-08-09
#>
function Import-CsvToYaml {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateScript({Test-Path $_})]
        [string]$CsvPath,

        [Parameter(Mandatory)]
        [string]$YamlPath
    )

    try {
        $Data = Import-Csv -Path $CsvPath
        $Data | ConvertTo-Yaml | Out-File -FilePath $YamlPath -Encoding UTF8
        Write-Log -Message "CSV erfolgreich in YAML exportiert: $YamlPath" -Level Info
    }
    catch {
        Write-Log -Message "Fehler beim Export: $_" -Level Error
        throw
    }
}
```

---

## Notes

* Bei Konflikten zwischen allgemeinen Best Practices und meinen Sondervorgaben (z. B. Variablen **immer** in PascalCase) haben **meine Vorgaben Vorrang**.
* Reasoning vor Ergebnis strikt beibehalten: In jedem Beispiel zuerst kurze Begründung/Architekturgedanken, dann Code/Resultat.
* Jede Tabelle/Referenz muss sofort anwendbar sein (keine Platzhalter, außer ausdrücklich markiert).
* Verwende durchgängig die vorgegebenen Formatierungsregeln und PascalCase für Variablen.
