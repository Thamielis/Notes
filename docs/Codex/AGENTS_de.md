# AGENTS – Leitfaden für LLMs (PSRunSteps)

Dieser Leitfaden definiert **verbindliche Regeln und Workflows** für das Repository **PSRunSteps**, das aus dem **Catesta**-Template erzeugt wurde. Zielgruppe sind LLM‑gestützte Coding‑Agents und Entwickler:innen.

---

## Zweck

Eine eindeutige, verbindliche Quelle für Build, Tests, Dokumentation und Release des PowerShell‑Moduls PSRunSteps – inklusive Konventionen für Issues, Branches, Commits und Pull Requests.

---

## Goldene Regeln (TL;DR)

1. **Immer den Build nutzen**: Tests, Linting, Doku und Packaging **ausschließlich** über Catesta/Invoke‑Build – **kein** direkter `Invoke-Pester`.

   ```powershell
   Invoke-Build ./src/PSRunSteps.build.ps1 -Task Test
   # (äquivalent): Invoke-Build -File ./src/PSRunSteps.build.ps1 Test
   ```

2. **Eine Funktion = eine Datei**: Jede Funktion als eigene `*.ps1` in `./src/PSRunSteps/` (Public/Private), **Dateiname = Funktionsname**.

3. **Vollständige Hilfe pro Funktion**: Kommentarbasierter Help‑Block (Synopsis, Description, Parameters, Examples, Outputs/Notes).

4. **Pester‑5‑Tests Pflicht**: Für jede neue/geänderte Funktion liegt ein Test unter `./src/Tests/Unit/<Public|Private|Classes>/` – auf Basis von `./src/Tests/Unit/Unit_Template.ps1` – **grün**.

5. **Dokumentation & Changelog**: **README**, **CHANGELOG.md** und **Architektur‑Übersicht** pflegen.

6. **Jira & Confluence**: **Issue‑basiert** arbeiten. Commits/PRs referenzieren **Jira‑Key(s)**. Ohne Jira‑Zugriff: **Offline‑Dateien** im Repo pflegen.

7. **Git‑Flow & PRs**: PRs **immer gegen `develop`**. Titel enthält **Jira‑Key** und folgt **Conventional Commits**.

8. **`./Archiv/` ignorieren** – außer explizit angefordert.

---

## Struktur (High‑Level)

* `./src/PSRunSteps/`

  * `Public/` – Exportierte Cmdlets, **eine Funktion pro Datei**
  * `Private/` – Interne Helfer, **eine Funktion pro Datei**
  * `PSRunSteps.psd1` – Modulmanifest (Exports pflegen, falls nicht via Wildcard)
  * *(Optional)* `PSRunSteps.psm1` – Moduleinstieg (vom Build verarbeitet)
* `./src/Tests/Unit/`

  * `Public/`, `Private/`, `Classes/` – Pester‑5‑Unit‑Tests
  * `Unit_Template.ps1` – **Vorlage**
* `./docs/` – Generierte/kuratierte Doku (Cmdlets, Architektur)
* `./src/PSRunSteps.build.ps1` – **Build‑Skript** (Invoke‑Build‑Tasks)
* `./Archiv/` – **Nicht beachten**, außer explizit gefordert (z. B. Offline‑Backlog)

---

## Entwicklungs‑Workflow (Schritt für Schritt)

1. **Issue sicherstellen** (Jira). Ohne Zugriff: Offline‑Erfassung im Repo (siehe *Jira/Confluence Offline*).

2. **Branch von `develop`**: z. B. `feature/PROJ-123-beschreibung` oder `fix/PROJ-456-xy`.

3. **Implementieren**

   * Öffentliche Funktion → `src/PSRunSteps/Public/<FuncName>.ps1`
   * Private Funktion → `src/PSRunSteps/Private/<FuncName>.ps1`
   * **Help‑Block** vollständig ausfüllen
   * Bei Public ggf. `FunctionsToExport` im `.psd1` ergänzen

4. **Tests schreiben**

   * Vorlage `src/Tests/Unit/Unit_Template.ps1` kopieren
   * Ablage: `src/Tests/Unit/<Public|Private|Classes>/<FuncName>.Tests.ps1`
   * Realistische `Context`/`It`‑Blöcke, **Mocking** für Abhängigkeiten, deterministische Assertions

