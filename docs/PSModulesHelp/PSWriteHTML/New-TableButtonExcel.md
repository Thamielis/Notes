New-TableButtonExcel
--------------------

### Synopsis
Creates a new table button for exporting data to Excel with customizable options.

---

### Description

This function creates a new table button for exporting data to Excel with customizable options. It allows users to specify the button title and display text.

---

### Examples
> EXAMPLE 1

New-TableButtonExcel -Title "Export to Excel" -ButtonName "Export"
Description
-----------
Creates a new table button with the title "Export to Excel" and button name "Export".

---

### Parameters
#### **Title**
The title to be displayed when hovering over the button.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **ButtonName**
The text to be displayed on the button.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

---

### Syntax
```PowerShell
New-TableButtonExcel [[-Title] <String>] [[-ButtonName] <String>] [<CommonParameters>]
```
