Get-GitHubGitConfig
-------------------

### Synopsis
Gets the global Git configuration.

---

### Description

Gets the global Git configuration.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubGitConfig
Gets the global Git configuration.
```

---

### Parameters
#### **Scope**

Valid Values:

* local
* global
* system

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Outputs
* [Object[]](https://learn.microsoft.com/en-us/dotnet/api/System.Object[])

---

### Syntax
```PowerShell
Get-GitHubGitConfig [[-Scope] <String>] [<CommonParameters>]
```
