New-GitHubIssue
---------------

### Synopsis
Create a new Issue on GitHub.

---

### Description

Create a new Issue on GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
New-GitHubIssue -OwnerName microsoft -RepositoryName PowerShellForGitHub -Title 'Test Issue'
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

#### **Title**
The title of the issue

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Body**
The contents of the issue

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Assignee**
Login(s) for Users to assign to the issue.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Milestone**
The number of the milestone to associate this issue with.

|Type     |Required|Position|PipelineInput        |Aliases        |
|---------|--------|--------|---------------------|---------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|MilestoneNumber|

#### **Label**
Label(s) to associate with this issue.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **MediaType**
The format in which the API will return the body of the issue.
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

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

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
* GitHub.Issue

---

### Syntax
```PowerShell
New-GitHubIssue [-OwnerName <String>] [-RepositoryName <String>] -Title <String> [-Body <String>] [-Assignee <String[]>] [-Milestone <Int64>] [-Label <String[]>] [-MediaType <String>] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
New-GitHubIssue -Uri <String> -Title <String> [-Body <String>] [-Assignee <String[]>] [-Milestone <Int64>] [-Label <String[]>] [-MediaType <String>] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
