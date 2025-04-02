Remove-GitHubAssignee
---------------------

### Synopsis
Removes an assignee from a GitHub issue.

---

### Description

Removes an assignee from a GitHub issue.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
$assignees = @('octocat')
Remove-GitHubAssignee -OwnerName microsoft -RepositoryName PowerShellForGitHub -Issue 1 -Assignee $assignee
Removes the specified usernames from the assignee list for Issue #1
in the microsoft\PowerShellForGitHub project.
```
> EXAMPLE 2

```PowerShell
$assignees = @('octocat')
$repo = Get-GitHubRepository -OwnerName microsoft -RepositoryName PowerShellForGitHub
$repo | Remove-GitHubAssignee -Issue 1 -Assignee $assignee
Removes the specified usernames from the assignee list for Issue #1
in the microsoft\PowerShellForGitHub project.

Will not prompt for confirmation because -Confirm:$false was specified
```
> EXAMPLE 3

```PowerShell
$assignees = @('octocat')
Get-GitHubRepository -OwnerName microsoft -RepositoryName PowerShellForGitHub |
    Get-GitHubIssue -Issue 1 |
    Remove-GitHubAssignee -Assignee $assignee
Removes the specified usernames from the assignee list for Issue #1
in the microsoft\PowerShellForGitHub project.

Will not prompt for confirmation because -Force was specified
```
> EXAMPLE 4

```PowerShell
$octocat = Get-GitHubUser -UserName 'octocat'
$octocat | Remove-GitHubAssignee -OwnerName microsoft -RepositoryName PowerShellForGitHub -Issue 1
Removes the specified usernames from the assignee list for Issue #1
in the microsoft\PowerShellForGitHub project.
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

#### **Issue**
Issue number to remove the assignees from.

|Type     |Required|Position|PipelineInput        |Aliases    |
|---------|--------|--------|---------------------|-----------|
|`[Int64]`|true    |named   |true (ByPropertyName)|IssueNumber|

#### **Assignee**
Usernames of assignees to remove from an issue.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|true    |named   |true (ByPropertyName)|UserName|

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
GitHub.ReleaseAsset
GitHub.Repository

---

### Outputs
* GitHub.Issue

---

### Notes
Only users with push access can remove assignees from an issue.
Assignees are silently ignored otherwise.

---

### Syntax
```PowerShell
Remove-GitHubAssignee [-OwnerName <String>] [-RepositoryName <String>] -Issue <Int64> -Assignee <String[]> [-Force] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Remove-GitHubAssignee -Uri <String> -Issue <Int64> -Assignee <String[]> [-Force] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
