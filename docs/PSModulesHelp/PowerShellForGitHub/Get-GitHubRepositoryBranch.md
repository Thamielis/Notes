Get-GitHubRepositoryBranch
--------------------------

### Synopsis
Retrieve branches for a given GitHub repository.

---

### Description

Retrieve branches for a given GitHub repository.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubRepositoryBranch -OwnerName microsoft -RepositoryName PowerShellForGitHub
Gets all branches for the specified repository.
```
> EXAMPLE 2

```PowerShell
$repo = Get-GitHubRepository -OwnerName microsoft -RepositoryName PowerShellForGitHub
$repo | Get-GitHubRepositoryBranch
Gets all branches for the specified repository.
```
> EXAMPLE 3

```PowerShell
Get-GitHubRepositoryBranch -Uri 'https://github.com/PowerShell/PowerShellForGitHub' -BranchName master
Gets information only on the master branch for the specified repository.
```
> EXAMPLE 4

```PowerShell
$repo = Get-GitHubRepository -OwnerName microsoft -RepositoryName PowerShellForGitHub
$repo | Get-GitHubRepositoryBranch -BranchName master
Gets information only on the master branch for the specified repository.
```
> EXAMPLE 5

```PowerShell
$repo = Get-GitHubRepository -OwnerName microsoft -RepositoryName PowerShellForGitHub
$branch = $repo | Get-GitHubRepositoryBranch -BranchName master
$branch | Get-GitHubRepositoryBranch
Gets information only on the master branch for the specified repository, and then does it
again.  This tries to show some of the different types of objects you can pipe into this
function.
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

#### **BranchName**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **ProtectedOnly**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
* GitHub.Branch
List of branches within the given repository.

---

### Syntax
```PowerShell
Get-GitHubRepositoryBranch [-OwnerName <String>] [-RepositoryName <String>] [-BranchName <String>] [-ProtectedOnly] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubRepositoryBranch -Uri <String> [-BranchName <String>] [-ProtectedOnly] [-AccessToken <String>] [<CommonParameters>]
```
