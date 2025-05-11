Get-Psm1SchemaName
------------------

### Synopsis
Gets the Name of composite DSC resources from their *.schema.psm1 file.

---

### Description

This function looks within a composite DSC resource's *.schema.psm1 file
to find the name and friendly name of the class.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-Psm1SchemaName -Path Source/DSCResources/MyCompositeResource/MyCompositeResource.schema.psm1
```

---

### Parameters
#### **Path**
Path to the DSC Resource *.schema.psm1 file.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|true    |1       |true (ByValue)|

---

### Outputs
* [String[]](https://learn.microsoft.com/en-us/dotnet/api/System.String[])

---

### Syntax
```PowerShell
Get-Psm1SchemaName [-Path] <String> [<CommonParameters>]
```
