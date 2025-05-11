Get-GitHubRepositoryCustomProperty
----------------------------------

### Synopsis
Get all custom property values for a repository

---

### Description

Gets all custom property values that are set for a repository.
Users with read access to the repository can use this endpoint.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubRepositoryCustomProperty -Owner 'octocat' -Repository 'hello-world'
Gets all custom property values that are set for the 'hello-world' repository.
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
[Get all custom property values for a repository](https://docs.github.com/rest/repos/custom-properties#get-all-custom-property-values-for-a-repository)

---

### Syntax
```PowerShell
Get-GitHubRepositoryCustomProperty [-Owner] <String> [-Repository] <String> [[-Context] <Object>] [<CommonParameters>]
```