5. **Build/Tests lokal ausführen**

   ```powershell
   Invoke-Build ./src/PSRunSteps.build.ps1 -Task Test
   ```

   *(Keine Direktaufrufe von `Invoke-Pester`.)*

6. **Doku aktualisieren**

   * README ergänzen (Nutzer‑sichtbar)
   * Architektur‑Übersicht aktualisieren (Diagramm/Markdown)
   * Cmdlet‑Hilfe wird aus Help‑Blocks generiert (je nach Build‑Task)

7. **CHANGELOG pflegen**

   * Unter **[Unreleased]** passenden Eintrag (Added/Changed/Fixed/Removed), optional mit Issue‑Key

8. **Commit & PR**

   * **Conventional Commit**‑Format, z. B.: `feat(scope): beschreibung (PROJ-123)`
   * PR **gegen `develop`**, Titel enthält **Jira‑Key**, Beschreibung mit Kurzfassung und Verweis auf Issue

9. **CI beachten**

   * Auf grüne Checks achten; Feedback/Reviews einarbeiten

10. **Merge**

    * Nach Freigabe per PR nach `develop` mergen. Releases gemäß Git‑Flow/Automation

---

## Coding‑Standards

### Naming

Verb‑Nomen (PowerShell‑konform), PascalCase, aussagekräftig.

### Parameter

Typen & Validierung (`Mandatory`, `Validate*`, `HelpMessage`). `[CmdletBinding()]` nutzen; bei ändernden Aktionen **SupportsShouldProcess** und `-WhatIf`/`-Confirm` respektieren.

### Fehlerbehandlung

`try/catch`, aussagekräftige Fehler; keine „leisen“ Fehlschläge.

### Ausgabe

Objekt‑/Wert‑Rückgaben über Pipeline; kein unnötiger Host‑Output.

### Linter/Analyzer

Hinweise von **PSScriptAnalyzer** beheben (durch Build‑Task abgedeckt).

### Formatierung

Konsistent (Einrückung, Klammern, Zeilenlänge).

---

## Tests (Pester 5)

### Ort & Namen

`src/Tests/Unit/<Public|Private|Classes>/<FuncName>.Tests.ps1`.

### Vorlage

`src/Tests/Unit/Unit_Template.ps1` als Startpunkt.

### Struktur

`Describe` → `Context` → `It`; **Mocks** für externe Abhängigkeiten.

### Abdeckung

Erfolg/Fehler/Edge‑Cases abdecken.

### Ausführung

**Immer** über den Build (s. o.).

---

## Build & CI

**Single Source of Truth:** Catesta/Invoke‑Build orchestriert **Analyse, Tests, Doku, Package**.

### Beispiele für Tasks (falls vorhanden)

```powershell
# Tests & Analyse
Invoke-Build ./src/PSRunSteps.build.ps1 -Task Test

# (Optional) Hilfe/Doku generieren
Invoke-Build ./src/PSRunSteps.build.ps1 -Task CreateHelpStart

# (Optional) Paket/Artifacts bauen
Invoke-Build ./src/PSRunSteps.build.ps1 -Task Build
```

**Niemals** Analyzer/Tests/Doku manuell und isoliert starten, wenn ein Build‑Task existiert.

---

## Dokumentation

### Help‑Blocks

Help‑Blocks in jeder Funktionsdatei sind die Quelle für Cmdlet‑Doku.

### README.md

Aktuell halten (Synopsis, Installation, Quick Start, Beispiele).

### Architektur‑Übersicht

Markdown/Diagramme pflegen; bei relevanten Änderungen aktualisieren.

### CHANGELOG.md

Nach *Keep a Changelog* pflegen (Unreleased → Version durch Release‑Prozess).

---

## Jira & Confluence

### Issue‑basiert

Jeder Change referenziert einen **Jira‑Key** in **Commits** und **PR‑Titeln**.

### GitHub‑Verknüpfung

**Jira‑Key** in Commit‑Messages und PR‑Titeln aufnehmen, damit Aktivität automatisch verknüpft wird. Smart Commits möglich (z. B. `PROJ-123 #comment Tests ergänzt #time 1h #done`).

### Offline‑Workflow (ohne Zugriff)

