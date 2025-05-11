Get-ExcelFileSchema
-------------------

### Synopsis
Gets the schema of an Excel file.

---

### Description

The Get-ExcelFileSchema function gets the schema of an Excel file by returning the property names of the first row of each worksheet in the file.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ExcelFileSchema -Path .\example.xlsx
```

---

### Parameters
#### **Path**
Specifies the path to the Excel file.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[Object]`|true    |1       |true (ByPropertyName)|FullName|

#### **Compress**
Indicates whether to compress the json output.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* Json

---

### Syntax
```PowerShell
Get-ExcelFileSchema [-Path] <Object> [-Compress] [<CommonParameters>]
```
