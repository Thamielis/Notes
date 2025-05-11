Get-GitHubApiVersion
--------------------

### Synopsis
Get all API versions.

---

### Description

Get all supported GitHub API versions.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubApiVersion
Get all supported GitHub API versions.
```

---

### Parameters
#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

---

### Outputs
* [String[]](https://learn.microsoft.com/en-us/dotnet/api/System.String[])

---

### Notes
[Get all API versions](https://docs.github.com/rest/meta/meta#get-all-api-versions)

---

### Syntax
```PowerShell
Get-GitHubApiVersion [[-Context] <Object>] [<CommonParameters>]
```
