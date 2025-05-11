Set-GitHubRepositoryActionsPermission
-------------------------------------

### Synopsis
Sets GitHub Actions permissions for a repository on GitHub.

---

### Description

Sets GitHub Actions permissions for a repository on GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Set-GitHubRepositoryActionsPermission -OwnerName Microsoft -RepositoryName PowerShellForGitHub -AllowedActions All
Sets GitHub Actions permissions to 'All' for the PowerShellForGithub repository.
```
> EXAMPLE 2

```PowerShell
Set-GitHubRepositoryActionsPermission -Uri https://github.com/PowerShell/PowerShellForGitHub -AllowedActions Disabled
Sets GitHub Actions permissions to 'Disabled' for the PowerShellForGithub repository.
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
|`[String]`|true    |2       |true (ByPropertyName)|RepositoryUrl|

#### **AllowedActions**
The permissions policy that controls the actions that are allowed to run.
Can be one of: 'All', 'LocalOnly', 'Selected' or 'Disabled'.
Valid Values:

* All
* LocalOnly
* Selected
* Disabled

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

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
GitHub.Release
GitHub.Repository

---

### Outputs
* None

---

### Notes
The authenticated user must have admin access to the repository.

If the repository belongs to an organization or enterprise that has set restrictive
permissions at the organization or enterprise levels, such as 'AllowedActions' to 'Selected'
actions, then you cannot override them for the repository.

---

### Syntax
```PowerShell
Set-GitHubRepositoryActionsPermission [-OwnerName <String>] [-RepositoryName <String>] -AllowedActions <String> [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Set-GitHubRepositoryActionsPermission [-Uri] <String> -AllowedActions <String> [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
