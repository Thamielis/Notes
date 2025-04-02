Get-GitHubRepositoryBranchPatternProtectionRule
-----------------------------------------------

### Synopsis
Retrieve a branch pattern protection rule for a given GitHub repository.

---

### Description

Retrieve a branch pattern protection rule for a given GitHub repository.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubRepositoryBranchPatternProtectionRule -OwnerName microsoft -RepositoryName PowerShellForGitHub -BranchPatternName release/**/*
Retrieves branch protection rules for the release/**/* branch pattern of the PowerShellForGithub repository.
```
> EXAMPLE 2

```PowerShell
Get-GitHubQlRepositoryBranchPatternProtectionRule -Uri 'https://github.com/microsoft/PowerShellForGitHub' -BranchPatternName master
Retrieves branch protection rules for the master branch pattern of the PowerShellForGithub repository.
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

#### **BranchPatternName**
Name of the specific branch Pattern to be retrieved.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

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
* GitHub.BranchPatternProtectionRule

---

### Syntax
```PowerShell
Get-GitHubRepositoryBranchPatternProtectionRule [-OwnerName <String>] [-RepositoryName <String>] [[-BranchPatternName] <String>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubRepositoryBranchPatternProtectionRule [-Uri] <String> [[-BranchPatternName] <String>] [-AccessToken <String>] [<CommonParameters>]
```
