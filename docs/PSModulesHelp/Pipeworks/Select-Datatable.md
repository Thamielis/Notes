Select-Datatable
----------------

### Synopsis
Selects data from an in-memory database

---

### Description

Selects data from System.Data.Datatable, which is an in-memory database

---

### Related Links
* [Update-DataTable](Update-DataTable)

* [New-DataTable](New-DataTable)

* [ConvertTo-DataTable](ConvertTo-DataTable)

* [Export-DataTable](Export-DataTable)

* [Import-DataTable](Import-DataTable)

---

### Examples
> EXAMPLE 1

```PowerShell
$dt = dir | Select Name, LastWriteTime, LastAccessTime, CreationTime |  ConvertTo-DataTable 
Select-DataTable -DataTable $dt -Sort LastWriteTime -SortOrder Descending
```

---

### Parameters
#### **DataTable**
The datatable object

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[DataTable]`|true    |1       |false        |

#### **Where**
The condition.  This can contain any normal SQL operators

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **Sort**
The sort order

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **SortOrder**
The type of sort, either ascending or descding
Valid Values:

* A
* Asc,
* Ascending
* D
* Desc
* Descending

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |4       |true (ByPropertyName)|

---

### Outputs
* [Data.DataRow](https://learn.microsoft.com/en-us/dotnet/api/System.Data.DataRow)

---

### Syntax
```PowerShell
Select-Datatable [-DataTable] <DataTable> [[-Where] <String>] [[-Sort] <String[]>] [[-SortOrder] <String[]>] [<CommonParameters>]
```
