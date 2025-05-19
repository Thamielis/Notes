Get-PowerShellAssemblyMetadata
------------------------------

### Synopsis
Gets the cmdlets and aliases in a dotnet assembly.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
Get-PowerShellAssemblyMetadata -Path MyModule.dll
```

---

### Parameters
#### **Path**
The assembly to inspect.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

---

### Notes
This requires the System.Reflection.MetadataLoadContext assembly to be
loaded through Add-Type. WinPS (5.1) will also need to load its deps
    System.Memory
    System.Collections.Immutable
    System.Reflection.Metadata
    System.Runtime.CompilerServices.Unsafe

https://www.nuget.org/packages/System.Reflection.MetadataLoadContext

Copyright: (c) 2024, Jordan Borean (@jborean93) <jborean93@gmail.com>
MIT License (see LICENSE or https://opensource.org/licenses/MIT)

---

### Syntax
```PowerShell
Get-PowerShellAssemblyMetadata [-Path] <String> [<CommonParameters>]
```
