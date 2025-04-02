Get-GitHubRepositoryContributor
-------------------------------

### Synopsis
Retrieve list of contributors for a given repository.

---

### Description

Retrieve list of contributors for a given repository.

GitHub identifies contributors by author email address.
This groups contribution counts by GitHub user, which includes all associated email addresses.
To improve performance, only the first 500 author email addresses in the repository link to
GitHub users. The rest will appear as anonymous contributors without associated GitHub user
information.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubRepositoryContributor -OwnerName microsoft -RepositoryName PowerShellForGitHub
Gets a list of contributors for the PowerShellForGithub repository.
```
> EXAMPLE 2

```PowerShell
Get-GitHubRepositoryContributor -Uri 'https://github.com/PowerShell/PowerShellForGitHub' -IncludeStatistics
Gets a list of contributors for the PowerShellForGithub repository including statistics.
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

#### **IncludeAnonymousContributors**
If specified, anonymous contributors will be included in the results.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IncludeStatistics**
If specified, each result will include statistics for the number of additions, deletions
and commit counts, by week (excluding merge commits and empty commits).

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
* GitHub.Contributor
GitHub.RepositoryContributorStatistics

---

### Syntax
```PowerShell
Get-GitHubRepositoryContributor [-OwnerName <String>] [-RepositoryName <String>] [-IncludeAnonymousContributors] [-IncludeStatistics] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubRepositoryContributor -Uri <String> [-IncludeAnonymousContributors] [-IncludeStatistics] [-AccessToken <String>] [<CommonParameters>]
```
