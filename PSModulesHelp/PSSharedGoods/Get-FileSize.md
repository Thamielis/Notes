Get-FileSize
------------

### Synopsis
Get-FileSize function calculates the file size in human-readable format.

---

### Description

This function takes a file size in bytes and converts it into a human-readable format (e.g., KB, MB, GB, etc.).

---

### Examples
> EXAMPLE 1

```PowerShell
Get-FileSize -Bytes 1024
Output: 1 KB
```
> EXAMPLE 2

```PowerShell
Get-FileSize -Bytes 1048576
Output: 1 MB
```

---

### Parameters
#### **Bytes**
Specifies the size of the file in bytes.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

---

### Syntax
```PowerShell
Get-FileSize [[-Bytes] <Object>] [<CommonParameters>]
```
