Add-GitHubAssignee
------------------

### Synopsis
Adds a list of assignees to a GitHub Issue for the given repository.

---

### Description

Adds a list of assignees to a GitHub Issue for the given repository.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

$assignees = @('octocat')
Add-GitHubAssignee -OwnerName microsoft -RepositoryName PowerShellForGitHub -Issue 1 -Assignee $assignee
Additionally assigns the usernames in $assignee to Issue #1
from the microsoft\PowerShellForGitHub project.
> EXAMPLE 2

$assignees = @('octocat')
$repo = Get-GitHubRepository -OwnerName microsoft -RepositoryName PowerShellForGitHub
$repo | Add-GitHubAssignee -Issue 1 -Assignee $assignee
Additionally assigns the usernames in $assignee to Issue #1
from the microsoft\PowerShellForGitHub project.
> EXAMPLE 3

$assignees = @('octocat')
Get-GitHubRepository -OwnerName microsoft -RepositoryName PowerShellForGitHub |
    Get-GitHubIssue -Issue 1 |
    Add-GitHubAssignee -Assignee $assignee
Additionally assigns the usernames in $assignee to Issue #1
from the microsoft\PowerShellForGitHub project.
> EXAMPLE 4

$octocat = Get-GitHubUser -UserName 'octocat'
$octocat | Add-GitHubAssignee -OwnerName microsoft -RepositoryName PowerShellForGitHub -Issue 1
Additionally assigns the user 'octocat' to Issue #1
from the microsoft\PowerShellForGitHub project.

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
Issue number to add the assignees to.

|Type     |Required|Position|PipelineInput        |Aliases    |
|---------|--------|--------|---------------------|-----------|
|`[Int64]`|true    |named   |true (ByPropertyName)|IssueNumber|

#### **Assignee**
Usernames of users to assign this issue to.
NOTE: Only users with push access can add assignees to an issue.
Assignees are silently ignored otherwise.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|true    |named   |true (ByPropertyName)|UserName|

#### **PassThru**
Returns the updated GitHub Issue.  By default, this cmdlet does not generate any output.
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
GitHub.ReleaseAsset
GitHub.Repository
GitHub.User

---

### Outputs
* GitHub.Issue

---

### Syntax
```PowerShell
Add-GitHubAssignee [-OwnerName <String>] [-RepositoryName <String>] -Issue <Int64> -Assignee <String[]> [-PassThru] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Add-GitHubAssignee -Uri <String> -Issue <Int64> -Assignee <String[]> [-PassThru] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
