Get-CUEnum
----------

### Synopsis
This function returns enums existing in a document.

---

### Description

Returns a custom type [ClassEnum]

---

### Related Links
* [https://github.com/Stephanevg/PowerShellClassUtils](https://github.com/Stephanevg/PowerShellClassUtils)

---

### Examples
> EXAMPLE 1

Get-CuEnum -Path C:\plop\enum.ps1
Returns:

Name Member
---- ------
woop {Absent, Present}

---

### Parameters
#### **Path**

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[String[]]`|false   |1       |true (ByValue)|

---

### Inputs
String

---

### Outputs
* Classenum

---

### Notes
Author: StÃ©phane van Gulick
Version: 0.2.0

---

### Syntax
```PowerShell
Get-CUEnum [[-Path] <String[]>] [<CommonParameters>]
```
