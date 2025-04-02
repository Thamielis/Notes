ConvertTo-PSCodeString
----------------------

### Synopsis
Convert an object or array of objects into a code string which could be converted into a ScriptBlock with valid PowerShell syntax

---

### Description

Originally used for hashtables and arrays

---

### Parameters
#### **InputObject**
Object to convert to a PowerShell code string

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

---

### Inputs
$InputObject parameter

---

### Outputs
* [System.String] Resulting PowerShell code

---

### Syntax
```PowerShell
ConvertTo-PSCodeString [[-InputObject] <Object>] [<CommonParameters>]
```
