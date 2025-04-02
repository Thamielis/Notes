Get-GitHubRepositoryTeamPermission
----------------------------------

### Synopsis
Retrieve team permissions for a repository on GitHub.

---

### Description

Retrieve team permissions for a repository on GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubRepositoryTeamPermission -Uri https://github.com/microsoft/PowerShellForGitHub -TeamName Devs
Gets permission for the Devs team on the microsoft/PowerShellForGitHub repository.
```
> EXAMPLE 2

```PowerShell
Get-GitHubRepositoryTeamPermission -OwnerName microsoft -RepositoryName PowerShellForGitHub -TeamName Admins
Gets permission for the Admin team on the microsoft/PowerShellForGitHub repository.
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

#### **TeamName**
The name of the team.
Note: This will be slower than querying by TeamSlug since it requires retrieving
all teams first.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **TeamSlug**
The slug (a unique key based on the team name) of the team.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

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
GitHub.Organization
GitHub.PullRequest
GitHub.Project
GitHub.ProjectCard
GitHub.ProjectColumn
GitHub.Reaction
GitHub.Release
GitHub.ReleaseAsset
GitHub.Repository
GitHub.Team

---

### Outputs
* GitHub.RepositoryTeamPermission

---

### Syntax
```PowerShell
Get-GitHubRepositoryTeamPermission [-OwnerName <String>] [-RepositoryName <String>] -TeamName <String> [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubRepositoryTeamPermission [-OwnerName <String>] [-RepositoryName <String>] -TeamSlug <String> [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubRepositoryTeamPermission -Uri <String> -TeamSlug <String> [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubRepositoryTeamPermission -Uri <String> -TeamName <String> [-AccessToken <String>] [<CommonParameters>]
```
