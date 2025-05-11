Update-DataTable
----------------

### Synopsis
Updates a datatable

---

### Description

Updates data within a datatable, or adds new rows

---

### Related Links
* [New-DataTable](New-DataTable)

---

### Examples
> EXAMPLE 1

```PowerShell
$dt = New-DataTable -ColumnName Name, Age -ColumnType [string], [int] -KeyColumn Name
New-Object PSObject -Property @{
    Name = "James"
    Age = 32
} |
    Update-Datatable $dt
```

---

### Parameters
#### **InputObject**
The data to add to the data table

|Type          |Required|Position|PipelineInput |
|--------------|--------|--------|--------------|
|`[PSObject[]]`|true    |named   |true (ByValue)|

#### **DataTable**
The datatable that will be updated

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[DataTable]`|true    |1       |false        |

#### **PassThru**
If set, will return the row added to the datatable

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Force**
If set, will add columns to the table if they are not found

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Merge**
If set, will merge the found in a new record into the row.  If not set, the row will be deleted and re-added.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* [Data.DataRow](https://learn.microsoft.com/en-us/dotnet/api/System.Data.DataRow)

* [Nullable](https://learn.microsoft.com/en-us/dotnet/api/System.Nullable)

---

### Syntax
```PowerShell
Update-DataTable -InputObject <PSObject[]> [-DataTable] <DataTable> [-PassThru] [-Force] [-Merge] [<CommonParameters>]
```
