Enter-Module
------------

### Synopsis
Lets you examine internal module state and functions by executing user
input in the scope of the supplied module.

---

### Description

---

### Examples
> EXAMPLE 1

Import-Module PersistentState
PS > Get-Module PersistentState
ModuleType Name                      ExportedCommands
---------- ----                      ----------------
Script     PersistentState           {Set-Memory, Get-Memory}

PS > "Hello World" | Set-Memory
PS > $m = Get-Module PersistentState
PS > Enter-Module $m
PersistentState: dir variable:\mem*

Name                           Value
----                           -----
memory                         {Hello World}

PersistentState: exit
PS >

---

### Parameters
#### **Module**
The module to examine

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSModuleInfo]`|false   |1       |false        |

---

### Syntax
```PowerShell
Enter-Module [[-Module] <PSModuleInfo>] [<CommonParameters>]
```
