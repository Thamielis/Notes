Get-GitHubReaction
------------------

### Synopsis
Retrieve reactions of a given GitHub Issue or Pull Request.

---

### Description

Retrieve reactions of a given GitHub Issue or Pull Request.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubReaction -OwnerName Microsoft -RepositoryName PowerShellForGitHub -Issue 157
Gets the reactions for issue 157 from the Microsoft\PowerShellForGitHub
project.
```
> EXAMPLE 2

```PowerShell
Get-GitHubReaction -OwnerName Microsoft -RepositoryName PowerShellForGitHub -Issue 157 -ReactionType eyes
Gets the 'eyes' reactions for issue 157 from the Microsoft\PowerShellForGitHub
project.
```
> EXAMPLE 3

```PowerShell
Get-GitHubIssue -OwnerName Microsoft -RepositoryName PowerShellForGitHub -Issue 157 | Get-GitHubReaction
Gets a GitHub issue and pipe it into Get-GitHubReaction to get all
the reactions for that issue.
```
> EXAMPLE 4

```PowerShell
Get-GitHubPullRequest -Uri https://github.com/microsoft/PowerShellForGitHub -PullRequest 193 | Get-GitHubReaction
Gets a GitHub pull request and pipes it into Get-GitHubReaction
to get all the reactions for that pull request.
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

#### **Issue**
The issue number.

|Type     |Required|Position|PipelineInput        |Aliases    |
|---------|--------|--------|---------------------|-----------|
|`[Int64]`|true    |named   |true (ByPropertyName)|IssueNumber|

#### **PullRequest**
The pull request number.

|Type     |Required|Position|PipelineInput        |Aliases          |
|---------|--------|--------|---------------------|-----------------|
|`[Int64]`|true    |named   |true (ByPropertyName)|PullRequestNumber|

#### **ReactionType**
The type of reaction you want to retrieve. This is also called the 'content' in
the GitHub API. Valid options are based off:
https://developer.github.com/v3/reactions/#reaction-types
Valid Values:

* +1
* -1
* Laugh
* Confused
* Heart
* Hooray
* Rocket
* Eyes

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AccessToken**
If provided, this will be used as the AccessToken for authentication with the
REST Api. Otherwise, will attempt to use the configured value or will run
unauthenticated.

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
GitHub.Repository

---

### Outputs
* GitHub.Reaction

---

### Notes
Currently, issue comments, pull request comments and commit comments are not supported.

---

### Syntax
```PowerShell
Get-GitHubReaction -OwnerName <String> -RepositoryName <String> -Issue <Int64> [-ReactionType <String>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubReaction -OwnerName <String> -RepositoryName <String> -PullRequest <Int64> [-ReactionType <String>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubReaction -Uri <String> -PullRequest <Int64> [-ReactionType <String>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubReaction -Uri <String> -Issue <Int64> [-ReactionType <String>] [-AccessToken <String>] [<CommonParameters>]
```
