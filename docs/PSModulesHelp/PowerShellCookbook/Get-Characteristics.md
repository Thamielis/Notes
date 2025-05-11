Get-Characteristics
-------------------

### Synopsis
Get the file characteristics of a file in the PE Executable File Format.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
Get-Characteristics $env:WINDIR\notepad.exe
IMAGE_FILE_LOCAL_SYMS_STRIPPED
IMAGE_FILE_RELOCS_STRIPPED
IMAGE_FILE_EXECUTABLE_IMAGE
IMAGE_FILE_32BIT_MACHINE
IMAGE_FILE_LINE_NUMS_STRIPPED
```

---

### Parameters
#### **Path**
The path to the file to check

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

---

### Syntax
```PowerShell
Get-Characteristics [-Path] <String> [<CommonParameters>]
```
