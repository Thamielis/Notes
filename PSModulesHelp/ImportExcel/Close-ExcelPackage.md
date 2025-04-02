Close-ExcelPackage
------------------

### Synopsis
Closes an Excel Package, saving, saving under a new name or abandoning changes and opening the file in Excel as required.

---

### Description

When working with an ExcelPackage object, the Workbook is held in memory and not saved until the .Save() method of the package is called.

Close-ExcelPackage saves and disposes of the Package object.

It can be called with -NoSave to abandon the file without saving, with a new "SaveAs" filename, and/or with a password to protect the file. And -Show will open the file in Excel; -Calculate will try to update the workbook, although not everything can be recalculated

---

### Related Links
* [Online Version:](Online Version:)

---

### Examples
> EXAMPLE 1

Close-ExcelPackage -show $excel
$excel holds a package object, this saves the workbook and loads it into Excel.
> EXAMPLE 2

Close-ExcelPackage -NoSave $excel
$excel holds a package object, this disposes of it without writing it to disk.

---

### Parameters
#### **ExcelPackage**
Package to close.

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[ExcelPackage]`|true    |1       |True (ByValue)|

#### **Show**
Open the file in Excel.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NoSave**
Abandon the file without saving.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **SaveAs**
Save file with a new name (ignored if -NoSave Specified).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |False        |

#### **Password**
Password to protect the file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |False        |

#### **Calculate**
Attempt to recalculation the workbook before saving

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Notes

---

### Syntax
```PowerShell
Close-ExcelPackage [-ExcelPackage] <ExcelPackage> [[-SaveAs] <Object>] [[-Password] <String>] [-Show] [-NoSave] [-Calculate] [<CommonParameters>]
```
