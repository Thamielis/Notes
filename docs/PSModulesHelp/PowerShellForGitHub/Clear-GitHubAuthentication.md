Clear-GitHubAuthentication
--------------------------

### Synopsis
Clears out any GitHub API token from memory, as well as from local file storage.

---

### Description

Clears out any GitHub API token from memory, as well as from local file storage.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Clear-GitHubAuthentication
Clears out any GitHub API token from memory, as well as from local file storage.
```

---

### Parameters
#### **SessionOnly**
By default, this will clear out the cache in memory, as well as in the local
configuration file.  If this switch is specified, authentication will be cleared out
in this session only -- the local configuration file cache will remain
(and thus still be available in a new PowerShell session).

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
This command will not clear your configuration settings.
Please use Reset-GitHubConfiguration to accomplish that.

---

### Syntax
```PowerShell
Clear-GitHubAuthentication [-SessionOnly] [-WhatIf] [-Confirm] [<CommonParameters>]
```
