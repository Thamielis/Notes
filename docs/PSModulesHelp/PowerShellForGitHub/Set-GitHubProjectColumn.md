Set-GitHubProjectColumn
-----------------------

### Synopsis
Modify a GitHub Project Column.

---

### Description

Modify a GitHub Project Column.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Set-GitHubProjectColumn -Column 999999 -ColumnName NewColumnName
Set the project column name to 'NewColumnName' with column with ID 999999.
```

---

### Parameters
#### **Column**
ID of the column to modify.

|Type     |Required|Position|PipelineInput        |Aliases |
|---------|--------|--------|---------------------|--------|
|`[Int64]`|true    |1       |true (ByPropertyName)|ColumnId|

#### **ColumnName**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |2       |false        |Name   |

#### **PassThru**
Returns the updated Project Column.  By default, this cmdlet does not generate any output.
You can use "Set-GitHubConfiguration -DefaultPassThru" to control the default behavior
of this switch.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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

### Outputs
* GitHub.ProjectColumn

---

### Syntax
```PowerShell
Set-GitHubProjectColumn [-Column] <Int64> [-ColumnName] <String> [-PassThru] [[-AccessToken] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
