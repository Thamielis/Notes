# Mario’s PowerShell Rulebook – Checkliste

meine verbindlichen Leitplanken für jedes PowerShell‑Script.

---

## 🧭 Optimal Development Workflow

### High-Level Problem Solving & Iteration

- **Deep Understanding:** Begin by thoroughly analyzing requirements and the root cause of any task or problem.
- **Investigation:** Explore all relevant files (if provided), understanding context, relationships, and function responsibilities.
- **Stepwise Planning:** Formulate an explicit, incremental plan before any code change.
- **Incremental Implementation:** Make isolated, logical changes, verifying each before moving forward.

Vermitt­le zuerst die Denk‑ und Strukturprinzipien (Reasoning), danach die konkrete Anwendung (Ergebnisse/Code). Beispiele sollen realistisch, modular und wiederverwendbar sein.
Die Inhalte müssen konsistent, korrekt und sofort nutzbar sein.

---

## 1. Namenskonventionen

- **Variablen**: Immer **PascalCase** (z. B. `$UserName`, `$LogPath`).  
- **Funktionen**: *Approved Verbs* + Substantiv (z. B. `Get-Config`, `Invoke-Task`).  
- **Parameter**: PascalCase (z. B. `-ComputerName`, `-OutputPath`).  
- **Dateien/Module**: Konsistent, sprechend; Modul = Ordnername.

## 2. Code-Formatierung

- Codeblöcke immer mit **explizitem Sprache‑Tag** (z. B. `powershell`, `yaml`, `json`).  
- **Keine verschachtelten Backticks**. Stattdessen **vier Backticks**/Tildes/Delimiter.  
- Lesbarkeit > Kürze. Max. 120 Zeichen pro Zeile, sinnvolle Umbrüche.

## 3. Funktionsdesign

- **Advanced Functions** mit `CmdletBinding()`; wo sinnvoll `SupportsShouldProcess`.  
- **Parameter**: Pflichtwerte mit `[Parameter(Mandatory)]`, Validierung (`ValidateSet`, `ValidatePattern`, `ValidateScript`).  
- **Pipeline**: Unterstützen, wo sinnvoll (`ValueFromPipeline`).  
- **Rückgabe**: **Objekte** (z. B. `[PSCustomObject]`), keine reinen Strings.

## 4. Fehlerbehandlung & Robustheit

- `try/catch/finally`, **gezieltes** `throw`/`Write-Error`.  
- `$ErrorActionPreference = 'Stop'` in kritischen Bereichen.  
- **Kein** Leerschlucken von Fehlern; aussagekräftige Messages, ErrorId, Target.  
- **Guardian‑Checks** (Vorbedingungen, Environment, Rechte).  
- Clean‑up in `finally`.

## 5. Logging & Telemetrie

- Einheitliches Logging (bestehend: **Modul `Logging`** weiterverwenden).  
- Level (Info/Warning/Error/Debug/Verbose), Zeitstempel, Kontext.  
- Log‑Datei + konsistente Struktur; optional ETW/EventLog je nach Szenario.

## 6. Output & UX

- **Structured Output**: PSCustomObject(s) mit klaren Property‑Namen.  
- **Nicht** in Write‑Host „versenken“.  
- `Write-Verbose`, `Write-Debug` für Detailinfos; `-Verbose` respektieren.  
- Fortschritt: `Write-Progress` bei längeren Läufen.

## 7. Performance

- **Where‑Object**/`ForEach-Object` effizient einsetzen, große Datenmengen streamen.  
- Teure Aufrufe cachen; parallele Ausführung (Runspaces/Jobs) wo sinnvoll.  
- Vermeide unnötige Subshells/Aufrufe externer Tools.

## 8. Sicherheit

- Kein hartkodiertes Geheimnis; **Credential Handling** sicher (DPAPI/SecretManagement).  
- Signieren von Scripts/Modulen nur wenn explizit angefordert.
- Principle of Least Privilege; defensive Defaults.

## 9. Tests & Qualität

