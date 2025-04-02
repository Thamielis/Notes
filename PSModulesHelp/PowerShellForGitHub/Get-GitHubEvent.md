Get-GitHubEvent
---------------

### Synopsis
Lists events for an issue, repository, or a single event.

---

### Description

Lists events for an issue, repository, or a single event.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubEvent -OwnerName microsoft -RepositoryName PowerShellForGitHub
Get the events for the microsoft\PowerShellForGitHub project.
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

#### **EventId**
The ID of a specific event to get.
If not supplied, will return back all events for this repository.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|true    |named   |true (ByPropertyName)|

#### **Issue**
Issue number to get events for.
If not supplied, will return back all events for this repository.

|Type     |Required|Position|PipelineInput        |Aliases    |
|---------|--------|--------|---------------------|-----------|
|`[Int64]`|true    |named   |true (ByPropertyName)|IssueNumber|

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
* GitHub.Event

---

### Syntax
```PowerShell
Get-GitHubEvent -OwnerName <String> -RepositoryName <String> [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubEvent -OwnerName <String> -RepositoryName <String> -EventId <Int64> [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubEvent -OwnerName <String> -RepositoryName <String> -Issue <Int64> [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubEvent -Uri <String> -EventId <Int64> [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubEvent -Uri <String> -Issue <Int64> [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubEvent -Uri <String> [-AccessToken <String>] [<CommonParameters>]
```
