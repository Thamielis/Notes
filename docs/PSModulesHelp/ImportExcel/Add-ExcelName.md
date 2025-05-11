Add-ExcelName
-------------

### Synopsis
Adds a named-range to an existing Excel worksheet.

---

### Description

It is often helpful to be able to refer to sets of cells with a name rather than using their co-ordinates; Add-ExcelName sets up these names.

---

### Related Links
* [Online Version:](Online Version:)

---

### Examples
> EXAMPLE 1

PS\> Add-ExcelName -Range $ws.Cells[$dataRange] -RangeName $rangeName
$WS is a worksheet, and $dataRange is a string describing a range of cells - for example "A1:Z10" - which will become a named range, using the name in $rangeName.

---

### Parameters
#### **Range**
The range of cells to assign as a name.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[ExcelRange]`|true    |1       |False        |

#### **RangeName**
The name to assign to the range. If the name exists it will be updated to the new range. If no name is specified, the first cell in the range will be used as the name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |False        |

---

### Notes

---

### Syntax
```PowerShell
Add-ExcelName [-Range] <ExcelRange> [[-RangeName] <String>] [<CommonParameters>]
```
