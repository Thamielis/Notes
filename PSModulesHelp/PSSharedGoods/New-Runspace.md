New-Runspace
------------

### Synopsis
Creates a new runspace pool with the specified minimum and maximum runspaces.

---

### Description

This function creates a new runspace pool with the specified minimum and maximum runspaces. It allows for concurrent execution of PowerShell scripts.

---

### Examples
> EXAMPLE 1

```PowerShell
$pool = New-Runspace -minRunspaces 2 -maxRunspaces 5
Creates a runspace pool with a minimum of 2 and a maximum of 5 runspaces.
```
> EXAMPLE 2

```PowerShell
$pool = New-Runspace
Creates a runspace pool with default minimum and maximum runspaces.
```

---

### Parameters
#### **minRunspaces**
The minimum number of runspaces to be created in the runspace pool. Default is 1.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |1       |false        |

#### **maxRunspaces**
The maximum number of runspaces to be created in the runspace pool. Default is the number of processors plus 1.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |false        |

---

### Syntax
```PowerShell
New-Runspace [[-minRunspaces] <Int32>] [[-maxRunspaces] <Int32>] [<CommonParameters>]
```
