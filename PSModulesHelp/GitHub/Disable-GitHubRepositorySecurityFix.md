Disable-GitHubRepositorySecurityFix
-----------------------------------

### Synopsis
Disable automated security fixes

---

### Description

Disables automated security fixes for a repository. The authenticated user must have admin access to the repository.
For more information, see
"[Configuring automated security fixes](https://docs.github.com/articles/configuring-automated-security-fixes)".

---

### Examples
> EXAMPLE 1

```PowerShell
Disable-GitHubRepositorySecurityFix -Owner 'PSModule' -Repository 'GitHub'
Disables automated security fixes for the repository.
```

---

### Parameters
#### **Owner**
The account owner of the repository. The name is not case sensitive.

|Type      |Required|Position|PipelineInput|Aliases              |
|----------|--------|--------|-------------|---------------------|
|`[String]`|true    |1       |false        |User<br/>Organization|

#### **Repository**
The name of the repository without the .git extension. The name is not case sensitive.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

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
[Disable automated security fixes](https://docs.github.com/rest/repos/repos#disable-automated-security-fixes)

---

### Syntax
```PowerShell
Disable-GitHubRepositorySecurityFix [-Owner] <String> [-Repository] <String> [[-Context] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
