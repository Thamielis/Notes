---
name: "SyncSage2AD"
description: "PowerShell module that synchronizes employee information from Sage with Active Directory and Exchange. Provides cmdlets for data collection, group maintenance and mailbox management using parallel runspaces."
category: "Active Directory Integration"
author: "Mario Mellunig"
authorUrl: "[https://github.com/Thamielis](https://github.com/Thamielis)"
tags: ["powershell", "active-directory", "sage", "exchange", "automation"]
lastUpdated: "2025-07-03"
-------------------------

## 🚀 Project Overview

SyncSage2AD is a robust PowerShell module engineered for synchronizing HR data from Sage into Active Directory (AD) and Exchange. Its design emphasizes maintainability, test-driven development, and scalable parallel runspace execution. The primary goal is to automate and safeguard directory data integrity, minimizing manual IT effort.

---

## 🧭 Optimal Development Workflow

### High-Level Problem Solving & Iteration

* **Deep Understanding:** Begin by thoroughly analyzing requirements and the root cause of any task or problem.
* **Investigation:** Explore all relevant files (especially within module directories), understanding context, relationships, and function responsibilities.
* **Stepwise Planning:** Formulate an explicit, incremental plan before any code change.
* **Incremental Implementation:** Make isolated, logical changes, verifying each before moving forward.
* **Rigorous Testing:** After every change, run the test suite using `Invoke-Build -Task Test`. Refactor as needed until all tests pass.
* **Reflection and Final Validation:** Review solutions, edge cases, and original problem intent. Add or enhance tests for uncovered logic.
* **Documentation & Changelog:**

  * You MUST update all related documentation files (`README.md`, `CHANGELOG.md`, `ProjectArchitecture.md`, and others as appropriate) with every provided change.
  * **Always check if `CHANGELOG.md` and `README.md` include all relevant changes from the entire git commit history.**
  * If any data or documentation updates from previous or related commits are missing, you MUST update and synchronize them accordingly.
  * **If any of these files (`README.md`, `CHANGELOG.md`, `ProjectArchitecture.md`, or others required by this guide) do not exist, you must create them.**
* **Release:** Update module versioning and release checklist upon validated improvements.

You **must never end an iteration or commit without all relevant tests passing**.
**Only new or changed code related to the current task must meet at least 80% code coverage.**
Existing code not affected by the change does not require retroactive coverage.

---

## ⚙️ Tech Stack

| Layer      | Technology             |
|------------|------------------------|
| Language   | PowerShell 7           |
| Build      | InvokeBuild            |
| Testing    | Pester v5+             |
| Docs       | platyPS + Docsify      |
| CI/CD      | GitHub Actions         |
| Versioning | Semantic (via Git Tag) |

---

## 📁 Project Structure

### Key Directories

* **/src/**

  * Module root: `/src/SyncSage2AD/`
  * Build scripts: `/src/SyncSage2AD.build.ps1`, `/src/SyncSage2AD.Settings.ps1`
  * Config: `/src/Config/RequiredModules.psd1`
  * Tests: `/src/Tests/`
* **/docs/** — Docsify-based documentation
* **/Archiv/** — *Ignore*; for legacy/backup only
* **/actions\_bootstrap.ps1** — Bootstrap script for dependencies (see below)

---

## 🧑‍💻 Development Guidelines

### Code Style

