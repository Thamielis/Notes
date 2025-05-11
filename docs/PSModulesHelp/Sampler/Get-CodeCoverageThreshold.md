Get-CodeCoverageThreshold
-------------------------

### Synopsis
Gets the CodeCoverageThreshod from Runtime parameter or from BuildInfo.

---

### Description

This function will override the CodeCoverageThreshold by the value
provided at runtime if any.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-CodeCoverageThreshold -RuntimeCodeCoverageThreshold 0
```

---

### Parameters
#### **RuntimeCodeCoverageThreshold**
Runtime value for the Pester CodeCoverageThreshold (can be $null).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **BuildInfo**
BuildInfo object as defined by the Build.yml.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[PSObject]`|false   |2       |false        |

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Syntax
```PowerShell
Get-CodeCoverageThreshold [[-RuntimeCodeCoverageThreshold] <String>] [[-BuildInfo] <PSObject>] [<CommonParameters>]
```
