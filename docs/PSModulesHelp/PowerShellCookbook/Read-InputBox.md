Read-InputBox
-------------

### Synopsis
Read user input from a visual InputBox

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
$caption = "Please enter your name"
PS > $name = Read-InputBox $caption
```

---

### Parameters
#### **Title**
The title of the dialog when displayed

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Syntax
```PowerShell
Read-InputBox [[-Title] <String>] [<CommonParameters>]
```
