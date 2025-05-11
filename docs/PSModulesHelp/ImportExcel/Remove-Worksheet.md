Remove-WorkSheet
----------------

### Synopsis
Removes one or more worksheets from one or more workbooks

---

### Description

---

### Related Links
* [Online Version:](Online Version:)

---

### Examples
> EXAMPLE 1

```PowerShell
PS\> Remove-WorkSheet -Path Test1.xlsx -WorksheetName Sheet1
Removes the worksheet named 'Sheet1' from 'Test1.xlsx'
```
> EXAMPLE 2

```PowerShell
PS\> Remove-WorkSheet -Path Test1.xlsx -WorksheetName Sheet1,Target1
Removes the worksheet named 'Sheet1' and 'Target1' from 'Test1.xlsx'
```
> EXAMPLE 3

```PowerShell
PS\> Remove-WorkSheet -Path Test1.xlsx -WorksheetName Sheet1,Target1 -Show
Removes the worksheets and then launches the xlsx in Excel
```
> EXAMPLE 1

```PowerShell
PS\>  dir c:\reports\*.xlsx | Remove-WorkSheet
Removes 'Sheet1' from all the xlsx files in the c:\reports directory
```

---

### Parameters
#### **FullName**
The fully qualified path to the XLSX file(s)

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Object]`|false   |1       |True (ByPropertyName)|Path   |

#### **WorksheetName**
The worksheet to be removed (sheet1 by default)

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |False        |

#### **Show**
If specified the file will be opened in excel after the sheet is removed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---

### Notes

---

### Syntax
```PowerShell
Remove-WorkSheet [[-FullName] <Object>] [[-WorksheetName] <String[]>] [-Show] [-WhatIf] [-Confirm] [<CommonParameters>]
```
