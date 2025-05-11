Assert-PsOneFolderExists
------------------------

### Synopsis
Makes sure the specified folder(s) exist

---

### Description

If a folder does not exist, it will be created.

---

### Related Links
* [https://powershell.one](https://powershell.one)

---

### Examples
> EXAMPLE 1

```PowerShell
($Path = 'C:\test') | Assert-PsOneFolderExists
Makes sure the folder c:\test exists. If it is still missing, it will be created.
```
> EXAMPLE 2

```PowerShell
'C:\test','c:\test2' | Assert-PsOneFolderExists
Makes sure the folders. If a folder is still missing, it will be created.
```
> EXAMPLE 3

```PowerShell
Assert-PsOneFolderExists -Path 'C:\test','c:\test2'
Makes sure the folders. If a folder is still missing, it will be created.
```

---

### Parameters
#### **Path**

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[String[]]`|true    |1       |true (ByValue)|

---

### Syntax
```PowerShell
Assert-PsOneFolderExists [-Path] <String[]> [<CommonParameters>]
```
