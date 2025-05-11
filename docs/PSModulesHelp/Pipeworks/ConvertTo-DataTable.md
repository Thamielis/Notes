ConvertTo-DataTable
-------------------

### Synopsis
Creates a DataTable from an object

---

### Description

Creates a DataTable from an object, containing all properties (except built-in properties from a database)

---

### Related Links
* [Select-DataTable](Select-DataTable)

* [Import-DataTable](Import-DataTable)

* [Export-Datatable](Export-Datatable)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ChildItem| Select Name, LastWriteTime | ConvertTo-DataTable
```

---

### Parameters
#### **InputObject**
The input objects

|Type          |Required|Position|PipelineInput |
|--------------|--------|--------|--------------|
|`[PSObject[]]`|true    |1       |true (ByValue)|

---

### Outputs
* [Data.DataTable](https://learn.microsoft.com/en-us/dotnet/api/System.Data.DataTable)

---

### Syntax
```PowerShell
ConvertTo-DataTable [-InputObject] <PSObject[]> [<CommonParameters>]
```
