Set-GitHubEnvironmentVariable
-----------------------------

### Synopsis
Setting an environment variable

---

### Description

Set a GitHub environment variable

---

### Examples
> EXAMPLE 1

```PowerShell
Set-GitHubEnv -Name 'MyVariable' -Value 'MyValue'
```

---

### Parameters
#### **Name**
Name of the variable

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Value**
Value of the variable

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

---

### Outputs
* [Void](https://learn.microsoft.com/en-us/dotnet/api/System.Void)

---

### Notes
[Setting an environment variable](https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/workflow-commands-for-github-actions#setting-an-environment-variable)

---

### Syntax
```PowerShell
Set-GitHubEnvironmentVariable [-Name] <String> [-Value] <String> [<CommonParameters>]
```
