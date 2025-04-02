Export-XLShape
--------------

### Synopsis
Export Excel shapes.

---

### Description

This script exports properties of every shapes in a Excel file.
It's intended to use them to analyze a diagram made by Excel shapes programatically.

This script only works on Windows with Excel installed.

Almost all properties in exported objects are simply copied from underlying API (Excel COM objects).
So you can find thier meanings or functionalities by searching them on the internet.

---

### Examples
> EXAMPLE 1

```PowerShell
Export-ExcelShape -Path .\test.xlsx | Export-Csv -Path .\out.csv -Encoding UTF8 -NotypeInformation
Export shapes in .\test.xlsx as CSV.
```
> EXAMPLE 2

```PowerShell
Get-ChildItem -Filter *.xlsx | Export-ExcelShape | Tee-Object -Variable out | Out-GridView
Extract shapes from *.xlsx in current directory, Set into $out, and display in gridview.
```

---

### Parameters
#### **Path**
Path to a Excel file

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Object]`|false   |1       |true (ByValue)|

#### **Excel**
Use this parameter to specify your own instance of Excel Application to deal with the Excel file.
If not specified, the script uses its own Excel Application.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

---

### Syntax
```PowerShell
Export-XLShape [[-Path] <Object>] [[-Excel] <Object>] [<CommonParameters>]
```