**Issues** in Offline‑Dateien im Repo pflegen (z. B. `./Archiv/PSRunSteps_issues.json`/`.csv`). Felder: `project_key`, `issue_type`, `summary`, `description`. Verknüpfung über Issue‑Key in Commit/PR; späteres Syncen wird dadurch einfacher.

---

## `./Archiv/` nicht beachten

`./Archiv/` ist **ausgenommen** vom aktiven Entwicklungsfluss (Tests/Build). Nichts ändern – außer explizit beauftragt (z. B. Offline‑Backlog).

---

## PR‑Checkliste

* [ ] Issue vorhanden (oder offline erfasst) und in Branch/PR referenziert
* [ ] Neue/angepasste Funktionen mit vollständigem Help‑Block
* [ ] Passende Pester‑Tests erstellt/aktualisiert, **grün** über Build
* [ ] README/Docs/Architektur bei Bedarf aktualisiert
* [ ] CHANGELOG unter **[Unreleased]** ergänzt
* [ ] Konventionen: **Conventional Commit**, **PR gegen `develop`**, **PR‑Titel mit Jira‑Key**
* [ ] **Kein** direkter `Invoke-Pester`/ad‑hoc‑Build – nur **Invoke‑Build**

---

## Ergänzungen: Catesta, Jira/GitHub‑Verlinkung, GitKraken‑Vorgaben, Conventional Commits

### Catesta‑Hinweise

* Catesta erzeugt Invoke‑Build‑Tasks für `Analyze`, `Test`, `CreateHelpStart`, `Build`, optional `IntegrationTest`, `Archive`.
* Pester 4 **oder** 5 wird unterstützt; für PSRunSteps Pester 5 nutzen.
* Minimale PowerShell‑Version: **5.1**; PS7+ für Cross‑Platform‑Builds empfohlen.

### Jira ↔ GitHub Verlinkung

* **Jira‑Key** in Commit‑Messages aufnehmen: `git commit -m "PROJ-123: <message>"`
* **Jira‑Key** in **PR‑Titeln** aufnehmen
* Smart Commits (optional): `PROJ-123 #comment <text> #time 1h #done`

### GitKraken – Commit, Branch, PR

* **Branches**: Issue‑Key enthalten. Muster: `<type>/<ISSUEKEY>-<slug>`
  * Beispiele: `feature/PROJ-123-add-logging`, `fix/PROJ-456-nullref`
* **Commits**: Conventional Commits + Jira‑Key im Footer oder Subject
  * Beispiel: `feat(core): add logging (PROJ-123)`
  * oder: `PROJ-123 feat(core): add logging`
* **PRs**: Titel enthält Issue‑Key und folgt Conventional Commits
  * Beispiel: `feat(core): add logging (PROJ-123)`

---

## Automatisierung (Empfehlung)

### GitHub Actions – Conventional Commits/PR‑Titel

`.github/workflows/semantics.yml`:

```yaml
name: semantics
on:
  pull_request:
    types: [opened, edited, synchronize]
jobs:
  pr-title:
    runs-on: ubuntu-latest
    steps:
      - uses: amannn/action-semantic-pull-request@v5
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        with:
          types: >-
            build,chore,ci,docs,feat,fix,perf,refactor,revert,style,test
  commitlint:
    runs-on: ubuntu-latest
    if: ${{ github.event_name == 'pull_request' }}
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0
      - uses: wagoid/commitlint-github-action@v6
```

### Regex‑Gate für Jira‑Keys

* **Jira‑Key‑Regex**: `(?<![A-Z0-9])[A-Z]{2,}-\d+`
* **PR‑Titel‑Pattern** (Conventional + Jira‑Key am Ende):
  `^(build|chore|ci|docs|feat|fix|perf|refactor|revert|style|test)(\([\w.-]+\))?: .+ \([A-Z]{2,}-\d+\)$`

### Branch‑Protection (GitHub)

* **Status‑Checks** erzwingen (Build/Tests, Semantic PR, Commitlint)
* Reviews anfordern
* Pushes auf `main`/`develop` beschränken

---

*Standards und Tasks können je nach Catesta‑Konfiguration variieren. Wenn ein benötigter Task im Build vorhanden ist, nutze ihn statt Einzelaufrufen.*
