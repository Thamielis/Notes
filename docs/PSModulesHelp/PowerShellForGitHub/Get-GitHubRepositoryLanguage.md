Get-GitHubRepositoryLanguage
----------------------------

### Synopsis
Retrieves a list of the programming languages used in a repository on GitHub.

---

### Description

Retrieves a list of the programming languages used in a repository on GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubRepositoryLanguage -OwnerName microsoft -RepositoryName PowerShellForGitHub
```
> EXAMPLE 2

```PowerShell
Get-GitHubRepositoryLanguage -Uri https://github.com/PowerShell/PowerShellForGitHub
```

---

### Parameters
#### **OwnerName**
Owner of the repository.
If not supplied here, the DefaultOwnerName configuration property value will be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **RepositoryName**
Name of the repository.
If not supplied here, the DefaultRepositoryName configuration property value will be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Uri**
Uri for the repository.
The OwnerName and RepositoryName will be extracted from here instead of needing to provide
them individually.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[String]`|true    |named   |true (ByPropertyName)|RepositoryUrl|

#### **AccessToken**
If provided, this will be used as the AccessToken for authentication with the
REST Api.  Otherwise, will attempt to use the configured value or will run unauthenticated.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Inputs
GitHub.Branch
GitHub.Content
GitHub.Event
GitHub.Issue
GitHub.IssueComment
GitHub.Label
GitHub.Milestone
GitHub.PullRequest
GitHub.Project
GitHub.ProjectCard
GitHub.ProjectColumn
GitHub.Reaction
GitHub.Release
GitHub.ReleaseAsset
GitHub.Repository

---

### Outputs
* GitHub.RepositoryLanguage - The value shown for each language is the number
of bytes of code written in that language.

---

### Syntax
```PowerShell
Get-GitHubRepositoryLanguage [-OwnerName <String>] [-RepositoryName <String>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubRepositoryLanguage -Uri <String> [-AccessToken <String>] [<CommonParameters>]
```
