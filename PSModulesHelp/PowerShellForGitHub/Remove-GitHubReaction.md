Remove-GitHubReaction
---------------------

### Synopsis
Removes a reaction on a given GitHub Issue or Pull Request.

---

### Description

Removes a reaction on a given GitHub Issue or Pull Request.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-GitHubReaction -OwnerName PowerShell -RepositoryName PowerShell -Issue 12626 `
    -ReactionId 1234
Remove a reaction by Id on Issue 12626 from the PowerShell\PowerShell project
interactively.
```
> EXAMPLE 2

```PowerShell
Remove-GitHubReaction -OwnerName PowerShell -RepositoryName PowerShell -Issue 12626 -ReactionId 1234 -Confirm:$false
Remove a reaction by Id on Issue 12626 from the PowerShell\PowerShell project
non-interactively.
```
> EXAMPLE 3

```PowerShell
Get-GitHubReaction -OwnerName PowerShell -RepositoryName PowerShell -Issue 12626 -ReactionType rocket | Remove-GitHubReaction -Confirm:$false
Gets a reaction using Get-GitHubReaction and pipes it into Remove-GitHubReaction.
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

#### **ReactionId**
The Id of the reaction. You can get this from using Get-GitHubReaction.

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[Int64]`|true    |named   |true (ByValue, ByPropertyName)|

#### **Force**
If this switch is specified, you will not be prompted for confirmation of command execution.

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
* None

---

### Notes
Currently, issue comments, pull request comments and commit comments are not supported.

---

### Syntax
```PowerShell
Remove-GitHubReaction -OwnerName <String> -RepositoryName <String> -Issue <Int64> -ReactionId <Int64> [-Force] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Remove-GitHubReaction -OwnerName <String> -RepositoryName <String> -PullRequest <Int64> -ReactionId <Int64> [-Force] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Remove-GitHubReaction -Uri <String> -PullRequest <Int64> -ReactionId <Int64> [-Force] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Remove-GitHubReaction -Uri <String> -Issue <Int64> -ReactionId <Int64> [-Force] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
