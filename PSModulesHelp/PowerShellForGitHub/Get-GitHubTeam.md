Get-GitHubTeam
--------------

### Synopsis
Retrieve a team or teams within an organization or repository on GitHub.

---

### Description

Retrieve a team or teams within an organization or repository on GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubTeam -OrganizationName PowerShell
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
|`[String]`|false   |named   |true (ByPropertyName)|RepositoryUrl|

#### **OrganizationName**
The name of the organization.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **TeamName**
The name of the specific team to retrieve.
Note: This will be slower than querying by TeamSlug since it requires retrieving
all teams first.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **TeamSlug**
The slug (a unique key based on the team name) of the specific team to retrieve.

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
* GitHub.Team
GitHub.TeamSummary

---

### Syntax
```PowerShell
Get-GitHubTeam [-OwnerName <String>] [-RepositoryName <String>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubTeam [-OwnerName <String>] [-RepositoryName <String>] [-Uri <String>] [-OrganizationName <String>] -TeamName <String> [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubTeam -Uri <String> [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubTeam -OrganizationName <String> -TeamSlug <String> [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubTeam -OrganizationName <String> [-AccessToken <String>] [<CommonParameters>]
```
