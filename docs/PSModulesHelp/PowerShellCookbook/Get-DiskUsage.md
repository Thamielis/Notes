Get-DiskUsage
-------------

### Synopsis
Retrieve information about disk usage in the current directory and all
subdirectories. If you specify the -IncludeSubdirectories flag, this
script accounts for the size of subdirectories in the size of a directory.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
Get-DiskUsage
Gets the disk usage for the current directory.
```
> EXAMPLE 2

```PowerShell
Get-DiskUsage -IncludeSubdirectories
Gets the disk usage for the current directory and those below it,
adding the size of child directories to the directory that contains them.
```

---

### Parameters
#### **IncludeSubdirectories**
Switch to include subdirectories in the size of each directory

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-DiskUsage [-IncludeSubdirectories] [<CommonParameters>]
```
