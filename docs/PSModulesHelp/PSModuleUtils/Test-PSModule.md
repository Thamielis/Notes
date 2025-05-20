Test-PSModule
-------------

### Synopsis
Tests a PowerShell module using Pester.

---

### Description

Tests a PowerShell module using Pester. The function installs Pester, removes any existing module with the same name,
and runs Pester with a configuration optimized for running in a CI pipeline.

---

### Examples
> EXAMPLE 1

```PowerShell
Test-PSModule -Name 'MyModule' -SourceDirectory "$PWD/src" -Tag 'Unit'
```

---

### Parameters
#### **Name**
The name of the module.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **SourceDirectory**
The source directory of the module. Should be a nested directory that doesn't contain and build scripts.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Exclude**
The directories to exclude from testing and code coverage.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |false        |

#### **Tag**
The tag to filter tests by.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |4       |false        |

---

### Notes
N/A

---

### Syntax
```PowerShell
Test-PSModule [[-Name] <String>] [[-SourceDirectory] <String>] [[-Exclude] <String[]>] [[-Tag] <String[]>] [<CommonParameters>]
```
