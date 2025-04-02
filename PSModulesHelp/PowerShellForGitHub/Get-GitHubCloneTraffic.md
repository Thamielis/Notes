Get-GitHubCloneTraffic
----------------------

### Synopsis
Get the total number of clones and breakdown per day or week for the last 14 days for the
given GitHub Repository.

---

### Description

Get the total number of clones and breakdown per day or week for the last 14 days.
Timestamps are aligned to UTC midnight of the beginning of the day or week.
Week begins on Monday.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

Get-GitHubCloneTraffic -OwnerName microsoft -RepositoryName PowerShellForGitHub
Get the total number of clones and breakdown per day or week for the last 14 days
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

#### **Per**
The interval at which return to return the view counts.
Valid Values:

* Day
* Week

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
* GitHub.CloneTraffic

---

### Syntax
```PowerShell
Get-GitHubCloneTraffic [-OwnerName <String>] [-RepositoryName <String>] [-Per <String>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubCloneTraffic -Uri <String> [-Per <String>] [-AccessToken <String>] [<CommonParameters>]
```
