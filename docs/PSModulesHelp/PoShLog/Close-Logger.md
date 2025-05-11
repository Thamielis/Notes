Close-Logger
------------

### Synopsis
Resets Logger to the default and disposes the original if possible.

---

### Description

Resets Logger to the default and disposes the original if possible.

---

### Examples
> EXAMPLE 1

```PowerShell
Close-Logger
```

---

### Parameters
#### **Logger**
Instance of Serilog.Logger. By default static property [Serilog.Log]::Logger is used.

|Type       |Required|Position|PipelineInput |
|-----------|--------|--------|--------------|
|`[ILogger]`|false   |1       |true (ByValue)|

---

### Inputs
Instance of Serilog.Logger

---

### Outputs
* None

---

### Syntax
```PowerShell
Close-Logger [[-Logger] <ILogger>] [<CommonParameters>]
```
