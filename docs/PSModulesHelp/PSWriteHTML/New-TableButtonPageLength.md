New-TableButtonPageLength
-------------------------

### Synopsis
Creates a new table button for setting the page length in a DataTable.

---

### Description

This function creates a new table button for setting the page length in a DataTable. It allows users to customize the button title and display text.

---

### Examples
> EXAMPLE 1

New-TableButtonPageLength -Title "Set Page Length" -ButtonName "Page Length"
Description
-----------
Creates a new table button with the title "Set Page Length" and button name "Page Length".

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
New-TableButtonPageLength [[-Title] <String>] [[-ButtonName] <String>] [<CommonParameters>]
```
