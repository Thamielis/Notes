New-DotNetBuildGitHubWorkflow
-----------------------------

### Synopsis
Generates a GitHub Actions workflow that runs a .NET CI build.

---

### Description

Generates a GitHub Actions workflow that consumes the resuable workflow:
https://github.com/endjin/Endjin.RecommendedPractices.GitHubActions/blob/main/.github/workflows/scripted-build-pipeline.yml
to run the standard .NET build process available in this module.

---

### Examples
> EXAMPLE 1

```PowerShell
New-DotNetBuildGitHubWorkflow -Path .github/workflows/build.yml
Generates a build script in the current directory configured to build the specified solution.
```

---

### Parameters
#### **OutputPath**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Force**
When true, any existing file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
New-DotNetBuildGitHubWorkflow [[-OutputPath] <String>] [-Force] [<CommonParameters>]
```
