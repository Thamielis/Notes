# AGENTS – Guide for LLMs (PSRunSteps)

This guide defines **mandatory rules and workflows** for the **PSRunSteps** repository, which is scaffolded from the **Catesta** template. It is written for LLM-based coding agents and developers.

---

## Purpose

Provide a single, enforceable source of truth for building, testing, documenting, and shipping the PSRunSteps PowerShell module, including conventions for issues, branches, commits, and pull requests.

---

## Golden Rules (TL;DR)

1. **Always use the build**: Run tests, linting, docs, and packaging **only** via Catesta/Invoke-Build – **not** by calling `Invoke-Pester` directly.

   ```powershell
   Invoke-Build ./src/PSRunSteps.build.ps1 -Task Test
   # (equivalent): Invoke-Build -File ./src/PSRunSteps.build.ps1 Test
   ```

2. **One function = one file**: Each function lives as its own `*.ps1` under `./src/PSRunSteps/` (Public/Private), **file name = function name**.

3. **Full help per function**: Each function file starts with a **comment-based help block** (Synopsis, Description, Parameters, Examples, Outputs/Notes).

4. **Pester 5 tests required**: Every new/changed function has a test under `./src/Tests/Unit/<Public|Private|Classes>/` using `./src/Tests/Unit/Unit_Template.ps1` – tests must pass.

5. **Documentation & Changelog**: Update **README**, **CHANGELOG.md**, and **architecture overview** with each relevant change.

6. **Jira & Confluence**: Work is **issue-driven**. Commits/PRs reference **Jira key(s)**. If Jira access is unavailable, maintain **offline files** in-repo (see below).

7. **Git Flow & PRs**: All PRs target **`develop`**. Titles include **Jira key** and follow **Conventional Commits**.

8. **Ignore `./Archiv/`** unless explicitly requested.

---

## Structure (High-Level)

* `./src/PSRunSteps/`

  * `Public/` – Exported cmdlets, **one function per file**.
  * `Private/` – Internal helpers, **one function per file**.
  * `PSRunSteps.psd1` – Module manifest (manage `FunctionsToExport` if not wildcarded).
  * *(Optional)* `PSRunSteps.psm1` – Module entry point (processed by the build).
* `./src/Tests/Unit/`

  * `Public/`, `Private/`, `Classes/` – Pester 5 unit tests.
  * `Unit_Template.ps1` – **Template** for new tests.
* `./docs/` – Generated/curated docs (cmdlets, architecture).
* `./src/PSRunSteps.build.ps1` – **Build script** (Invoke-Build tasks).
* `./Archiv/` – **Do not touch** unless explicitly requested (e.g., offline backlog).
* *(Additional directories may exist based on Catesta config: Artifacts/Archive/Tools.)*

---

## Development Workflow (Step by Step)

1. **Ensure an issue** exists for every change (Jira). If no access: record offline in repo (see *Jira/Confluence Offline*).

2. **Branch from `develop`**: e.g. `feature/PROJ-123-description` or `fix/PROJ-456-xyz`.

3. **Implement**

   * Public function → `src/PSRunSteps/Public/<FuncName>.ps1`
   * Private function → `src/PSRunSteps/Private/<FuncName>.ps1`
   * Fill **help block** completely (Synopsis, Description, Parameters, Examples, Outputs)
   * For public functions, update `FunctionsToExport` in `.psd1` if necessary

4. **Write tests**

   * Copy `src/Tests/Unit/Unit_Template.ps1`
   * Save as `src/Tests/Unit/<Public|Private|Classes>/<FuncName>.Tests.ps1`
   * Provide realistic `Context`/`It` blocks, **mock dependencies**, make assertions deterministic

5. **Run build/tests locally**

   ```powershell
   Invoke-Build ./src/PSRunSteps.build.ps1 -Task Test
   ```

   *(Do **not** call `Invoke-Pester` directly.)*

6. **Update documentation**

   * Extend README (user-facing sections)
   * Update architecture overview (diagram/Markdown)
   * Cmdlet help is generated from comment-based help (per build task)

7. **Maintain CHANGELOG**

   * Under **[Unreleased]** add entries (Added/Changed/Fixed/Removed), optionally include issue key

8. **Commit & PR**

   * Use **Conventional Commits**: `feat(scope): description (PROJ-123)`
   * PR targets **`develop`**, title includes **Jira key**, description summarizes change and references the issue

9. **CI**

   * Ensure all checks are green; address feedback/reviews

10. **Merge**

    * After approval, merge PR into `develop`. Releases follow Git Flow/automation

---

## Coding Standards

### Naming

Verb-Noun (PowerShell standard), PascalCase, meaningful names.

### Parameters

Type declarations and validation attributes (`Mandatory`, `Validate*`, `HelpMessage`). Use `[CmdletBinding()]`. For state-changing actions, support **ShouldProcess** with `-WhatIf`/`-Confirm`.

### Error Handling

Use `try/catch` with informative errors; avoid silent failures.

### Output

