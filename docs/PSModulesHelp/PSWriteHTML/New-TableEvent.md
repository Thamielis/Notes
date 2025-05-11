New-TableEvent
--------------

### Synopsis
Creates a new table event object.

---

### Description

This function creates a new table event object with the specified parameters.

---

### Examples
> EXAMPLE 1

```PowerShell
New-TableEvent -TableID "Table1" -SourceColumnName "Column1" -TargetColumnID 1 -SourceColumnID 2
Creates a new table event object for Table1 with SourceColumnName "Column1", TargetColumnID 1, and SourceColumnID 2.
```

---

### Parameters
#### **TableID**
Specifies the ID of the table.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |1       |false        |ID     |

#### **SourceColumnName**
Specifies the name of the source column.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **TargetColumnID**
Specifies the ID of the target column.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |3       |false        |

#### **SourceColumnID**
Specifies the ID of the source column.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |4       |false        |

---

### Syntax
```PowerShell
New-TableEvent [[-TableID] <String>] [[-SourceColumnName] <String>] [[-TargetColumnID] <Nullable`1>] [[-SourceColumnID] <Nullable`1>] [<CommonParameters>]
```