* Follow the [PowerShell Style Guide](https://aka.ms/psstyle)
* One function per file with full inline comment-based help *before* the function
* Prefer strong typing; limit scope of variables/functions
* Use OO design only if beneficial (base classes, polymorphism, factories)
* No ambiguous names; always use self-descriptive identifiers

### Naming Conventions

| Element  | Convention        |
|----------|-------------------|
| Function | `Verb-Noun`       |
| Variable | `PascalCase`      |
| File     | `<Verb-Noun>.ps1` |
| Class    | `PascalCase`      |

### Documentation

* You **must** update `README.md`, `CHANGELOG.md`, `ProjectArchitecture.md`, and any other relevant documentation files with every change.
* **Always check if `README.md` and `CHANGELOG.md` (and all other relevant docs) include all related changes from the git commits history.** Review `git log` to confirm no entries are missed.

  * If any relevant entries or updates are missing from prior commits, you MUST synchronize and add them now.
* **If a related file referenced here does not exist, you must create it and populate it according to current and past changes.**
* Update `ProjectArchitecture.md` (sequence, structure, flow)
* Update `CHANGELOG.md` with semantic versioning
* Update `README.md` and Docsify pages on public function/usage changes
* Run `Invoke-Build CreateMarkdownHelp` to regenerate documentation from comment-based help
* Every exported function **must** include full comment-based help

### Steps

1. If not already done, run `./actions_bootstrap.ps1` to install dependencies (required for development and CI, but **not needed for end users**).
2. Add/edit function in correct file; include full help.
3. Write/modify Pester tests for **new or changed code** (≥80% coverage for new/changed code only). The build script's 2% baseline does not override this requirement.
4. Run all tests (`Invoke-Build -Task Test`) from the repository root and validate coverage for new/changed code.
5. If tests pass:

   * Update `CHANGELOG.md`
   * Update `ProjectArchitecture.md` if structure changed
   * Update `README.md`
   * **Always review and synchronize documentation with git commit history for completeness.**
6. If tests fail, iterate until resolved.
7. When done, commit function/test/documentation diffs only if all validations pass.
8. Bump version in `.psd1` if change is user-visible.

---

## Output Format

When presenting changes or additions, always use **Markdown** and follow this order:

* **Function File:** Filename + code
* **Test File:** Filename + Pester test code
* **Changelog Entry:** Markdown lines for `CHANGELOG.md`
* **Architecture Update:** Only if project structure/flow changed
* **Validation Summary:** Test results and code coverage for new/changed code

Only include changes that passed validation, and ensure all outputs are ready for CI/CD and Docsify integration.

---

## Testing Strategy

### Unit Tests

* All functions: individual `.Tests.ps1` files in `/tests/`
* **At least 80% coverage required for new or changed code only**
* Edge/failure paths covered for modified logic

### Integration/End-to-End

* Simulate Sage imports and validate AD user update workflows
* Validate parallel execution/thread safety

### CI/CD

* PRs/Pushes: Lint, Test, Docs
* Tags: Build and Release

---

## Build & Environment Setup

* `./actions_bootstrap.ps1` is **required for development and CI/CD environments** to ensure dependencies are present, but is **not needed for the final published module**.

---

## Git Workflow

| Action          | Convention                    |
|-----------------|-------------------------------|
| Branch Name     | `feature/<desc>`, `fix/<bug>` |
| Commit          | `feat(ad): new matcher` (reference issue numbers when relevant, e.g., `fix(auth): handle expired token #42`) |
| PR Requirements | Tests, Docs, Changelog        |

---

## Security & Best Practices

* Validate all external input (no trust-by-default)
* Restrict privileged operations to validated users/roles
* Log all account changes
* Review all modifications to privileged data

---

## Validation Before Commit

* All tests (`Invoke-Pester`) green
* **≥80% code coverage for all new or changed code**
* No linter/style violations
* `.Tests.ps1` and `.ps1` file pairs match
* Changelog and docs updated as needed
* **Changelog and README must be up to date and reflect all changes present in git history.**
* **If these files are missing, create and update them immediately.**

---

## Release Checklist

* Tag new version after successful validation
* Ensure CI green
* Update changelog and `.psd1` version
* Package and (optionally) publish release

---

## Performance Tips

* Use `-RunParallel` for large datasets
* Avoid concurrent modification of the same AD objects
* Use `-DryRun` for preview/testing

---

## Architecture Overview

* **SageDataParser:** Parses/caches employee data from Sage
* **ADSyncEngine:** Detects AD deltas, generates update tasks
* **MailboxHandler:** Wraps Exchange integration, error safety
* **ParallelRunner:** Manages parallel runspaces and progress

---

## Common Issues & Fixes

| Problem                 | Fix                                                        |
|-------------------------|------------------------------------------------------------|
| AD User Not Found       | Ensure unique and resolvable `SamAccountName` in target OU |
| SPN Registration Failed | Run as Domain Admin, use `setspn` manually                 |

---

## Improvement Suggestions

* Automate changelog generation from PR titles
* Add opt-in telemetry for usage analytics
* Add multi-language support for HR data imports
* Tune parallelism with dynamic throttling

---

## Resources

* [Pester Docs](https://pester.dev/)
* [PowerShell Style Guide](https://aka.ms/psstyle)
* [AD Cmdlets](https://learn.microsoft.com/en-us/powershell/module/activedirectory/)
* [Exchange Cmdlets](https://learn.microsoft.com/en-us/powershell/exchange/)
* [platyPS](https://github.com/PowerShell/platyPS)
* [GitHub Project CLI](https://cli.github.com/manual/gh_project)

---

## 📌 Example Changelog Entry

```markdown
## [0.1.3] - 2025-06-26

### Changed

- Introduced GitHub Project Automation
- Improved structure and modularity of AD sync classes
- Updated Docsify-based documentation architecture
```

---

## Important Notes

* **Build/CI-related components** are to be ignored unless explicitly asked to address them.
* Your primary task is always to optimize and evolve the **PowerShell module itself**.
* Always iterate, test, and reflect before considering the problem solved.
* **With every code or logic change, you MUST update all related documentation files.**
* **Always verify and synchronize CHANGELOG.md and README.md with git commit history, backfilling any missing details from earlier commits if required.**
* Only require 80% code coverage for newly written or changed code in scope of the current task.
* **If a related file does not exist, create and populate it according to these standards and all prior commit history.**
* Continue improving until the solution is robust, fully validated, and meets all requirements.
* The build script's `$coverageThreshold = 2` is a global baseline. New or changed code **must** still achieve ≥80% coverage.
* "User-visible" version bumps include new cmdlets, changed parameters, or different output formatting. Increment the version in `.psd1` for these cases.
* Verify docs by reviewing `git log` and ensuring README and CHANGELOG entries match the full commit history.
* Example commit messages: `feat(ad): add mailbox sync` or `fix(user): handle missing ID #42`.
* Run `Invoke-Build -Task Test` from the repository root (after `./actions_bootstrap.ps1` when dependencies are missing).
* Regenerate markdown help using `Invoke-Build CreateMarkdownHelp` before committing documentation updates.
* Avoid modifying CI pipeline or build scripts unless the issue specifically requires it.

---

[End of AGENTS.md]
