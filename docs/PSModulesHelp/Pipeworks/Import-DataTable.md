Import-DataTable
----------------

### Synopsis
Imports a datatable

---

### Description

Imports a datatable from a file on disk.  The datatable must be exported with Export-Datatable

---

### Related Links
* [Export-DataTable](Export-DataTable)

* [ConvertTo-DataTable](ConvertTo-DataTable)

---

### Examples
> EXAMPLE 1

```PowerShell
dir | Select Name, LastWriteTime, CreationTime | Export-DataTable -OutputPath $home\FileInfo.dat
Import-DataTable $home\FileInfo.dat
```

---

### Parameters
#### **FilePath**
The path to the data table.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[Object]`|true    |1       |true (ByPropertyName)|FullName|

---

### Outputs
* [Data.DataTable](https://learn.microsoft.com/en-us/dotnet/api/System.Data.DataTable)

---

### Syntax
```PowerShell
Import-DataTable [-FilePath] <Object> [<CommonParameters>]
```
