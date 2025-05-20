Get-PSMDAssembly
----------------

### Synopsis
Returns the assemblies currently loaded.

---

### Description

Returns the assemblies currently loaded.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-PSMDAssembly
Lists all imported libraries
```
> EXAMPLE 2

```PowerShell
Get-PSMDAsssembly -Filter "Microsoft.*"
Lists all imported libraries whose name starts with "Microsoft.".
```

---

### Parameters
#### **Filter**
Default: *
The name to filter by

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Syntax
```PowerShell
Get-PSMDAssembly [[-Filter] <String>] [<CommonParameters>]
```
