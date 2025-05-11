Remove-GitHubProjectCard
------------------------

### Synopsis
Removes a project card.

---

### Description

Removes a project card.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-GitHubProjectCard -Card 999999
Remove project card with ID 999999.
```
> EXAMPLE 2

```PowerShell
Remove-GitHubProjectCard -Card 999999 -Confirm:$False
Remove project card with ID 999999 without prompting for confirmation.
```
> EXAMPLE 3

```PowerShell
Remove-GitHubProjectCard -Card 999999 -Force
Remove project card with ID 999999 without prompting for confirmation.
```

---

### Parameters
#### **Card**
ID of the card to remove.

|Type     |Required|Position|PipelineInput        |Aliases|
|---------|--------|--------|---------------------|-------|
|`[Int64]`|true    |1       |true (ByPropertyName)|CardId |

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
GitHub.ProjectCard

---

### Syntax
```PowerShell
Remove-GitHubProjectCard [-Card] <Int64> [-Force] [[-AccessToken] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
