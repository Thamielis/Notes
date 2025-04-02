Test-GitHubAssignee
-------------------

### Synopsis
Checks if a user has permission to be assigned to an issue in this repository.

---

### Description

Checks if a user has permission to be assigned to an issue in this repository.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

Test-GitHubAssignee -OwnerName microsoft -RepositoryName PowerShellForGitHub -Assignee "LoginID123"
Checks if a user has permission to be assigned to an issue
from the microsoft\PowerShellForGitHub project.
> EXAMPLE 2

$repo = Get-GitHubRepository -OwnerName microsoft -RepositoryName PowerShellForGitHub
$repo | Test-GitHubAssignee -Assignee 'octocat'
Checks if a user has permission to be assigned to an issue
from the microsoft\PowerShellForGitHub project.
> EXAMPLE 3

$octocat = Get-GitHubUser -UserName 'octocat'
$repo = $octocat | Test-GitHubAssignee -OwnerName microsoft -RepositoryName PowerShellForGitHub
Checks if a user has permission to be assigned to an issue
from the microsoft\PowerShellForGitHub project.

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

#### **Assignee**
Username for the assignee

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|false   |named   |true (ByPropertyName)|UserName|

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
GitHub.User

---

### Outputs
* [bool]
If the assignee can be assigned to issues in the repository.

---

### Syntax
```PowerShell
Test-GitHubAssignee [-OwnerName <String>] [-RepositoryName <String>] [-Assignee <String>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Test-GitHubAssignee -Uri <String> [-Assignee <String>] [-AccessToken <String>] [<CommonParameters>]
```
