Get-GitHubViewer
----------------

### Synopsis
Gets the currently authenticated user.

---

### Description

Gets the currently authenticated user.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GithubViewer
Gets the currently authenticated user.
```

---

### Parameters
#### **Fields**
The fields to return.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

---

### Notes
[GraphQL API - Queries - Viewer](https://docs.github.com/en/graphql/reference/queries#viewer)

---

### Syntax
```PowerShell
Get-GitHubViewer [[-Fields] <String[]>] [[-Context] <Object>] [<CommonParameters>]
```
