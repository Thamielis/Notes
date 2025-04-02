Get-GitHubRepositoryActionsPermission
-------------------------------------

### Synopsis
Gets GitHub Actions permission for a repository on GitHub.

---

### Description

Gets GitHub Actions permission for a repository on GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubRepositoryActionsPermission -OwnerName Microsoft -RepositoryName PowerShellForGitHub
Gets GitHub Actions permissions for the PowerShellForGithub repository.
```
> EXAMPLE 2

```PowerShell
Get-GitHubRepositoryActionsPermission -Uri https://github.com/PowerShell/PowerShellForGitHub
Gets GitHub Actions permissions for the PowerShellForGithub repository.
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
|`[String]`|true    |2       |true (ByPropertyName)|RepositoryUrl|

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
GitHub.Release
GitHub.Repository

---

### Outputs
* GitHub.RepositoryActionsPermission

---

### Notes
The authenticated user must have admin access to the repository.

---

### Syntax
```PowerShell
Get-GitHubRepositoryActionsPermission [-OwnerName <String>] [-RepositoryName <String>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubRepositoryActionsPermission [-Uri] <String> [-AccessToken <String>] [<CommonParameters>]
```
