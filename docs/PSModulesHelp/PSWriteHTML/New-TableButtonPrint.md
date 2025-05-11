New-TableButtonPrint
--------------------

### Synopsis
Creates a new table button for printing with optional title and button name.

---

### Description

This function creates a new table button for printing with optional title and button name. It can be used to add a print button to HTML tables.

---

### Examples
> EXAMPLE 1

New-TableButtonPrint -Title "Print Table" -ButtonName "Print"
Description
-----------
Creates a new table button with the title "Print Table" and button name "Print".

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
New-TableButtonPrint [[-Title] <String>] [[-ButtonName] <String>] [<CommonParameters>]
```
