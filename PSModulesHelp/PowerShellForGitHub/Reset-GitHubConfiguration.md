Reset-GitHubConfiguration
-------------------------

### Synopsis
Clears out the user's configuration file and configures this session with all default
configuration values.

---

### Description

Clears out the user's configuration file and configures this session with all default
configuration values.

This would be the functional equivalent of using this on a completely different computer.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Reset-GitHubConfiguration
Deletes the local configuration file and loads in all default configuration values.
```

---

### Parameters
#### **SessionOnly**
By default, this will delete the location configuration file so that all defaults are used
again.  If this is specified, then only the configuration values that were made during
this session will be discarded.

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

### Notes
This command will not clear your authentication token.
Please use Clear-GitHubAuthentication to accomplish that.

---

### Syntax
```PowerShell
Reset-GitHubConfiguration [-SessionOnly] [-WhatIf] [-Confirm] [<CommonParameters>]
```
