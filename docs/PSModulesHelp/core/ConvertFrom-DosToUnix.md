ConvertFrom-DosToUnix
---------------------

### Synopsis
Covert carriage returns to new line

---

### Description

Converts text files from DOS to Unix file new lines

---

### Examples
> EXAMPLE 1

```PowerShell
dox2unix .\test.txt
```
> EXAMPLE 2

```PowerShell
ConvertFrom-DosToUnix -FilePath C:\Users\Me\Documents\MyFolderWithStuff\myDosFileWithText.txt
```

---

### Parameters
#### **FilePath**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

---

### Syntax
```PowerShell
ConvertFrom-DosToUnix [-FilePath] <String> [<CommonParameters>]
```
