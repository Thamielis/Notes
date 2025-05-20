Measure-PSMDLinesOfCode
-----------------------

### Synopsis
Measures the lines of code ina PowerShell scriptfile.

---

### Description

Measures the lines of code ina PowerShell scriptfile.
This scan uses the AST to figure out how many lines contain actual functional code.

---

### Examples
> EXAMPLE 1

```PowerShell
Measure-PSMDLinesOfCode -Path .\script.ps1
Measures the lines of code in the specified file.
```
> EXAMPLE 2

```PowerShell
Get-ChildItem C:\Scripts\*.ps1 | Measure-PSMDLinesOfCode
Measures the lines of code for every single file in the folder c:\Scripts.
```

---

### Parameters
#### **Path**
Path to the files to scan.
Folders will be ignored.

|Type        |Required|Position|PipelineInput                 |Aliases |
|------------|--------|--------|------------------------------|--------|
|`[String[]]`|true    |1       |true (ByValue, ByPropertyName)|FullName|

---

### Syntax
```PowerShell
Measure-PSMDLinesOfCode [-Path] <String[]> [<CommonParameters>]
```
