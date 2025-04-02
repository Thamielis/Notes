Add-EnrichFromLogContext
------------------------

### Synopsis
Enriches log events with properties from LogContext

---

### Description

Enriches log events with properties from LogContext. Use Push-LogContextProp to add properties.

---

### Examples
> EXAMPLE 1

```PowerShell
New-Logger | Add-EnrichFromLogContext | Add-SinkConsole | Start-Logger
```

---

### Parameters
#### **LoggerConfig**
Instance of LoggerConfiguration that is already setup.

|Type                   |Required|Position|PipelineInput |
|-----------------------|--------|--------|--------------|
|`[LoggerConfiguration]`|true    |1       |true (ByValue)|

---

### Inputs
Instance of LoggerConfiguration

---

### Outputs
* Instance of LoggerConfiguration

---

### Syntax
```PowerShell
Add-EnrichFromLogContext [-LoggerConfig] <LoggerConfiguration> [<CommonParameters>]
```
