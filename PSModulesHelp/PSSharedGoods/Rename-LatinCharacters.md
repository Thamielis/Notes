Rename-LatinCharacters
----------------------

### Synopsis
Renames a name to a name without special chars.

---

### Description

Renames a name to a name without special chars.

---

### Examples
> EXAMPLE 1

```PowerShell
Rename-LatinCharacters -String 'Przemysław Kłys'
```
> EXAMPLE 2

```PowerShell
Rename-LatinCharacters -String 'Przemysław'
```

---

### Parameters
#### **String**
Provide a string to rename

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Rename-LatinCharacters [[-String] <String>] [<CommonParameters>]
```
