# Import-OfficeExcel

## Synopsis
Provides a way to converting an Excel file into PowerShell objects.

---

## Description

Provides a way to converting an Excel file into PowerShell objects.
If Worksheet is not specified, all worksheets will be imported and returned as a hashtable of worksheet names and worksheet objects.
If Worksheet is specified, only the specified worksheet will be imported and returned as an array of PSCustomObjects

---

## Examples
> EXAMPLE 1

```PowerShell
$FilePath = "$PSScriptRoot\Documents\Test5.xlsx"
$ImportedData1 = Import-OfficeExcel -FilePath $FilePath
$ImportedData1 | Format-Table
```

> EXAMPLE 2

```PowerShell
$FilePath = "$PSScriptRoot\Documents\Excel.xlsx"
$ImportedData2 = Import-OfficeExcel -FilePath $FilePath -WorkSheetName 'Contact3'
$ImportedData2 | Format-Table
```

---

## Parameters
### **FilePath**
The path to the Excel file to import.

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[String]`|true    |1       |false        |LiteralPath|

### **WorkSheetName**
The name of the worksheet to import. If not specified, all worksheets will be imported.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

---

## Notes
General notes

---

## Syntax

```PowerShell
Import-OfficeExcel [-FilePath] <String> [[-WorkSheetName] <String[]>] [<CommonParameters>]
```
