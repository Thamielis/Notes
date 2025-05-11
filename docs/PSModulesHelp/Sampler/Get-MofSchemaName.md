Get-MofSchemaName
-----------------

### Synopsis
Gets the Name and Friendly Name of MOF-Based resources from their Schemas.

---

### Description

This function looks within a DSC resource's .MOF schema to find the name and
friendly name of the class.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-MofSchemaName -Path Source/DSCResources/MyResource/MyResource.schema.mof
```

---

### Parameters
#### **Path**
Path to the DSC Resource Schema MOF.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|true    |1       |true (ByValue)|

---

### Outputs
* [Collections.Hashtable](https://learn.microsoft.com/en-us/dotnet/api/System.Collections.Hashtable)

---

### Syntax
```PowerShell
Get-MofSchemaName [-Path] <String> [<CommonParameters>]
```
