Get-GitHubRepositoryTopic
-------------------------

### Synopsis
Get all repository topics

---

### Description

Get all repository topics

---

### Examples
> EXAMPLE 1

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

#### **PerPage**
The number of results per page (max 100).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |3       |false        |

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

---

### Notes
[Get all repository topics](https://docs.github.com/rest/repos/repos#get-all-repository-topics)

---

### Syntax
```PowerShell
Get-GitHubRepositoryTopic [-Owner] <String> [-Repository] <String> [[-PerPage] <Int32>] [[-Context] <Object>] [<CommonParameters>]
```
