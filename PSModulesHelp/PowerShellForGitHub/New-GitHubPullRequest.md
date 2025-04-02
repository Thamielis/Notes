New-GitHubPullRequest
---------------------

### Synopsis
Create a new pull request in the specified repository.

---

### Description

Opens a new pull request from the given branch into the given branch
in the specified repository.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
$prParams = @{
    OwnerName = 'Microsoft'
    Repository = 'PowerShellForGitHub'
    Title = 'Add simple file to root'
    Head = 'octocat:simple-file'
    Base = 'master'
    Body = "Adds a simple text file to the repository root.`n`nThis is an automated PR!"
    MaintainerCanModify = $true
}
$pr = New-GitHubPullRequest @prParams
```
> EXAMPLE 2

```PowerShell
New-GitHubPullRequest -Uri 'https://github.com/PowerShell/PSScriptAnalyzer' -Title 'Add test' -Head simple-test -HeadOwner octocat -Base development -Draft -MaintainerCanModify
```
> EXAMPLE 3

```PowerShell
New-GitHubPullRequest -Uri 'https://github.com/PowerShell/PSScriptAnalyzer' -Issue 642 -Head simple-test -HeadOwner octocat -Base development -Draft
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
The title of the pull request to be created.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Body**
The text description of the pull request.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Issue**
The GitHub issue number to open the pull request to address.

|Type     |Required|Position|PipelineInput        |Aliases    |
|---------|--------|--------|---------------------|-----------|
|`[Int64]`|true    |named   |true (ByPropertyName)|IssueNumber|

#### **Head**
The name of the head branch (the branch containing the changes to be merged).
May also include the name of the owner fork, in the form "${fork}:${branch}".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Base**
The name of the target branch of the pull request
(where the changes in the head will be merged to).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **HeadOwner**
The name of fork that the change is coming from.
Used as the prefix of $Head parameter in the form "${HeadOwner}:${Head}".
If unspecified, the unprefixed branch name is used,
creating a pull request from the $OwnerName fork of the repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **MaintainerCanModify**
If set, allows repository maintainers to commit changes to the
head branch of this pull request.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Draft**
If set, opens the pull request as a draft.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
* GitHub.PullRequest

---

### Syntax
```PowerShell
New-GitHubPullRequest [-OwnerName <String>] [-RepositoryName <String>] -Title <String> [-Body <String>] -Head <String> -Base <String> [-HeadOwner <String>] [-MaintainerCanModify] [-Draft] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
New-GitHubPullRequest [-OwnerName <String>] [-RepositoryName <String>] -Issue <Int64> -Head <String> -Base <String> [-HeadOwner <String>] [-MaintainerCanModify] [-Draft] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
New-GitHubPullRequest -Uri <String> -Issue <Int64> -Head <String> -Base <String> [-HeadOwner <String>] [-MaintainerCanModify] [-Draft] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
New-GitHubPullRequest -Uri <String> -Title <String> [-Body <String>] -Head <String> -Base <String> [-HeadOwner <String>] [-MaintainerCanModify] [-Draft] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
