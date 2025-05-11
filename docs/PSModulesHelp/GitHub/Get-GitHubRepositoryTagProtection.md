Get-GitHubRepositoryTagProtection
---------------------------------

### Synopsis
List tag protection states for a repository

---

### Description

This returns the tag protection states of a repository.

This information is only available to repository administrators.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubRepositoryTagProtection -Owner 'octocat' -Repository 'hello-world'
Gets the tag protection states of the 'hello-world' repository.
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

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Notes
[List tag protection states for a repository](https://docs.github.com/rest/repos/tags#list-tag-protection-states-for-a-repository)

---

### Syntax
```PowerShell
Get-GitHubRepositoryTagProtection [-Owner] <String> [-Repository] <String> [[-Context] <Object>] [<CommonParameters>]
```
