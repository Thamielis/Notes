New-GitHubRepositoryFromTemplate
--------------------------------

### Synopsis
Creates a new repository on GitHub from a template repository.

---

### Description

Creates a new repository on GitHub from a template repository.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
New-GitHubRepositoryFromTemplate -OwnerName MyOrg -RepositoryName MyTemplateRepo -TargetRepositoryName MyNewRepo -TargetOwnerName Me
Creates a new GitHub repository from the specified template repository.
```
> EXAMPLE 2

```PowerShell
$repo = Get-GitHubRepository -OwnerName MyOrg -RepositoryName MyTemplateRepo
$repo | New-GitHubRepositoryFromTemplate -TargetRepositoryName MyNewRepo -TargetOwnerName Me
You can also pipe in a repo that was returned from a previous command.
```

---

### Parameters
#### **OwnerName**
Owner of the template repository.
If no value is specified, the DefaultOwnerName configuration property value will be used,
and if there is no configuration value defined, the current authenticated user will be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **RepositoryName**
Name of the template repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **Uri**
Uri for the repository.
The OwnerName and RepositoryName will be extracted from here instead of needing to provide
them individually.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[String]`|true    |3       |true (ByPropertyName)|RepositoryUrl|

#### **TargetOwnerName**
The organization or person who will own the new repository.
To create a new repository in an organization, the authenticated user must be a member
of the specified organization.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |4       |false        |

#### **TargetRepositoryName**
Name of the repository to be created.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |5       |false        |

#### **Description**
A short description of the repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Private**
By default, this repository will created Public.  Specify this to create a private
repository.

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
GitHub.Release
GitHub.Repository

---

### Outputs
* GitHub.Repository

---

### Notes
The authenticated user must own or be a member of an organization that owns the repository.

To check if a repository is available to use as a template, call `Get-GitHubRepository` on the
repository in question and check that the is_template property is $true.

---

### Syntax
```PowerShell
New-GitHubRepositoryFromTemplate [-OwnerName <String>] [-RepositoryName] <String> [-TargetOwnerName] <String> [-TargetRepositoryName] <String> [-Description <String>] [-Private] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
New-GitHubRepositoryFromTemplate [-Uri] <String> [-TargetOwnerName] <String> [-TargetRepositoryName] <String> [-Description <String>] [-Private] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
