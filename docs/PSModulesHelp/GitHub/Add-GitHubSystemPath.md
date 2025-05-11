Add-GitHubSystemPath
--------------------

### Synopsis
Adds a system path to the GitHub Actions environment

---

### Description

Prepends a directory to the system PATH variable and automatically makes it available to all subsequent actions in the current job;
the currently running action cannot access the updated path variable. To see the currently defined paths for your job, you can use
echo "$env:PATH" in a step or an action.

---

### Examples
> EXAMPLE 1

```PowerShell
Add-GitHubSystemPath -Path '$HOME/.local/bin'
```

---

### Parameters
#### **Path**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Outputs
* [Void](https://learn.microsoft.com/en-us/dotnet/api/System.Void)

---

### Notes
[Adding a system path](https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/workflow-commands-for-github-actions#adding-a-system-path)

---

### Syntax
```PowerShell
Add-GitHubSystemPath [[-Path] <String>] [<CommonParameters>]
```
