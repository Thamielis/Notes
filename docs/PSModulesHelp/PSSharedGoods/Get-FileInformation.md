Get-FileInformation
-------------------

### Synopsis
Get information about file such as Name, FullName and Size

---

### Description

Get information about file such as Name, FullName and Size

---

### Examples
> EXAMPLE 1

```PowerShell
Get-FileInformation -File 'C:\Support\GitHub\PSSharedGoods\Public\FilesFolders\Get-FileInformation.ps1'
```

---

### Parameters
#### **File**
File to get information about

|Type      |Required|Position|PipelineInput|Aliases             |
|----------|--------|--------|-------------|--------------------|
|`[String]`|false   |1       |false        |LiteralPath<br/>Path|

---

### Syntax
```PowerShell
Get-FileInformation [[-File] <String>] [<CommonParameters>]
```
