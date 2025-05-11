Move-LockedFile
---------------

### Synopsis
Registers a locked file to be moved at the next system restart.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
Move-LockedFile c:\temp\locked.txt c:\temp\locked.txt.bak
```

---

### Parameters
#### **Path**
The current location of the file to move

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **Destination**
The target location of the file

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

---

### Syntax
```PowerShell
Move-LockedFile [[-Path] <Object>] [[-Destination] <Object>] [<CommonParameters>]
```
