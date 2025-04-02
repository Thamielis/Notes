Add-WorkSheet
-------------

### Synopsis
Adds a worksheet to an existing workbook.

---

### Description

If the named worksheet already exists, the -Clearsheet parameter decides whether it should be deleted and a new one returned, or if not specified the existing sheet will be returned.

By default the sheet is created at the end of the work book, the -MoveXXXX switches allow the sheet to be [re]positioned at the start or before or after another sheet.

A new sheet will only be made the default sheet when excel opens if -Activate is specified.

---

### Related Links
* [Online Version:](Online Version:)

---

### Examples
> EXAMPLE 1

PS\> $WorksheetActors = $ExcelPackage | Add-WorkSheet -WorkSheetname Actors
$ExcelPackage holds an Excel package object (returned by Open-ExcelPackage, or Export-Excel -passthru). This command will add a sheet named 'Actors', or return the sheet if it exists, and the result is stored in $WorkSheetActors.
> EXAMPLE 2

PS\> $WorksheetActors = Add-WorkSheet -ExcelPackage $ExcelPackage -WorkSheetname "Actors" -ClearSheet -MoveToStart
This time the Excel package object is passed as a parameter instead of piped.

If the 'Actors' sheet already exists it is deleted and re-created.

The new sheet will be created last in the workbook, and -MoveToStart Moves it to the start.
> EXAMPLE 3

```PowerShell
PS\> $null = Add-WorkSheet -ExcelWorkbook $wb -WorkSheetname $DestinationName -CopySource $sourceWs -Activate
This time a workbook is used instead of a package, and a worksheet is copied - $SourceWs is a worksheet object, which can come from the same workbook or a different one.

Here the new copy of the data is made the active sheet when the workbook is opened.
```

---

### Parameters
#### **ExcelPackage**
An object representing an Excel Package.

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[ExcelPackage]`|true    |1       |True (ByValue)|

#### **ExcelWorkbook**
An Excel Workbook to which the Worksheet will be added - a Package contains one Workbook, so you can use whichever fits at the time.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[ExcelWorkbook]`|true    |named   |False        |

#### **WorksheetName**
The name of the worksheet, 'Sheet1' by default.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ClearSheet**
If the worksheet already exists, by default it will returned, unless -ClearSheet is specified in which case it will be deleted and re-created.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **MoveToStart**
If specified, the worksheet will be moved to the start of the workbook.
MoveToStart takes precedence over MoveToEnd, Movebefore and MoveAfter if more than one is specified.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **MoveToEnd**
If specified, the worksheet will be moved to the end of the workbook.
(This is the default position for newly created sheets, but it can be used to move existing sheets.)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **MoveBefore**
If specified, the worksheet will be moved before the nominated one (which can be an index starting from 1, or a name).
MoveBefore takes precedence over MoveAfter if both are specified.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **MoveAfter**
If specified, the worksheet will be moved after the nominated one (which can be an index starting from 1, or a name or *).
If * is used, the worksheet names will be examined starting with the first one, and the sheet placed after the last sheet which comes before it alphabetically.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **Activate**
If there is already content in the workbook the new sheet will not be active UNLESS Activate is specified.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **CopySource**
If worksheet is provided as a copy source the new worksheet will be a copy of it. The source can be in the same workbook, or in a different file.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[ExcelWorksheet]`|false   |named   |False        |

#### **NoClobber**
Ignored but retained for backwards compatibility.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Outputs
* OfficeOpenXml.ExcelWorksheet

---

### Notes

---

### Syntax
```PowerShell
Add-WorkSheet [-ExcelPackage] <ExcelPackage> [-WorksheetName <String>] [-ClearSheet] [-MoveToStart] [-MoveToEnd] [-MoveBefore <Object>] [-MoveAfter <Object>] [-Activate] [-CopySource <ExcelWorksheet>] [-NoClobber] [<CommonParameters>]
```
```PowerShell
Add-WorkSheet -ExcelWorkbook <ExcelWorkbook> [-WorksheetName <String>] [-ClearSheet] [-MoveToStart] [-MoveToEnd] [-MoveBefore <Object>] [-MoveAfter <Object>] [-Activate] [-CopySource <ExcelWorksheet>] [-NoClobber] [<CommonParameters>]
```
