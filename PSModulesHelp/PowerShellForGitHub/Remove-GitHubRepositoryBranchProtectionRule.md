Remove-GitHubRepositoryBranchProtectionRule
-------------------------------------------

### Synopsis
Remove branch protection rules from a given GitHub repository.

---

### Description

Remove branch protection rules from a given GitHub repository.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-GitHubRepositoryBranchProtectionRule -OwnerName microsoft -RepositoryName PowerShellForGitHub -BranchName master
Removes branch protection rules from the master branch of the PowerShellForGithub repository.
```
> EXAMPLE 2

```PowerShell
Removes-GitHubRepositoryBranchProtection -Uri 'https://github.com/microsoft/PowerShellForGitHub' -BranchName master
Removes branch protection rules from the master branch of the PowerShellForGithub repository.
```
> EXAMPLE 3

```PowerShell
Removes-GitHubRepositoryBranchProtection -Uri 'https://github.com/master/PowerShellForGitHub' -BranchName master -Force
Removes branch protection rules from the master branch of the PowerShellForGithub repository
without prompting for confirmation.
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

#### **BranchName**
Name of the specific branch to remove the branch protection rule from.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **Force**

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
GitHub.Repository
GitHub.Branch

---

### Outputs
* None

---

### Syntax
```PowerShell
Remove-GitHubRepositoryBranchProtectionRule [-OwnerName <String>] [-RepositoryName <String>] [-BranchName] <String> [-Force] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Remove-GitHubRepositoryBranchProtectionRule [-Uri] <String> [-BranchName] <String> [-Force] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