Return objects/values via the pipeline; avoid unnecessary host output.

### Linting/Analyzer

Fix **PSScriptAnalyzer** findings (covered by the build task).

### Formatting

Keep indentation, braces, and line length consistent.

---

## Tests (Pester 5)

### Location & Names

Place tests in `src/Tests/Unit/<Public|Private|Classes>/<FuncName>.Tests.ps1`.

### Template

Start from `src/Tests/Unit/Unit_Template.ps1`.

### Structure

`Describe` → `Context` → `It`; use **Mocks** for external dependencies.

### Coverage

Test success/failure/edge cases for relevant paths.

### Execution

Run **only through the build** (see above).

---

## Build & CI

**Single source of truth:** Catesta/Invoke-Build orchestrates **analysis, tests, docs, packaging**.

### Common Tasks (if present)

```powershell
# Tests & analysis
Invoke-Build ./src/PSRunSteps.build.ps1 -Task Test

# (optional) Generate help/docs
Invoke-Build ./src/PSRunSteps.build.ps1 -Task CreateHelpStart

# (optional) Build package/artifacts
Invoke-Build ./src/PSRunSteps.build.ps1 -Task Build
```

Never run analyzer/tests/docs manually when a build task exists.

---

## Documentation

### Help Blocks

Each function’s comment-based help is the source for cmdlet documentation.

### README.md

Keep Synopsis, Installation, Quick Start, and Examples current.

### Architecture Overview

Maintain Markdown/diagrams; update when relevant changes occur.

### CHANGELOG.md

Follow *Keep a Changelog* conventions (Unreleased → versioned via release process).

---

## Jira & Confluence

### Issue-Driven Work

Every change references a **Jira key** in **commits** and **PR titles**.

### GitHub/Jira Linking

Include the **Jira key** in commit messages and PR titles to link activity to the Jira issue. Smart Commits are supported when enabled (e.g., `PROJ-123 #comment Added tests #time 1h #done`).

### Offline Workflow (No Access)

Maintain issues in repo files (e.g., `./Archiv/PSRunSteps_issues.json` or `.csv`). Use fields: `project_key`, `issue_type`, `summary`, `description`. Reference the offline issue key in commit/PR for later sync.

---

## Ignore `./Archiv/`

`./Archiv/` is excluded from the active development flow (tests/build). Do not change anything there unless explicitly requested (e.g., offline backlog).

---

## PR Checklist

* [ ] Issue exists (or offline recorded) and referenced in branch/PR
* [ ] New/updated functions have complete help blocks
* [ ] Pester tests created/updated and **passing** via build
* [ ] README/Docs/Architecture updated as needed
* [ ] CHANGELOG updated under **[Unreleased]**
* [ ] Conventions: **Conventional Commit**, **PR to `develop`**, **PR title includes Jira key**
* [ ] **No** direct `Invoke-Pester`/ad-hoc builds – use **Invoke-Build** only

---

## Addenda: Catesta, Jira/GitHub Linking, GitKraken Requirements, Conventional Commits

### Catesta Notes

* Catesta scaffolds PowerShell modules with Invoke-Build tasks for `Analyze`, `Test`, `CreateHelpStart`, `Build`, optional `IntegrationTest`, and `Archive`.
* Pester 4 **or** 5 projects are supported; use Pester 5 for PSRunSteps.
* Minimum supported PowerShell: **5.1** (for the scaffolded project); PS7+ supported for cross-platform builds.

### Jira ↔ GitHub Linking Requirements

* Include the **Jira key** in commit messages: `git commit -m "PROJ-123: <message>"`
* Include the **Jira key** in **PR titles**.
* Smart Commits (optional): `PROJ-123 #comment <text> #time 1h #done`

### GitKraken – Commit, Branch, PR Conventions

* **Branches**: include the issue key. Recommended pattern: `<type>/<ISSUEKEY>-<slug>`
  * Examples: `feature/PROJ-123-add-logging`, `fix/PROJ-456-nullref`
* **Commits**: Conventional Commits + Jira key in footer or subject
  * Example: `feat(core): add logging (PROJ-123)`
  * or: `PROJ-123 feat(core): add logging`
* **PRs**: Title contains issue key and follows Conventional Commits
  * Example: `feat(core): add logging (PROJ-123)`

---

## Automation (Recommended)

### GitHub Actions – Conventional Commits/PR Titles

Create `.github/workflows/semantics.yml`:

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

### Regex Gate for Jira Keys

Use a PR title/commit message check that requires a Jira key:

* **Jira key regex**: `(?<![A-Z0-9])[A-Z]{2,}-\d+`
* **PR title pattern** (Conventional + Jira key at end):
  `^(build|chore|ci|docs|feat|fix|perf|refactor|revert|style|test)(\([\w.-]+\))?: .+ \([A-Z]{2,}-\d+\)$`

### Branch Protection (GitHub)

* Require **status checks** passing (build/tests, semantic PR, commitlint)
* Require PR reviews
* Restrict pushes to `main` and `develop`

---
