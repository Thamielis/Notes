Set-GitHubRepositoryTopic
-------------------------

### Synopsis
Replace all repository topics

---

### Description

Replace all repository topics

---

### Examples
> EXAMPLE 1

```PowerShell
Set-GitHubRepositoryTopic -Owner 'octocat' -Repository 'hello-world' -Names 'octocat', 'octo', 'octocat/hello-world'
Replaces all topics for the repository 'octocat/hello-world' with the topics 'octocat', 'octo', 'octocat/hello-world'.
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

#### **Names**
The number of results per page (max 100).

|Type        |Required|Position|PipelineInput|Aliases|
|------------|--------|--------|-------------|-------|
|`[String[]]`|false   |3       |false        |Topics |

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

### Notes
[Replace all repository topics](https://docs.github.com/rest/repos/repos#replace-all-repository-topics)

---

### Syntax
```PowerShell
Set-GitHubRepositoryTopic [-Owner] <String> [-Repository] <String> [[-Names] <String[]>] [[-Context] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
