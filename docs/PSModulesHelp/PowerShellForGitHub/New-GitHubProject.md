New-GitHubProject
-----------------

### Synopsis
Creates a new GitHub project for the given repository.

---

### Description

Creates a new GitHub project for the given repository.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
New-GitHubProject -OwnerName microsoft -RepositoryName PowerShellForGitHub -ProjectName TestProject
Creates a project called 'TestProject' for the microsoft\PowerShellForGitHub repository.
```
> EXAMPLE 2

```PowerShell
New-GitHubProject -OrganizationName Microsoft -ProjectName TestProject -Description 'This is just a test project'
Create a project for the Microsoft organization called 'TestProject' with a description.
```
> EXAMPLE 3

New-GitHubProject -Uri https://github.com/Microsoft/PowerShellForGitHub -ProjectName TestProject
Create a project for the microsoft\PowerShellForGitHub repository
using the Uri called 'TestProject'.
> EXAMPLE 4

```PowerShell
New-GitHubProject -UserProject -ProjectName 'TestProject'
Creates a project for the signed in user called 'TestProject'.
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

#### **OrganizationName**
The name of the organization to create the project under.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **UserProject**
If this switch is specified creates a project for your user.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **ProjectName**

|Type      |Required|Position|PipelineInput |Aliases|
|----------|--------|--------|--------------|-------|
|`[String]`|true    |named   |true (ByValue)|Name   |

#### **Description**
Short description for the new project.

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
* GitHub.Project

---

### Syntax
```PowerShell
New-GitHubProject -OwnerName <String> -RepositoryName <String> -ProjectName <String> [-Description <String>] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
New-GitHubProject -Uri <String> -ProjectName <String> [-Description <String>] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
New-GitHubProject -OrganizationName <String> -ProjectName <String> [-Description <String>] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
New-GitHubProject -UserProject -ProjectName <String> [-Description <String>] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
