# AGENTS – Leitfaden für LLMs (PSRunSteps)

## Zweck

Diese Datei richtet sich an LLM-gestützte Coding-Agents (z. B. OpenAI Codex) und Entwickler:innen. Sie beschreibt **verbindliche Regeln und Workflows** für das Repository **PSRunSteps**, das auf dem **Catesta**-Template basiert.

---

## Goldene Regeln (TL;DR)

1. **Nutze IMMER den Build:** Tests, Linting, Doku usw. werden **ausschließlich** über Catesta/Invoke-Build ausgeführt – **nicht** direkt über `Invoke-Pester` o. ä.  
   **Befehl (verpflichtend):**

   ```powershell
   Invoke-Build ./src/PSRunSteps.build.ps1 -Task Test
   ```

2. **Eine Funktion = eine Datei:** Jede Funktion liegt als eigene `*.ps1`-Datei unter `./src/PSRunSteps/` (Public/Private), **Dateiname = Funktionsname**.
3. **Vollständige Hilfe pro Funktion:** Jede Funktionsdatei startet mit **kommentarbasiertem Help-Block** (Synopsis, Description, Parameters, Examples, Outputs/Notes).
4. **Pester 5-Tests Pflicht:** Für jede neue/angepasste Funktion existiert ein Test unter `./src/Tests/Unit/<Public|Private|Classes>/` – auf Basis von `./src/Tests/Unit/Unit_Template.ps1` – **ohne Fehler**.
5. **Dokumentation & Changelog:** **README**, **CHANGELOG.md** und eine **Architektur-Übersicht** werden erstellt/aktualisiert.
6. **Jira & Confluence:** Arbeit erfolgt **issue-basiert**. Commits/PRs referenzieren **Jira-Key(s)**. Wenn kein Zugriff möglich ist, werden **Offline-Dateien** im Repo gepflegt (siehe unten).
7. **Git-Flow & PRs:** PRs **immer gegen `develop`**, Titel enthält **Jira-Key** und folgt **Conventional Commits**.
8. **Archiv ignorieren:** Den Ordner `./Archiv/` **nicht beachten** (nur wenn explizit gefordert).

---

## Struktur (High-Level)

- `./src/PSRunSteps/`  
  - `Public/` – Öffentliche Cmdlets (exportiert), **eine Funktion pro Datei**.  
  - `Private/` – Interne Helfer, **eine Funktion pro Datei**.  
  - `PSRunSteps.psd1` – Modulmanifest (Exports pflegen, falls nicht via Wildcard).  
  - (Optional) `PSRunSteps.psm1` – Moduleinstieg (durch Build prozessiert).
- `./src/Tests/Unit/`  
  - `Public/`, `Private/`, `Classes/` – Pester 5 Unit-Tests.  
  - `Unit_Template.ps1` – **Vorlage** für neue Tests.
- `./docs/` – Generierte/kuratiere Doku (Cmdlets, Architektur).
- `./src/PSRunSteps.build.ps1` – **Build-Skript** (Invoke-Build Tasks).
- `./Archiv/` – **Nicht beachten**, außer explizit angefordert (z. B. Offline-Backlog).
- (Weitere Verzeichnisse: Artifacts/Archive/Tools je nach Catesta-Konfiguration).

---

## Entwicklungs-Workflow (Schritt für Schritt)

1. **Issue sicherstellen:** Für jede Änderung existiert ein **Jira-Issue**. Falls kein Zugriff: Offline-Erfassung im Repo (siehe *Jira/Confluence Offline*).
2. **Branch von `develop`:** z. B. `feature/PROJ-123-beschreibung` oder `fix/PROJ-456-xy`.
3. **Implementieren:**  
   - Neue öffentliche Funktion → Datei unter `src/PSRunSteps/Public/<FuncName>.ps1`.  
   - Neue private Funktion → Datei unter `src/PSRunSteps/Private/<FuncName>.ps1`.  
   - **Help-Block** vollständig ausfüllen (Synopsis/Description/Parameters/Examples/Outputs).
   - (Bei Public-Funktion ggf. `FunctionsToExport` im `.psd1` ergänzen.)
4. **Tests schreiben:**  
   - Vorlage `src/Tests/Unit/Unit_Template.ps1` kopieren.  
   - Ablegen unter `src/Tests/Unit/<Public|Private|Classes>/<FuncName>.Tests.ps1`.  
   - Realistische **Contexts/It**-Blöcke, **Mocking** für Abhängigkeiten, deterministische Assertions.
5. **Build/Tests ausführen (lokal):**

   ```powershell
   # Vollständiger Validierungs- und Testlauf
   Invoke-Build ./src/PSRunSteps.build.ps1 -Task Test
   ```

   (Keine Direktaufrufe von `Invoke-Pester` oder anderen Tools.)
6. **Doku aktualisieren:**  
   - README ergänzen (falls Nutzer-sichtbar).  
   - Architektur-Übersicht (z. B. Diagramm/Markdown) aktualisieren.  
   - Cmdlet-Hilfe wird aus Help-Blocks generiert (je nach Build-Task).
