Set-GitHubProject
-----------------

### Synopsis
Modify a GitHub Project.

---

### Description

Modify a GitHub Project.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Set-GitHubProject -Project 999999 -State Closed
Set the project with ID '999999' to closed.
```
> EXAMPLE 2

```PowerShell
$project = Get-GitHubProject -OwnerName microsoft -RepositoryName PowerShellForGitHub | Where-Object Name -eq 'TestProject'
Set-GitHubProject -Project $project.id -State Closed
Get the ID for the 'TestProject' project for the microsoft\PowerShellForGitHub
repository and set state to closed.
```

---

### Parameters
#### **Project**
ID of the project to modify.

|Type     |Required|Position|PipelineInput                 |Aliases  |
|---------|--------|--------|------------------------------|---------|
|`[Int64]`|true    |1       |true (ByValue, ByPropertyName)|ProjectId|

#### **Description**
Short description for the project.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **State**
Set the state of the project.
Valid Values:

* Open
* Closed

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **OrganizationPermission**
Set the permission level that determines whether all members of the project's
organization can see and/or make changes to the project.
Only available for organization projects.
Valid Values:

* Read
* Write
* Admin
* None

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **Private**
Sets the visibility of a project board.
Only available for organization and user projects.
Note: Updating a project's visibility requires admin access to the project.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PassThru**
Returns the updated Project.  By default, this cmdlet does not generate any output.
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
|`[String]`|false   |5       |false        |

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
GitHub.Release
GitHub.ReleaseAsset
GitHub.Repository

---

### Outputs
* GitHub.Project

---

### Syntax
```PowerShell
Set-GitHubProject [-Project] <Int64> [[-Description] <String>] [[-State] <String>] [[-OrganizationPermission] <String>] [-Private] [-PassThru] [[-AccessToken] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
