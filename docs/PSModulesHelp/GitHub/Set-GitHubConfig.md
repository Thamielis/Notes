Set-GitHubConfig
----------------

### Synopsis
Set a GitHub module configuration.

---

### Description

Set a GitHub module configuration.

---

### Examples
> EXAMPLE 1

```PowerShell
Set-GitHubConfig -Name DefaultUser -Value 'Octocat'
Sets the value of DefaultUser to 'Octocat' in the GitHub module configuration.
```

---

### Parameters
#### **Name**
Set the access token type.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Value**
Set the access token type.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

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
Set-GitHubConfig [[-Name] <String>] [[-Value] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
