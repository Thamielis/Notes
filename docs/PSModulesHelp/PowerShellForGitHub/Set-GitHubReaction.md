Set-GitHubReaction
------------------

### Synopsis
Sets a reaction of a given GitHub Issue or Pull Request.

---

### Description

Sets a reaction of a given GitHub Issue or Pull Request.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Set-GitHubReaction -OwnerName PowerShell -RepositoryName PowerShell -Issue 12626 -ReactionType rocket
Sets the 'rocket' reaction for issue 12626 of the PowerShell\PowerShell project.
```
> EXAMPLE 2

Get-GitHubPullRequest -Uri https://github.com/microsoft/PowerShellForGitHub -PullRequest 193 | Set-GitHubReaction -ReactionType Heart
Gets a GitHub pull request and pipes it into Set-GitHubReaction to set the
'heart' reaction for that pull request.

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
The type of reaction you want to set. This is aslo called the 'content' in the GitHub API.
Valid options are based off: https://developer.github.com/v3/reactions/#reaction-types
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
|`[String]`|true    |named   |false        |

#### **PassThru**
Returns the updated Reaction.  By default, this cmdlet does not generate any output.
You can use "Set-GitHubConfiguration -DefaultPassThru" to control the default behavior
of this switch.

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
Set-GitHubReaction -OwnerName <String> -RepositoryName <String> -Issue <Int64> -ReactionType <String> [-PassThru] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Set-GitHubReaction -OwnerName <String> -RepositoryName <String> -PullRequest <Int64> -ReactionType <String> [-PassThru] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Set-GitHubReaction -Uri <String> -PullRequest <Int64> -ReactionType <String> [-PassThru] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Set-GitHubReaction -Uri <String> -Issue <Int64> -ReactionType <String> [-PassThru] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
