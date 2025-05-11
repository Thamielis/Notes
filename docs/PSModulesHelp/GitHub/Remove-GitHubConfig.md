Remove-GitHubConfig
-------------------

### Synopsis
Remove a GitHub module configuration.

---

### Description

Remove a GitHub module configuration.

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-GitHubConfig -Name DefaultUser
Removes the 'DefaultUser' item in the GitHub module configuration.
```

---

### Parameters
#### **Name**
Set the access token type.

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
Remove-GitHubConfig [[-Name] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
