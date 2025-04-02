Get-GitHubRepoBranch
--------------------

### Synopsis
List branches

---

### Description

Lists all branches from a repository

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubRepoBranch -Owner 'octocat' -Repository 'Hello-World'
Gets all the branches from the 'Hello-World' repository owned by 'octocat'
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

---

### Notes
[List branches](https://docs.github.com/rest/branches/branches#list-branches)

---

### Syntax
```PowerShell
Get-GitHubRepoBranch [-Owner] <String> [-Repository] <String> [[-Context] <Object>] [<CommonParameters>]
```
