Get-SamplerCodeCoverageOutputFileEncoding
-----------------------------------------

### Synopsis
Returns the Configured encoding for Pester code coverage file from BuildInfo.

---

### Description

This function returns the CodeCoverageOutputFileEncoding (Pester v5+) as
configured in the BuildInfo (build.yml).

---

### Examples
> EXAMPLE 1

```PowerShell
Get-SamplerCodeCoverageOutputFileEncoding -BuildInfo $buildInfo
```

---

### Parameters
#### **BuildInfo**
Build Configuration object as defined in the Build.yml.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[PSObject]`|true    |1       |false        |

---

### Syntax
```PowerShell
Get-SamplerCodeCoverageOutputFileEncoding [-BuildInfo] <PSObject> [<CommonParameters>]
```
