Remove-GitHubRepositoryTagProtection
------------------------------------

### Synopsis
Delete a tag protection state for a repository

---

### Description

This deletes a tag protection state for a repository.
This endpoint is only available to repository administrators.

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-GitHubRepositoryTagProtection -Owner 'octocat' -Repository 'hello-world' -TagProtectionId 1
Deletes the tag protection state with the ID 1 for the 'hello-world' repository.
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

#### **TagProtectionId**
The unique identifier of the tag protection.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |3       |false        |

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
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Notes
[Delete a tag protection state for a repository](https://docs.github.com/rest/repos/tags#delete-a-tag-protection-state-for-a-repository)

---

### Syntax
```PowerShell
Remove-GitHubRepositoryTagProtection [-Owner] <String> [-Repository] <String> [-TagProtectionId] <Int32> [[-Context] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
