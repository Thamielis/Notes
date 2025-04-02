Invoke-Tokenize
---------------

### Synopsis
Tokenizes a script.

---

### Description

Gets the content of a script located at a given path and tokenizes it.

---

### Related Links
* [http://workingsysadmin.com](http://workingsysadmin.com)

---

### Examples
> EXAMPLE 1

```PowerShell
Invoke-Tokenize -ScriptPath .\MyScript.ps1
```

---

### Parameters
#### **ScriptPath**
The path to the script to be tokenized

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

---

### Notes
Author: Thomas Rayner (@MrThomasRayner), workingsysadmin.com

---

### Syntax
```PowerShell
Invoke-Tokenize [-ScriptPath] <String> [<CommonParameters>]
```
