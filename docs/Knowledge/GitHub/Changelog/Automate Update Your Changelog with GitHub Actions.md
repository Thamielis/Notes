
# Automate Update Your Changelog with GitHub Actions - DEV Community

---

## [Introduction](https://dev.to/nasrulhazim/automate-update-your-changelog-with-github-actions-5g10#introduction)

Maintaining an up-to-date changelog is essential for documenting project changes, but it can be time-consuming. Adopting **semantic versioning** and **automated changelog generation** is a great way to keep your release history organized and consistent. **Semantic versioning** follows a pattern of `major.minor.patch` (e.g., `v1.2.3`), and is widely recognized for helping developers signal the type of changes in each version:

- **Major** versions introduce breaking changes.
- **Minor** versions add backward-compatible features.
- **Patch** versions address backward-compatible bug fixes.

In this post, we’ll walk through automating changelog generation with **git-chglog** and **GitHub Actions**. By the end, you'll have a fully automated system that updates your changelog with each release, saving time and ensuring accuracy.

---

## [Step 1: Set Up git-chglog in Your Development Environment](https://dev.to/nasrulhazim/automate-update-your-changelog-with-github-actions-5g10#step-1-set-up-gitchglog-in-your-development-environment)

`git-chglog` is a command-line tool that uses your Git commit history to generate customizable changelogs. Let’s walk through the setup, starting with installing the tool and creating a configuration file.

### [1. Install git-chglog](https://dev.to/nasrulhazim/automate-update-your-changelog-with-github-actions-5g10#1-install-gitchglog)

