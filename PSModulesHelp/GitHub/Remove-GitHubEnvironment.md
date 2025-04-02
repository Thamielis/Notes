Remove-GitHubEnvironment
------------------------

### Synopsis
Deletes an environment from a repository.

---

### Description

Removes a specified environment from a given repository on GitHub. This action is irreversible.
The function supports ShouldProcess for confirmation before execution.

---

### Related Links
* [https://psmodule.io/GitHub/Functions/Environments/Remove-GitHubEnvironment/](https://psmodule.io/GitHub/Functions/Environments/Remove-GitHubEnvironment/)

* [[Delete environments](https://docs.github.com/en/rest/deployments/environments?#delete-an-environment)]([Delete environments](https://docs.github.com/en/rest/deployments/environments?#delete-an-environment))

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-GitHubEnvironment -Owner 'PSModule' -Repository 'GitHub' -Name 'Production'
Deletes the 'Production' environment from the 'PSModule/GitHub' repository.
```

---

### Parameters
#### **Owner**
The name of the organization.

|Type      |Required|Position|PipelineInput        |Aliases              |
|----------|--------|--------|---------------------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|Organization<br/>User|

#### **Repository**
The name of the repository.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Name**
The name of the environment to delete.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

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
Remove-GitHubEnvironment [-Owner] <String> [-Repository] <String> [-Name] <String> [[-Context] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
