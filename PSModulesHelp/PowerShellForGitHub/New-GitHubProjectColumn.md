New-GitHubProjectColumn
-----------------------

### Synopsis
Creates a new column for a GitHub project.

---

### Description

Creates a new column for a GitHub project.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
New-GitHubProjectColumn -Project 999999 -ColumnName 'Done'
Creates a column called 'Done' for the project with ID 999999.
```

---

### Parameters
#### **Project**
ID of the project to create a column for.

|Type     |Required|Position|PipelineInput        |Aliases  |
|---------|--------|--------|---------------------|---------|
|`[Int64]`|true    |1       |true (ByPropertyName)|ProjectId|

#### **ColumnName**

|Type      |Required|Position|PipelineInput |Aliases|
|----------|--------|--------|--------------|-------|
|`[String]`|true    |2       |true (ByValue)|Name   |

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
[String]
GitHub.Project
GitHub.ProjectCard
GitHub.ProjectColumn

---

### Outputs
* GitHub.ProjectColumn

---

### Syntax
```PowerShell
New-GitHubProjectColumn [-Project] <Int64> [-ColumnName] <String> [[-AccessToken] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
