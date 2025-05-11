Export-DataTable
----------------

### Synopsis
Exports objects to a datatable on disk

---

### Description

Exports objects to a datatable.  Objects in the datatable must be serialiazble in order to be stored.

---

### Related Links
* [Import-DataTable](Import-DataTable)

* [ConvertTo-DataTable](ConvertTo-DataTable)

---

### Examples
> EXAMPLE 1

```PowerShell
dir | 
    select Name, LastWriteTime, CreationTime | 
    Export-DataTable -OutputPath .\Files.bin
Import-DataTable .\Files.bin
```

---

### Parameters
#### **InputObject**
The input object

|Type          |Required|Position|PipelineInput |
|--------------|--------|--------|--------------|
|`[PSObject[]]`|true    |named   |true (ByValue)|

#### **DataTable**
An existing data table.  Use this parameter to store data tables created with New-DataTable

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[DataTable]`|true    |named   |false        |

#### **OutputPath**
The output path

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

---

### Outputs
* [Nullable](https://learn.microsoft.com/en-us/dotnet/api/System.Nullable)

---

### Notes
A datatable will not be able to be exported if it contains live objects that do not implement ISerializable.

---

### Syntax
```PowerShell
Export-DataTable -InputObject <PSObject[]> [-OutputPath] <String> [<CommonParameters>]
```
```PowerShell
Export-DataTable -DataTable <DataTable> [-OutputPath] <String> [<CommonParameters>]
```
