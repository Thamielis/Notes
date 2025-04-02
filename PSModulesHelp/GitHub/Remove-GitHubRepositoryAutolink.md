Remove-GitHubRepositoryAutolink
-------------------------------

### Synopsis
Delete an autolink reference from a repository

---

### Description

This deletes a single autolink reference by ID that was configured for the given repository.

Information about autolinks are only available to repository administrators.

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-GitHubRepositoryAutolink -Owner 'octocat' -Repository 'Hello-World' -AutolinkId 1
Deletes the autolink with ID 1 for the repository 'Hello-World' owned by 'octocat'.
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

#### **ID**
The unique identifier of the autolink.

|Type     |Required|Position|PipelineInput|Aliases                   |
|---------|--------|--------|-------------|--------------------------|
|`[Int32]`|true    |3       |false        |autolink_id<br/>AutolinkID|

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
[Delete an autolink reference from a repository](https://docs.github.com/rest/repos/autolinks#delete-an-autolink-reference-from-a-repository)

---

### Syntax
```PowerShell
Remove-GitHubRepositoryAutolink [-Owner] <String> [-Repository] <String> [-ID] <Int32> [[-Context] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
