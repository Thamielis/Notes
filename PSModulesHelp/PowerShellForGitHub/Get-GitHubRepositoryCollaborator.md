Get-GitHubRepositoryCollaborator
--------------------------------

### Synopsis
Retrieve list of collaborators for a given repository.

---

### Description

Retrieve list of collaborators for a given repository.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubRepositoryCollaborator -OwnerName microsoft -RepositoryName PowerShellForGitHub
Gets a list of collaborators for the PowerShellForGithub repository.
```
> EXAMPLE 2

```PowerShell
Get-GitHubRepositoryCollaborator -Uri 'https://github.com/PowerShell/PowerShellForGitHub'
Gets a list of collaborators for the PowerShellForGithub repository.
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

#### **Affiliation**
Filter collaborators returned by their affiliation. Can be one of:
   All:     All collaborators the authenticated user can see.
   Direct:  All collaborators with permissions to an organization-owned repository,
             regardless of organization membership status.
   Outside: All outside collaborators of an organization-owned repository.
Valid Values:

* All
* Direct
* Outside

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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
* GitHub.User

---

### Syntax
```PowerShell
Get-GitHubRepositoryCollaborator [-OwnerName <String>] [-RepositoryName <String>] [-Affiliation <String>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubRepositoryCollaborator -Uri <String> [-Affiliation <String>] [-AccessToken <String>] [<CommonParameters>]
```