7. **CHANGELOG pflegen:** Unter **[Unreleased]** passenden Eintrag (Added/Changed/Fixed/Removed) ergänzen, optional mit Issue-Key.
8. **Commit & PR:**  
   - **Conventional Commit**-Format, z. B.: `feat(scope): beschreibung (PROJ-123)`  
   - PR **gegen `develop`**, Titel enthält **Jira-Key**, Beschreibung mit kurzer Zusammenfassung und Verweis auf Issue.
9. **CI beachten:** Auf grüne Checks achten; Feedback/Reviews einarbeiten.
10. **Merge:** Nach Freigabe per PR in `develop` mergen. Releases erfolgen gemäß Git-Flow/Automation.

---

## Coding-Standards

- **Naming:** Verb-Noun (PowerShell-konform), PascalCase, aussagekräftig.
- **Parameter:** Typen & Validierung (Mandatory, Validate*, HelpMessage). `[CmdletBinding()]` nutzen; bei ändernden Aktionen **SupportsShouldProcess** und `-WhatIf`/`-Confirm` respektieren.
- **Fehlerbehandlung:** `try/catch`, aussagekräftige Fehler; keine „leisen“ Fehlschläge.
- **Ausgabe:** Objekt-/Wert‑Rückgaben über Pipeline; kein unnötiger Host-Output.
- **Linter/Analyzer:** Hinweise von **PSScriptAnalyzer** beheben (durch Build-Task abgedeckt).
- **Formatierung:** Konsistent (Einrückung, Klammern, Zeilenlänge).

---

## Tests (Pester 5)

- **Ort & Namen:** `src/Tests/Unit/<Public|Private|Classes>/<FuncName>.Tests.ps1`.
- **Vorlage nutzen:** `src/Tests/Unit/Unit_Template.ps1` als Startpunkt.
- **Struktur:** `Describe` → `Context` → `It`; **Mocks** für externe Abhängigkeiten.
- **Abdeckung:** Alle relevanten Pfade testen (Erfolg/Fehler/Edge-Cases).
- **Ausführung:** **immer** über Build (s. oben).

---

## Build & CI

- **Single Source of Truth:** Catesta/Invoke-Build orchestriert **Analyse, Tests, Doku, Package**.
- **Beispiele für Tasks** (falls im Build vorhanden):

  ```powershell
  # Tests & Analyse
  Invoke-Build ./src/PSRunSteps.build.ps1 -Task Test

  # (Optional) Hilfe/Doku generieren
  Invoke-Build ./src/PSRunSteps.build.ps1 -Task CreateHelpStart

  # (Optional) Paket bauen/Archiv
  Invoke-Build ./src/PSRunSteps.build.ps1 -Task Build
  ```

- **Niemals** Analyzer/Tests/Doku manuell und isoliert starten, wenn ein Build-Task existiert.

---

## Dokumentation

- **Help-Blocks** in jeder Funktionsdatei sind die Quelle für Cmdlet-Doku.
- **README.md** aktuell halten (Synopsis, Installation, Quick Start, Beispiele).
- **Architektur-Übersicht** (Markdown/Diagramme) pflegen; bei relevanten Änderungen aktualisieren.
- **CHANGELOG.md** nach *Keep a Changelog*-Konventionen pflegen (Unreleased → Version durch Release-Prozess).

---

## Jira & Confluence

- **Issue-basiert arbeiten:** Jeder Change referenziert einen **Jira-Key** in **Commits** und **PR-Titel**.
- **Git-Flow & PRs:** Branch von `develop`; PR **gegen `develop`**; Titel: Conventional Commit + Issue-Key.
- **Ohne Zugriff (Offline-Workflow):**  
  - Erzeuge/aktualisiere **Issues** in Offline-Dateien im Repo (z. B. `./Archiv/PSRunSteps_issues.json` oder `.csv`).  
  - Felder: `project_key`, `issue_type`, `summary`, `description` – eindeutig & valide halten.  
  - Verknüpfung: Issue-Key in Commit/PR, damit späteres Syncen einfach ist.

---

## Nicht beachten: `./Archiv/`

- `./Archiv/` ist **ausgenommen** vom aktiven Entwicklungsfluss (Tests/Build).  
- **Nichts ändern** – außer explizit beauftragt (z. B. Offline-Backlog).

---

## PR‑Checkliste

- [ ] Issue vorhanden (oder Offline erfasst) und in Branch/PR referenziert.  
- [ ] Neue/angepasste Funktionen mit vollständigem Help-Block.  
- [ ] Passende Pester‑Tests erstellt/aktualisiert, **grün** über Build.  
- [ ] README/Docs/Architektur bei Bedarf aktualisiert.  
- [ ] CHANGELOG unter **[Unreleased]** ergänzt.  
- [ ] Konventionen: **Conventional Commit**, **PR gegen `develop`**, **PR‑Titel mit Jira‑Key**.  
- [ ] **Kein** direkter `Invoke-Pester`/ad‑hoc‑Build – nur **Invoke‑Build**.

---

## Kontaktpunkte für Agents

- Unklare Tasks → Issue/PR‑Beschreibung prüfen.  
- Änderungen mit externen Systemen (AD/Graph/Jira/Confluence) **mocken** in Unit‑Tests.  
- Sicherheitsrelevant/abwärtskompatibel? → Reviewer‑Hinweis in PR.

---

*Standards und Tasks können je nach Catesta‑Konfiguration erweitert sein. Falls ein benötigter Task im Build vorhanden ist, nutze ihn statt Einzelaufrufen.*
