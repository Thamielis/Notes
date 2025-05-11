Invoke-Parallel
---------------

### Synopsis
Invokes PowerShell in parallel

---

### Description

Invokes PowerShell in parallel and in the same proess space.  This maximizes performance for parallel execution in PowerShell, by removing the drag associated with background processes.

---

### Related Links
* [Update-SQL](Update-SQL)

---

### Examples
> EXAMPLE 1

```PowerShell
1..10 | Invoke-Parallel -Command {                        
    (Get-Date).ToShortTimeString() + "." + (Get-Date).Millisecond                        
} -SliceSize 1 -MaxRunning 10
```
> EXAMPLE 2

```PowerShell
1..10 | Invoke-Parallel -Command {                        
    foreach ($a in $args) {
        "$a - " + ((Get-Date).ToShortTimeString() + "." + (Get-Date).Millisecond)
    }
}
```

---

### Parameters
#### **InputObject**
The list of input objects

|Type          |Required|Position|PipelineInput |
|--------------|--------|--------|--------------|
|`[PSObject[]]`|true    |2       |true (ByValue)|

#### **Command**
The command

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|true    |1       |false        |

#### **SliceSize**
The size of each slice of data.  By default, this is the square root of the number of items

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |4       |false        |

#### **MaxRunning**
The maximum number of running items.  By default, this is the square root of the slice size.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |5       |false        |

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Notes
Invoke-Parallel is an alternative to using PowerShell workflows to run PowerShell in parallel.  

Because PowerShell workflows involve process isolation, each workflow takes up a lot of overhead for a small operation.  

This overhead is considerably increased when the workflow is expected to return information, since this information has to be deserialized and brought into the process via interprocess communication (IPC).  Doing this takes up a lot of time and requires the movement of a lot of memory, which also slows down workflows.

Invoke-Parallel uses PowerShell RunspacePools to run code in parallel within the current process, which saves a lot of overhead.

---

### Syntax
```PowerShell
Invoke-Parallel [-InputObject] <PSObject[]> [-Command] <ScriptBlock> [[-SliceSize] <UInt32>] [[-MaxRunning] <UInt32>] [<CommonParameters>]
```
