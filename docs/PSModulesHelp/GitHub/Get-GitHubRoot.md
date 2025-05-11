Get-GitHubRoot
--------------

### Synopsis
GitHub API Root.

---

### Description

Get Hypermedia links to resources accessible in GitHub's REST API.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubRoot
Get the root endpoint for the GitHub API.
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

### Notes
[GitHub API Root](https://docs.github.com/rest/meta/meta#github-api-root)

---

### Syntax
```PowerShell
Get-GitHubRoot [[-Context] <Object>] [<CommonParameters>]
```
