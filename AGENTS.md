# Repo Instructions

- Run `pwsh -NoProfile -Command "Invoke-Pester -Output Detailed"` before committing changes to ensure tests pass.
- Use four spaces for indentation in PowerShell scripts.
- All documentation links must be relative and use forward slashes.
- Index files under `docs` must list every markdown file in their folder. Use the file name as the link label and paths relative to the `docs` root (see commit 99253c70).
- The markdown link validation tests check that all links in index files exist and report the percentage of markdown files that are referenced. Missing references are printed but do not fail the tests.
- When adding documentation, update the corresponding `index.md` so coverage remains high.
