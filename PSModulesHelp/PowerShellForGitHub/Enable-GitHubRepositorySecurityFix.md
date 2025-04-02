Enable-GitHubRepositorySecurityFix
----------------------------------

### Synopsis
Enables automated security fixes for a repository on GitHub.

---

### Description

Enables automated security fixes for a repository on GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Enable-GitHubRepositorySecurityFix -OwnerName Microsoft -RepositoryName PowerShellForGitHub
Enables automated security fixes for the PowerShellForGitHub repository.
```
> EXAMPLE 2

```PowerShell
Enable-GitHubRepositorySecurityFix -Uri https://github.com/PowerShell/PowerShellForGitHub
Enables automated security fixes for the PowerShellForGitHub repository.
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

---

### Syntax
```PowerShell
Enable-GitHubRepositorySecurityFix [-OwnerName <String>] [-RepositoryName <String>] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Enable-GitHubRepositorySecurityFix [-Uri] <String> [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
