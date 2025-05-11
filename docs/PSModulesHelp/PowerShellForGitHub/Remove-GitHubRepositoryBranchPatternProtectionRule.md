Remove-GitHubRepositoryBranchPatternProtectionRule
--------------------------------------------------

### Synopsis
Remove a branch pattern protection rule from a given GitHub repository.

---

### Description

Remove a branch pattern protection rule from a given GitHub repository.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-GitHubRepositoryBranchPatternProtectionRule -OwnerName microsoft -RepositoryName PowerShellForGitHub -BranchPatternName release/**/*
Removes branch pattern 'release/**/*' protection rules from the PowerShellForGithub repository.
```
> EXAMPLE 2

```PowerShell
Remove-GitHubRepositoryBranchPatternProtectionRule -Uri 'https://github.com/microsoft/PowerShellForGitHub' -BranchPatternName release/**/*
Removes branch pattern 'release/**/*' protection rules from the PowerShellForGithub repository.
```
> EXAMPLE 3

```PowerShell
Remove-GitHubRepositoryBranchPatternProtectionRule -Uri 'https://github.com/master/PowerShellForGitHub' -BranchPatternName release/**/* -Force
Removes branch pattern 'release/**/*' protection rules from the PowerShellForGithub repository
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

#### **BranchPatternName**
Name of the specific branch protection rule pattern to remove.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

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

---

### Outputs
* None

---

### Syntax
```PowerShell
Remove-GitHubRepositoryBranchPatternProtectionRule [-OwnerName <String>] [-RepositoryName <String>] [-BranchPatternName] <String> [-Force] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Remove-GitHubRepositoryBranchPatternProtectionRule [-Uri] <String> [-BranchPatternName] <String> [-Force] [-AccessToken <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
