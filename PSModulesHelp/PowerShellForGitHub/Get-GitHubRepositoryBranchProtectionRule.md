Get-GitHubRepositoryBranchProtectionRule
----------------------------------------

### Synopsis
Retrieve branch protection rules for a given GitHub repository.

---

### Description

Retrieve branch protection rules for a given GitHub repository.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubRepositoryBranchProtectionRule -OwnerName microsoft -RepositoryName PowerShellForGitHub -BranchName master
Retrieves branch protection rules for the master branch of the PowerShellForGithub repository.
```
> EXAMPLE 2

```PowerShell
Get-GitHubRepositoryBranchProtectionRule -Uri 'https://github.com/microsoft/PowerShellForGitHub' -BranchName master
Retrieves branch protection rules for the master branch of the PowerShellForGithub repository.
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

#### **BranchName**
Name of the specific branch to be retrieved.  If not supplied, all branches will be retrieved.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

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
* GitHub.BranchProtectionRule

---

### Syntax
```PowerShell
Get-GitHubRepositoryBranchProtectionRule [-OwnerName <String>] [-RepositoryName <String>] [-BranchName] <String> [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubRepositoryBranchProtectionRule [-Uri] <String> [-BranchName] <String> [-AccessToken <String>] [<CommonParameters>]
```
