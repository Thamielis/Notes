Get-GitHubConfig
----------------

### Synopsis
Get a GitHub module configuration.

---

### Description

Get a GitHub module configuration.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubConfig -Name DefaultContext
Get the DefaultContext value from the GitHub module configuration.
```

---

### Parameters
#### **Name**
The name of the configuration to get.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

* GitHubConfig

---

### Syntax
```PowerShell
Get-GitHubConfig [[-Name] <String>] [<CommonParameters>]
```
