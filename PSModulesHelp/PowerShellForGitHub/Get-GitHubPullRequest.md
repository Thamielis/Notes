Get-GitHubPullRequest
---------------------

### Synopsis
Retrieve the pull requests in the specified repository.

---

### Description

Retrieve the pull requests in the specified repository.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
$pullRequests = Get-GitHubPullRequest -Uri 'https://github.com/PowerShell/PowerShellForGitHub'
```
> EXAMPLE 2

```PowerShell
$pullRequests = Get-GitHubPullRequest -OwnerName microsoft -RepositoryName PowerShellForGitHub -State Closed
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

#### **PullRequest**
The specific pull request id to return back.  If not supplied, will return back all
pull requests for the specified Repository.

|Type     |Required|Position|PipelineInput                 |Aliases          |
|---------|--------|--------|------------------------------|-----------------|
|`[Int64]`|false   |named   |true (ByValue, ByPropertyName)|PullRequestNumber|

#### **State**
The state of the pull requests that should be returned back.
Valid Values:

* Open
* Closed
* All

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Head**
Filter pulls by head user and branch name in the format of 'user:ref-name'

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Base**
Base branch name to filter the pulls by.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Sort**
What to sort the results by.
* created
* updated
* popularity (comment count)
* long-running (age, filtering by pulls updated in the last month)
Valid Values:

* Created
* Updated
* Popularity
* LongRunning

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Direction**
The direction to be used for Sort.
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
* GitHub.PulLRequest

---

### Syntax
```PowerShell
Get-GitHubPullRequest [-OwnerName <String>] [-RepositoryName <String>] [-PullRequest <Int64>] [-State <String>] [-Head <String>] [-Base <String>] [-Sort <String>] [-Direction <String>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubPullRequest -Uri <String> [-PullRequest <Int64>] [-State <String>] [-Head <String>] [-Base <String>] [-Sort <String>] [-Direction <String>] [-AccessToken <String>] [<CommonParameters>]
```
