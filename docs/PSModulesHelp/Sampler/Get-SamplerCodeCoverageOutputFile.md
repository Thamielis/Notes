Get-SamplerCodeCoverageOutputFile
---------------------------------

### Synopsis
Resolves the CodeCoverage output file path from the project's BuildInfo.

---

### Description

When the Pester CodeCoverageOutputFile is configured in the
buildinfo (aka Build.yml), this function will expand the path
(if it contains variables), and resolve to it's absolute path if needed.

---

### Examples
> EXAMPLE 1

Get-SamplerCodeCoverageOutputFile -BuildInfo $buildInfo -PesterOuputFolder 'C:\src\MyModule\Output\testResults

---

### Parameters
#### **BuildInfo**
The BuildInfo object represented in the Build.yml.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[PSObject]`|true    |1       |false        |

#### **PesterOutputFolder**
The Pester output folder (that can be overridden at runtime).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

---

### Syntax
```PowerShell
Get-SamplerCodeCoverageOutputFile [-BuildInfo] <PSObject> [-PesterOutputFolder] <String> [<CommonParameters>]
```
