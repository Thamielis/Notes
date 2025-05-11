Disconnect-GitHubAccount
------------------------

### Synopsis
Disconnects from GitHub and removes the GitHub context.

---

### Description

Disconnects from GitHub and removes the GitHub context.

---

### Examples
> EXAMPLE 1

```PowerShell
Disconnect-GitHubAccount
Disconnects from GitHub and removes the default GitHub context.
```
> EXAMPLE 2

```PowerShell
Disconnect-GithubAccount -Context 'github.com/Octocat'
Disconnects from GitHub and removes the context 'github.com/Octocat'.
```

---

### Parameters
#### **Silent**
Suppresses the output of the function.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |false        |Quiet  |

#### **Context**
The context to run the command with.
Can be either a string or a GitHubContext object.

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[Object[]]`|false   |1       |true (ByValue)|

---

### Outputs
* [Void](https://learn.microsoft.com/en-us/dotnet/api/System.Void)

---

### Syntax
```PowerShell
Disconnect-GitHubAccount [-Silent] [[-Context] <Object[]>] [<CommonParameters>]
```
