Backup-GitHubConfiguration
--------------------------

### Synopsis
Exports the user's current configuration file.

---

### Description

Exports the user's current configuration file.

This is primarily used for unit testing scenarios.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

Backup-GitHubConfiguration -Path 'c:\foo\config.json'
Writes the user's current configuration file to c:\foo\config.json.

---

### Parameters
#### **Path**
The path to store the user's current configuration file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Force**
If specified, will overwrite the contents of any file with the same name at the
location specified by Path.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---

### Syntax
```PowerShell
Backup-GitHubConfiguration [[-Path] <String>] [-Force] [-WhatIf] [-Confirm] [<CommonParameters>]
```
