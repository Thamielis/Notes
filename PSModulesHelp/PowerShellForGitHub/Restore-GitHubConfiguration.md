Restore-GitHubConfiguration
---------------------------

### Synopsis
Sets the specified file to be the user's configuration file.

---

### Description

Sets the specified file to be the user's configuration file.

This is primarily used for unit testing scenarios.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

Restore-GitHubConfiguration -Path 'c:\foo\config.json'
Makes the contents of c:\foo\config.json be the user's configuration for the module.

---

### Parameters
#### **Path**
The path to store the user's current configuration file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

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
Restore-GitHubConfiguration [[-Path] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
