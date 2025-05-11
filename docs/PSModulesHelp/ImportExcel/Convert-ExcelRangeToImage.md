Convert-ExcelRangeToImage
-------------------------

### Synopsis
Gets the specified part of an Excel file and exports it as an image

---

### Description

Excel allows charts to be exported directly to a file, but it can't do this with the rest of a sheet. To work round this, this function

* Opens a copy of Excel and loads a file

* Selects a worksheet and then a range of cells in that worksheet

* Copies the select to the clipboard

* Saves the clipboard contents as an image file (it will save as .JPG unless the file name ends .BMP or .PNG)

* Copies a single cell to the clipboard (to prevent the "you have put a lot in the clipboard" message appearing)

* Closes Excel

Unlike most functions in the module it needs a local copy of Excel to be installed. EXAMPLES

---

### Related Links
* [Online Version:](Online Version:)

---

### Parameters
#### **Path**
Path to the Excel file

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |False        |

#### **WorkSheetname**
Worksheet name - if none is specified "Sheet1" will be assumed

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |False        |

#### **Range**
Range of cells within the sheet, e.g "A1:Z99"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |3       |False        |

#### **Destination**
A bmp, png or jpg file where the result will be saved

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |False        |

#### **Show**
If specified opens the image in the default viewer.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Notes

---

### Syntax
```PowerShell
Convert-ExcelRangeToImage [-Path] <Object> [[-WorkSheetname] <Object>] [-Range] <Object> [[-Destination] <Object>] [-Show] [<CommonParameters>]
```
