New-HardLink
------------

### Synopsis
Creates a new hard link to a file.

---

### Description

Hard links are mappings, or system representation of a file in a single volume.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HardLink -Link "$PSModulesPath\MyPoshMod\MyPoshMod.psm1" -Target 'C:\Modueles\MyPoshMod.psm1'
```
> EXAMPLE 2

```PowerShell
New-HardLink .\testfile.txt ..\test.txt
```

---

### Parameters
#### **Link**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Target**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

---

### Notes
You cannot make a link to a folder in any drive/volume, or link to a file in another drive/volume.

---

### Syntax
```PowerShell
New-HardLink [-Link] <String> [-Target] <String> [<CommonParameters>]
```
