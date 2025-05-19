New-PSMDModuleNugetPackage
--------------------------

### Synopsis
Creates a nuget package from a PowerShell module.

---

### Description

This function will take a module and wrap it into a nuget package.
This is accomplished by creating a temporary local filesystem repository and using the PowerShellGet module to do the actual writing.

Note:
- Requires PowerShellGet module
- Dependencies must be built first to the same folder

---

### Examples
> EXAMPLE 1

```PowerShell
New-PSMDModuleNugetPackage -PackagePath 'c:\temp\package' -ModulePath .\DBOps
Packages the module stored in .\DBOps and stores the nuget file in 'c:\temp\package'
```

---

### Parameters
#### **ModulePath**
Path to the PowerShell module you are creating a Nuget package from

|Type        |Required|Position|PipelineInput                 |Aliases   |
|------------|--------|--------|------------------------------|----------|
|`[String[]]`|true    |1       |true (ByValue, ByPropertyName)|ModuleBase|

#### **PackagePath**
Path where the package file will be copied.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **EnableException**
Replaces user friendly yellow warnings with bloody red exceptions of doom!
Use this if you want the function to throw terminating errors you want to catch.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
Author: Mark Wilkinson
Editor: Friedrich Weinmann

---

### Syntax
```PowerShell
New-PSMDModuleNugetPackage [-ModulePath] <String[]> [[-PackagePath] <String>] [-EnableException] [<CommonParameters>]
```
