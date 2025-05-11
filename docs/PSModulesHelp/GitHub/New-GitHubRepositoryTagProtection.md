New-GitHubRepositoryTagProtection
---------------------------------

### Synopsis
Create a tag protection state for a repository

---

### Description

This creates a tag protection state for a repository.
This endpoint is only available to repository administrators.

---

### Examples
> EXAMPLE 1

```PowerShell
New-GitHubRepositoryTagProtection -Owner 'octocat' -Repository 'hello-world' -Pattern 'v1.*'
Creates a tag protection state for the 'hello-world' repository with the pattern 'v1.*'.
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

#### **Pattern**
An optional glob pattern to match against when enforcing tag protection.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

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
[Create a tag protection state for a repository](https://docs.github.com/rest/repos/tags#create-a-tag-protection-state-for-a-repository)

---

### Syntax
```PowerShell
New-GitHubRepositoryTagProtection [-Owner] <String> [-Repository] <String> [-Pattern] <String> [[-Context] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
