Get-ExcelSheetInfo
------------------

### Synopsis
Get worksheet names and their indices of an Excel workbook.

---

### Description

The Get-ExcelSheetInfo cmdlet gets worksheet names and their indices of an Excel workbook.

---

### Related Links
* [Online Version:](Online Version:)

* [https://github.com/dfinke/ImportExcel](https://github.com/dfinke/ImportExcel)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ExcelSheetInfo .\Test.xlsx
```

---

### Parameters
#### **Path**
Specifies the path to the Excel file. (This parameter is required.)

|Type      |Required|Position|PipelineInput                 |Aliases |
|----------|--------|--------|------------------------------|--------|
|`[Object]`|true    |1       |True (ByPropertyName, ByValue)|FullName|

---

### Notes
CHANGELOG 2016/01/07 Added Created by Johan Akerstrom ( https://github.com/CosmosKey (https://github.com/CosmosKey)\)

---

### Syntax
```PowerShell
Get-ExcelSheetInfo [-Path] <Object> [<CommonParameters>]
```