- **Pester**: Unit/Integration‑Tests; Arrange/Act/Assert.  
- **Static Checks**: PSScriptAnalyzer (Regeln/Custom‑Profile).  
- CI‑Hooks (z. B. GitHub Actions): Lint, Test, Build, Version.

## 10. Dokumentation

- **Comment‑Based Help** mit Beispielen plaziert vor der Funktionsdefinition.
- Synopsis/Description/Inputs/Outputs/Notes/Examples.  
- Changelog (SemVer), README, Hinweise zu Prereqs.

## 11. Versionierung & Release

- **SemVer** (MAJOR.MINOR.PATCH).  
- Git‑Flow oder Trunk‑Based; Tags für Releases.  
- Modul‑Manifest (`.psd1`) gepflegt (Author, RootModule, RequiredModules).

## 12. Konfiguration & Portabilität

- Settings in **YAML/JSON** (nicht hardcodieren).  
- Pfade relativ, keine Umgebungs‑Spezifika im Code.  
- Konfigurationsschema validieren.

## 13. Review & Wartbarkeit

- Single Responsibility, kleine, gut benannte Funktionen.  
- DRY (kein Copy‑Paste), gemeinsame Hilfsfunktionen zentralisieren.  
- Code‑Reviews, klare Contribution‑Guides.

---

## Minimal‑Vorlage: Advanced Function (konform zu meinen Vorgaben)

````powershell
function Get-TemplateExample {
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [string]$InputPath,

        [Parameter()]
        [string]$OutputPath,

        [switch]$Force
    )

    begin {
        $StartTime = Get-Date
    }
    process {
        try {
            if (-not (Test-Path -Path $InputPath)) {
                throw [System.IO.FileNotFoundException]::new("InputPath not found: $InputPath")
            }

            $Data = Get-Content -Path $InputPath -ErrorAction Stop

            $Result = [PSCustomObject]@{
                InputPath = $InputPath
                Length    = $Data.Length
                Processed = (Get-Date)
            }

            if ($PSCmdlet.ShouldProcess($InputPath, 'Export result')) {
                if ($OutputPath) {
                    $Directory = Split-Path -Parent $OutputPath
                    if ($Directory -and -not (Test-Path -Path $Directory)) { New-Item -ItemType Directory -Path $Directory | Out-Null }
                    $Result | ConvertTo-Json -Depth 5 | Set-Content -Path $OutputPath -Encoding UTF8
                }
            }

            $Result
        }
        catch {
            Write-Error -ErrorRecord $_
            throw
        }
        finally {
            $Duration = (Get-Date) - $StartTime
            Write-Verbose ("Processed in {0} ms" -f [int]$Duration.TotalMilliseconds)
        }
    }
}
````

---

## Kurz‑Check vor dem Commit (One‑Minute‑Gate)

1. PascalCase überall? Approved Verbs?  
2. Advanced Function + Parameter‑Validierung vorhanden?  
3. Objekt‑Output statt Text?  
4. `try/catch` + sinnvolle Fehlermeldungen?  
5. Logging gemäß Modul `Logging` eingebaut?  
6. PSScriptAnalyzer/Pester grün?  
7. Konfiguration ausgelagert (YAML/JSON)?  
8. Comment‑Help mit Beispielen vollständig?  
9. SemVer/Manifest/README aktualisiert?  
10. Pfade/Secrets/Domain‑Spezifika **nicht** hartkodiert?

---

## Notes

- Bei Konflikten zwischen allgemeinen Best Practices und meinen Sondervorgaben (z. B. Variablen **immer** in PascalCase) haben **meine Vorgaben Vorrang**.
- Reasoning vor Ergebnis strikt beibehalten: In jedem Beispiel zuerst kurze Begründung/Architekturgedanken, dann Code/Resultat.
- Jede Tabelle/Referenz muss sofort anwendbar sein (keine Platzhalter, außer ausdrücklich markiert).
- Verwende durchgängig die vorgegebenen Formatierungsregeln und PascalCase für Variablen.
