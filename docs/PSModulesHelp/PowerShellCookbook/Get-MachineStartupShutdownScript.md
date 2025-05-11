Get-MachineStartupShutdownScript
--------------------------------

### Synopsis
Get the startup or shutdown scripts assigned to a machine

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
Get-MachineStartupShutdownScript -ScriptType Startup
Gets startup scripts for the machine
```

---

### Parameters
#### **ScriptType**
The type of script to search for: Startup, or Shutdown.
Valid Values:

* Startup
* Shutdown

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

---

### Syntax
```PowerShell
Get-MachineStartupShutdownScript [-ScriptType] <Object> [<CommonParameters>]
```
