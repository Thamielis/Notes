Remove-GitHubProject
--------------------

### Synopsis
Removes the projects for a given GitHub repository.

---

### Description

Removes the projects for a given GitHub repository.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-GitHubProject -Project 4387531
Remove project with ID '4387531'.
```
> EXAMPLE 2

```PowerShell
Remove-GitHubProject -Project 4387531 -Confirm:$false
Remove project with ID '4387531' without prompting for confirmation.
```
> EXAMPLE 3

```PowerShell
Remove-GitHubProject -Project 4387531 -Force
Remove project with ID '4387531' without prompting for confirmation.
```
> EXAMPLE 4

```PowerShell
$project = Get-GitHubProject -OwnerName microsoft -RepositoryName PowerShellForGitHub | Where-Object Name -eq 'TestProject'
Remove-GitHubProject -Project $project.id
Get the ID for the 'TestProject' project for the microsoft\PowerShellForGitHub
repository and then remove the project.
```

---

### Parameters
#### **Project**
ID of the project to remove.

|Type     |Required|Position|PipelineInput        |Aliases  |
|---------|--------|--------|---------------------|---------|
|`[Int64]`|true    |1       |true (ByPropertyName)|ProjectId|

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
|`[String]`|false   |2       |false        |

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

### Syntax
```PowerShell
Remove-GitHubProject [-Project] <Int64> [-Force] [[-AccessToken] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
