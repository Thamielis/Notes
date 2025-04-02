Enable-PSAdapter
----------------

### Synopsis
Enables a PSAdapter Module

---

### Description

Enables a module written in .cdxml format.

---

### Parameters
#### **AdapterName**
The name of the adapter to enable.

|Type        |Required|Position|PipelineInput        |Aliases            |
|------------|--------|--------|---------------------|-------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|ModuleName<br/>Name|

#### **PassThru**
If set, will output the enabled module.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
One of the advantages of using .cdxml and .psd1 modules is that they can be cleanly loaded and unloaded from memory.

This enables you to enable and disable a large number of commands as needed, without loading all of them into memory when a module first loads.

---

### Syntax
```PowerShell
Enable-PSAdapter [[-AdapterName] <String[]>] [-PassThru] [<CommonParameters>]
```
