Set-GitHubDefaultContext
------------------------

### Synopsis
Set the default context.

---

### Description

Set the default context for the GitHub module.

---

### Examples
> EXAMPLE 1

```PowerShell
Set-GitHubDefaultContext -Context 'github.com/Octocat'
```

---

### Parameters
#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Object]`|false   |1       |true (ByValue)|

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
Set-GitHubDefaultContext [[-Context] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