To install `git-chglog`, follow the instructions for your operating system in the [git-chglog Installation Guide](https://github.com/git-chglog/git-chglog?tab=readme-ov-file#installation).

### [2. Initialize the Configuration](https://dev.to/nasrulhazim/automate-update-your-changelog-with-github-actions-5g10#2-initialize-the-configuration)

Once installed, initialize `git-chglog` by running:

```shell
git-chglog init
```

This creates two files:

- **`.chglog/config.yml`**: The main configuration file for customizing commit types, patterns, and sections in the changelog.
- **`CHANGELOG.tpl.md`**: The template file to format the changelog output.

### [3. Customize the Configuration](https://dev.to/nasrulhazim/automate-update-your-changelog-with-github-actions-5g10#3-customize-the-configuration)

Here’s an example of a configuration file you can use to organize commits by type and align with semantic versioning:  

```yaml
style: github
template: CHANGELOG.tpl.md
info:
  title: "CHANGELOG"
  repository_url: https://github.com/cleaniquecoders/laravel-action
options:
  commits:
  commit_groups:
  header:
    pattern: "^(\\w*)\\:\\s(.*)$"
    pattern_maps:
      - Type
      - Subject
  notes:
    keywords:
      - BREAKING CHANGE
```

With the configuration set up, you’re ready to generate your first changelog locally by running:  

```shell
git-chglog <span>-o</span> CHANGELOG.md
```

---

## [](https://dev.to/nasrulhazim/automate-update-your-changelog-with-github-actions-5g10#step-2-design-a-custom-template-for-the-changelog-optional)

The default `CHANGELOG.tpl.md` file can be customized to match your style. Here’s a simple example:  

```markdown
# Changelog

All notable changes to this project will be documented in this file.

{{ range .Versions }}
## [{{ .Tag.Name }}] - {{ datetime "2006-01-02" .Tag.Date }}
{{ range .CommitGroups -}}
### {{ .Title }}
{{ range .Commits -}}
- {{ if .Scope }}**{{ .Scope }}:** {{ end }}{{ .Subject }}
{{ end }}
{{ end -}}
{{ end -}}
```

This template structures each version by date and groups changes by commit type, such as `Features` or `Bug Fixes`. Customize this as needed!

---

## [Step 3: Automate Changelog Updates with GitHub Actions](https://dev.to/nasrulhazim/automate-update-your-changelog-with-github-actions-5g10#step-3-automate-changelog-updates-with-github-actions)

To ensure your changelog stays up-to-date with each release, let’s automate this process with GitHub Actions. This workflow will regenerate the changelog upon each new release and create a pull request if there are any changes.

### [GitHub Actions Workflow](https://dev.to/nasrulhazim/automate-update-your-changelog-with-github-actions-5g10#github-actions-workflow)

Add the following workflow to `.github/workflows/update_changelog.yml`:  

```yaml
name: "Update Changelog"

on:
  release:
    types: [published]
  workflow_dispatch:

permissions:
  contents: write
  pull-requests: write

jobs:
  update-changelog:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
        with:
          fetch-depth: 0
          ref: main

      - name: Setup git-chglog
        run: |
          CHGLOG_VERSION="0.9.1"
          curl -o git-chglog -L "https://github.com/git-chglog/git-chglog/releases/download/${CHGLOG_VERSION}/git-chglog_linux_amd64"
          chmod +x git-chglog

      - name: Generate CHANGELOG.md
        id: generate
        run: |
          rm -f CHANGELOG.md
          ./git-chglog -o CHANGELOG.md
          if git diff --quiet CHANGELOG.md; then
            echo "changes=false" >> $GITHUB_OUTPUT
          else
            echo "changes=true" >> $GITHUB_OUTPUT
          fi
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

      - name: Cleanup
        run: rm git-chglog
        if: always()

      - name: Create Pull Request
        if: steps.generate.outputs.changes == 'true'
        uses: peter-evans/create-pull-request@v4
        with:
          token: ${{ secrets.GITHUB_TOKEN }}
          commit-message: "chore: update CHANGELOG.md"
          title: "📝 Update Changelog"
          body: |
            This PR updates the CHANGELOG.md to include all releases.
            - Generated using git-chglog
            - Triggered by: ${{ github.event_name }}
            - Auto-merge enabled
          branch: update-changelog-${{ github.run_id }}
          base: main
          delete-branch: true
          labels: documentation, automated-pr

      - name: Enable Auto-merge
        if: steps.generate.outputs.changes == 'true'
        run: |
          gh pr merge --auto --merge "${{ steps.create-pr.outputs.pull-request-number }}"
        env:
          GH_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

### [Explanation of Workflow](https://dev.to/nasrulhazim/automate-update-your-changelog-with-github-actions-5g10#explanation-of-workflow)

1. **Checkout Code**: Fetches the `main` branch and its history.
2. **Setup `git-chglog`**: Downloads the tool.
3. **Generate Changelog**: Replaces `CHANGELOG.md` with a newly generated one and checks for differences. If changes are detected, sets the output `changes=true`.
4. **Cleanup**: Deletes `git-chglog`.
5. **Create Pull Request**: Opens a PR with the updated changelog if changes are detected.
6. **Enable Auto-merge**: Uses GitHub CLI to enable auto-merge for the PR.

Sample output as in my [Laravel Action CHANGELOG.md](https://github.com/cleaniquecoders/laravel-action/blob/main/CHANGELOG.md) file.

---

## [Benefits of Automating Changelog Generation](https://dev.to/nasrulhazim/automate-update-your-changelog-with-github-actions-5g10#benefits-of-automating-changelog-generation)

- **Consistent Documentation**: Every release is accurately documented.
- **Time Savings**: Automation reduces manual work, allowing you to focus on development.
- **Transparency**: A well-maintained changelog keeps contributors and users informed about project changes.

---

## [Conclusion](https://dev.to/nasrulhazim/automate-update-your-changelog-with-github-actions-5g10#conclusion)

Automating your changelog with `git-chglog` and GitHub Actions is a powerful way to maintain a structured, up-to-date record of changes. By combining it with semantic versioning, you ensure that your project’s history is both accurate and accessible. Start automating your changelog today, and enjoy the benefits of clear, consistent documentation with every release.

---
