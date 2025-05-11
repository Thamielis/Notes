Reset-GitHubConfig
------------------

### Synopsis
Re-initializes the GitHub module configuration.

---

### Description

Re-initializes the GitHub module configuration.

---

### Examples
> EXAMPLE 1

```PowerShell
Reset-GitHubConfig
Re-initializes the GitHub module configuration.
```

---

### Parameters
#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---

### Outputs
* [Void](https://learn.microsoft.com/en-us/dotnet/api/System.Void)

---

### Syntax
```PowerShell
Reset-GitHubConfig [-WhatIf] [-Confirm] [<CommonParameters>]
```
