New-TableButtonCopy
-------------------

### Synopsis
Creates a new table button for copying data with customizable options.

---

### Description

This function creates a new table button for copying data with customizable options. It allows users to specify the button title and display text.

---

### Examples
> EXAMPLE 1

New-TableButtonCopy -Title "Copy Data" -ButtonName "Copy"
Description
-----------
Creates a new table button with the title "Copy Data" and button name "Copy".

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
New-TableButtonCopy [[-Title] <String>] [[-ButtonName] <String>] [<CommonParameters>]
```
