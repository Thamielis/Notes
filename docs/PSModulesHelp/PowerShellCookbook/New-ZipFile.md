New-ZipFile
-----------

### Synopsis
Create a Zip file from any files piped in.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
dir *.ps1 | New-ZipFile scripts.zip
Copies all PS1 files in the current directory to scripts.zip
```
> EXAMPLE 2

```PowerShell
"readme.txt" | New-ZipFile docs.zip
Copies readme.txt to docs.zip
```

---

### Parameters
#### **Path**
The name of the zip archive to create

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **Force**
Switch to delete the zip archive if it already exists.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
New-ZipFile [[-Path] <Object>] [-Force] [<CommonParameters>]
```
