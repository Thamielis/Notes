New-DataTable
-------------

### Synopsis
Creates a new datatable

---

### Description

Creates a new datatable, with optional column information

---

### Related Links
* [Update-DataTable](Update-DataTable)

* [Select-DataTable](Select-DataTable)

---

### Examples
> EXAMPLE 1

```PowerShell
$dt = New-DataTable -ColumnName Name, Age -ColumnType ([string]), ([int]) -KeyColumn Name
New-Object PSObject -Property @{
    Name = "James"
    Age = 32
} |
    Update-Datatable $dt
```

---

### Parameters
#### **ColumnName**
The names of the columns

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **ColumnType**
The types of the columns.  
Be aware: complex types might not be serializable, and the table might not be able to be saved because of it.
To avoid this, use only simple types: 'System.Boolean', 'System.Byte[]', 'System.Byte', 'System.Char', 'System.Datetime', 'System.Decimal', 'System.Double', 'System.Guid', 'System.Int16', 'System.Int32', 'System.Int64', 'System.Single', 'System.UInt16', 'System.UInt32', 'System.UInt64'

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Type[]]`|false   |2       |true (ByPropertyName)|

#### **KeyColumn**
The names of the key columns

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

---

### Outputs
* [Data.DataTable](https://learn.microsoft.com/en-us/dotnet/api/System.Data.DataTable)

---

### Syntax
```PowerShell
New-DataTable [[-ColumnName] <String[]>] [[-ColumnType] <Type[]>] [[-KeyColumn] <String[]>] [<CommonParameters>]
```
