Get-GitHubMilestone
-------------------

### Synopsis
Get the milestones for a given GitHub repository.

---

### Description

Get the milestones for a given GitHub repository.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubMilestone -OwnerName microsoft -RepositoryName PowerShellForGitHub
Get the milestones for the microsoft\PowerShellForGitHub project.
```
> EXAMPLE 2

```PowerShell
Get-GitHubMilestone -Uri 'https://github.com/PowerShell/PowerShellForGitHub' -Milestone 1
Get milestone number 1 for the microsoft\PowerShellForGitHub project.
```

---

### Parameters
#### **OwnerName**
Owner of the repository.
If not supplied here, the DefaultOwnerName configuration property value will be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **RepositoryName**
Name of the repository.
If not supplied here, the DefaultRepositoryName configuration property value will be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Uri**
Uri for the repository.
The OwnerName and RepositoryName will be extracted from here instead of needing to provide
them individually.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[String]`|true    |named   |true (ByPropertyName)|RepositoryUrl|

#### **Milestone**
The number of a specific milestone to get. If not supplied, will return back all milestones
for this repository.

|Type     |Required|Position|PipelineInput                 |Aliases        |
|---------|--------|--------|------------------------------|---------------|
|`[Int64]`|true    |named   |true (ByValue, ByPropertyName)|MilestoneNumber|

#### **State**
Only milestones with this state are returned.
Valid Values:

* Open
* Closed
* All

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Sort**
How to sort the results.
Valid Values:

* DueOn
* Completeness

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Direction**
How to list the results. Ignored without the sort parameter.
Valid Values:

* Ascending
* Descending

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
* GitHub.Milestone

---

### Syntax
```PowerShell
Get-GitHubMilestone -OwnerName <String> -RepositoryName <String> [-State <String>] [-Sort <String>] [-Direction <String>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubMilestone -OwnerName <String> -RepositoryName <String> -Milestone <Int64> [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubMilestone -Uri <String> [-State <String>] [-Sort <String>] [-Direction <String>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubMilestone -Uri <String> -Milestone <Int64> [-AccessToken <String>] [<CommonParameters>]
```
