Move-GitHubProjectColumn
------------------------

### Synopsis
Move a GitHub Project Column.

---

### Description

Move a GitHub Project Column.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Move-GitHubProjectColumn -Column 999999 -First
Moves the project column with ID 999999 to the first position.
```
> EXAMPLE 2

```PowerShell
Move-GitHubProjectColumn -Column 999999 -Last
Moves the project column with ID 999999 to the Last position.
```
> EXAMPLE 3

```PowerShell
Move-GitHubProjectColumn -Column 999999 -After 888888
Moves the project column with ID 999999 to the position after column with ID 888888.
```

---

### Parameters
#### **Column**
ID of the column to move.

|Type     |Required|Position|PipelineInput        |Aliases |
|---------|--------|--------|---------------------|--------|
|`[Int64]`|true    |1       |true (ByPropertyName)|ColumnId|

#### **First**
Moves the column to be the first for the project.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Last**
Moves the column to be the last for the project.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **After**
Moves the column to the position after the column ID specified.
Must be within the same project.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int64]`|false   |2       |false        |

#### **AccessToken**
If provided, this will be used as the AccessToken for authentication with the
REST Api.  Otherwise, will attempt to use the configured value or will run unauthenticated.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

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
GitHub.ProjectColumn

---

### Syntax
```PowerShell
Move-GitHubProjectColumn [-Column] <Int64> [-First] [-Last] [[-After] <Int64>] [[-AccessToken] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
