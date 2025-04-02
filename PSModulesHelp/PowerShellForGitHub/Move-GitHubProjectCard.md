Move-GitHubProjectCard
----------------------

### Synopsis
Move a GitHub Project Card.

---

### Description

Move a GitHub Project Card.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Move-GitHubProjectCard -Card 999999 -Top
Moves the project card with ID 999999 to the top of the column.
```
> EXAMPLE 2

```PowerShell
Move-GitHubProjectCard -Card 999999 -Bottom
Moves the project card with ID 999999 to the bottom of the column.
```
> EXAMPLE 3

```PowerShell
Move-GitHubProjectCard -Card 999999 -After 888888
Moves the project card with ID 999999 to the position after the card ID 888888.
Within the same column.
```
> EXAMPLE 4

```PowerShell
Move-GitHubProjectCard -Card 999999 -After 888888 -Column 123456
Moves the project card with ID 999999 to the position after the card ID 888888, in
the column with ID 123456.
```

---

### Parameters
#### **Card**
ID of the card to move.

|Type     |Required|Position|PipelineInput        |Aliases|
|---------|--------|--------|---------------------|-------|
|`[Int64]`|true    |1       |true (ByPropertyName)|CardId |

#### **Top**
Moves the card to the top of the column.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Bottom**
Moves the card to the bottom of the column.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **After**
Moves the card to the position after the card ID specified.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int64]`|false   |2       |false        |

#### **Column**
The ID of a column in the same project to move the card to.

|Type     |Required|Position|PipelineInput        |Aliases |
|---------|--------|--------|---------------------|--------|
|`[Int64]`|false   |3       |true (ByPropertyName)|ColumnId|

#### **AccessToken**
If provided, this will be used as the AccessToken for authentication with the
REST Api.  Otherwise, will attempt to use the configured value or will run unauthenticated.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

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
Move-GitHubProjectCard [-Card] <Int64> [-Top] [-Bottom] [[-After] <Int64>] [[-Column] <Int64>] [[-AccessToken] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
