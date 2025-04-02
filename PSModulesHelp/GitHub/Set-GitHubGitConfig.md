Set-GitHubGitConfig
-------------------

### Synopsis
Set the Git configuration for the GitHub context.

---

### Description

Sets the Git configuration for the GitHub context. This command sets the `user.name`, `user.email`, and `url.<host>.insteadOf` git configs.

---

### Examples
> EXAMPLE 1

```PowerShell
Set-GitHubGitConfig
Sets the Git configuration for the default GitHub context.
```
> EXAMPLE 2

```PowerShell
Set-GitHubGitConfig -Context 'MyContext'
Sets the Git configuration for the GitHub context named 'MyContext'.
```

---

### Parameters
#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

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
Set-GitHubGitConfig [[-Context] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
