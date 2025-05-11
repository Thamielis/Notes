Add-EnrichWithErrorRecord
-------------------------

### Synopsis
Enriches log events with ErrorRecord property if available.

---

### Description

Enriches log events with ErrorRecord property if available. Use -ErrorRecord parameter on Write-*Log cmdlets to add ErrorRecord.

---

### Examples
> EXAMPLE 1

```PowerShell
New-Logger | Add-EnrichWithErrorRecord | Add-SinkPowerShell | Start-Logger
```

---

### Parameters
#### **LoggerConfig**
Instance of LoggerConfiguration that is already setup.

|Type                   |Required|Position|PipelineInput |
|-----------------------|--------|--------|--------------|
|`[LoggerConfiguration]`|true    |1       |true (ByValue)|

#### **DestructureObjects**
If true, and the value is a non-primitive, non-array type, then the value will be converted to a structure; otherwise, unknown types will be converted to scalars, which are generally stored as strings.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs
Instance of LoggerConfiguration

---

### Outputs
* Instance of LoggerConfiguration

---

### Syntax
```PowerShell
Add-EnrichWithErrorRecord [-LoggerConfig] <LoggerConfiguration> [-DestructureObjects] [<CommonParameters>]
```
