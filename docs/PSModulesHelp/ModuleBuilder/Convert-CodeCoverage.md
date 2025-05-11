Convert-CodeCoverage
--------------------

### Synopsis
Convert the file name and line numbers from Pester code coverage of "optimized" modules to the source

---

### Description

Converts the code coverage line numbers from Pester to the source file paths.
The returned file name is always the relative path stored in the module.

---

### Examples
> EXAMPLE 1

```PowerShell
Invoke-Pester .\Tests -CodeCoverage (Get-ChildItem .\Output -Filter *.psm1).FullName -PassThru |
    Convert-CodeCoverage -SourceRoot .\Source -Relative
Runs pester tests from a "Tests" subfolder against an optimized module in the "Output" folder,
piping the results through Convert-CodeCoverage to render the code coverage misses with the source paths.
```

---

### Parameters
#### **SourceRoot**
The root of the source folder (for resolving source code paths)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **InputObject**
The output of `Invoke-Pester -Pasthru`
Note: Pester doesn't apply a custom type name

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[PSObject]`|false   |2       |true (ByValue)|

---

### Syntax
```PowerShell
Convert-CodeCoverage [-SourceRoot] <String> [[-InputObject] <PSObject>] [<CommonParameters>]
```
