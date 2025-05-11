Set-Logger
----------

### Synopsis
Sets current logger

---

### Description

Sets given logger as static property that is globally available

---

### Examples
> EXAMPLE 1

```PowerShell
Set-Logger -Logger $logger
```
> EXAMPLE 2

```PowerShell
$logger | Set-Logger
```

---

### Parameters
#### **Logger**
Instance of Serilog.Logger that will be available as static property

|Type       |Required|Position|PipelineInput |
|-----------|--------|--------|--------------|
|`[ILogger]`|true    |1       |true (ByValue)|

---

### Inputs
Instance of Serilog.Logger

---

### Outputs
* None

---

### Syntax
```PowerShell
Set-Logger [-Logger] <ILogger> [<CommonParameters>]
```
