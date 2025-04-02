Select-Worksheet
----------------

### Synopsis
Sets the selected tab in an Excel workbook to be the chosen sheet and unselects all the others.

---

### Description

Sometimes when a sheet is added we want it to be the active sheet, sometimes we want the active sheet to be left as it was. Select-Worksheet exists to change which sheet is the selected tab when Excel opens the file.

---

### Related Links
* [Online Version:](Online Version:)

---

### Examples
> EXAMPLE 1

PS\> Select-Worksheet -ExcelWorkbook $ExcelWorkbook -WorksheetName "NewSheet"
$ExcelWorkbook holds a workbook object containing a sheet named "NewSheet"; This sheet will become the [only] active sheet in the workbook
> EXAMPLE 2

PS\>  Select-Worksheet -ExcelPackage $Pkg -WorksheetName "NewSheet2"
$pkg holds an Excel Package, whose workbook contains a sheet named "NewSheet2" This sheet will become the [only] active sheet in the workbook.
> EXAMPLE 3

PS\> Select-Worksheet -ExcelWorksheet $ws
$ws holds an Excel worksheet which will become the [only] active sheet in its workbook.

---

### Parameters
#### **ExcelPackage**
An object representing an ExcelPackage.

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[ExcelPackage]`|true    |1       |True (ByValue)|

#### **ExcelWorkbook**
An Excel workbook to which the Worksheet will be added - a package contains one Workbook so you can use workbook or package as it suits.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[ExcelWorkbook]`|true    |named   |False        |

#### **WorksheetName**
The name of the worksheet "Sheet1" by default.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ExcelWorksheet**
An object representing an Excel worksheet.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[ExcelWorksheet]`|true    |named   |False        |

---

### Notes

---

### Syntax
```PowerShell
Select-Worksheet [-ExcelPackage] <ExcelPackage> [-WorksheetName <String>] [<CommonParameters>]
```
```PowerShell
Select-Worksheet -ExcelWorkbook <ExcelWorkbook> [-WorksheetName <String>] [<CommonParameters>]
```
```PowerShell
Select-Worksheet -ExcelWorksheet <ExcelWorksheet> [<CommonParameters>]
```
