Get-GitHubIssueComment
----------------------

### Synopsis
Get the Issue comments for a given GitHub repository.

---

### Description

Get the Issue comments for a given GitHub repository.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubIssueComment -OwnerName microsoft -RepositoryName PowerShellForGitHub
Get all of the Issue comments for the microsoft\PowerShellForGitHub project.
```
> EXAMPLE 2

```PowerShell
$repo = Get-GitHubRepository -OwnerName microsoft -RepositoryName PowerShellForGitHub
$repo | Get-GitHubIssueComment -Since ([DateTime]::Now).AddDays(-1)
Get all of the Issue comments for the microsoft\PowerShellForGitHub project since yesterday.
```
> EXAMPLE 3

```PowerShell
$issue = $repo | Get-GitHubIssueComment -OwnerName microsoft -RepositoryName PowerShellForGitHub -Issue 1
Get the comments Issue #1 in the microsoft\PowerShellForGitHub project.
```
> EXAMPLE 4

```PowerShell
$repo = Get-GitHubRepository -OwnerName microsoft -RepositoryName PowerShellForGitHub
$issue = $repo | Get-GitHubIssue -Issue 1
$issue | Get-GitHubIssueComment
Get the comments Issue #1 in the microsoft\PowerShellForGitHub project.
```
> EXAMPLE 5

```PowerShell
$repo = Get-GitHubRepository -OwnerName microsoft -RepositoryName PowerShellForGitHub
$issue = $repo | Get-GitHubIssue -Issue 1
$comments = $issue | Get-GitHubIssueComment
$comment[0] | Get-GitHubIssueComment
Get the most recent comment on Issue #1 in the microsoft\PowerShellForGitHub project by
passing it in via the pipeline.  This shows some of the different types of objects you
can pipe into this function.
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

#### **Comment**
The ID of a specific comment to get. If not supplied, will return back all comments for this repository.

|Type     |Required|Position|PipelineInput        |Aliases  |
|---------|--------|--------|---------------------|---------|
|`[Int64]`|true    |named   |true (ByPropertyName)|CommentId|

#### **Issue**
Issue number to get comments for. If not supplied, will return back all comments for this repository.

|Type     |Required|Position|PipelineInput        |Aliases    |
|---------|--------|--------|---------------------|-----------|
|`[Int64]`|true    |named   |true (ByPropertyName)|IssueNumber|

#### **Since**
Only comments updated at or after this time are returned.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |false        |

#### **Sort**
How to sort the results.
Valid Values:

* Created
* Updated

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

#### **MediaType**
The format in which the API will return the body of the comment.
Raw  - Return the raw markdown body.
       Response will include body.
       This is the default if you do not pass any specific media type.
Text - Return a text only representation of the markdown body.
       Response will include body_text.
Html - Return HTML rendered from the body's markdown.
       Response will include body_html.
Full - Return raw, text and HTML representations.
       Response will include body, body_text, and body_html.
Valid Values:

* Raw
* Text
* Html
* Full

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
* GitHub.IssueComment

---

### Syntax
```PowerShell
Get-GitHubIssueComment -OwnerName <String> -RepositoryName <String> [-Since <DateTime>] [-Sort <String>] [-Direction <String>] [-MediaType <String>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubIssueComment -OwnerName <String> -RepositoryName <String> -Comment <Int64> [-MediaType <String>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubIssueComment -OwnerName <String> -RepositoryName <String> -Issue <Int64> [-Since <DateTime>] [-MediaType <String>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubIssueComment -Uri <String> -Comment <Int64> [-MediaType <String>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubIssueComment -Uri <String> -Issue <Int64> [-Since <DateTime>] [-MediaType <String>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubIssueComment -Uri <String> [-Since <DateTime>] [-Sort <String>] [-Direction <String>] [-MediaType <String>] [-AccessToken <String>] [<CommonParameters>]
```
