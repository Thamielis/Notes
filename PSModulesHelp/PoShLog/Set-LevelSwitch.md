Set-LevelSwitch
---------------

### Synopsis
Sets minimum level of given level switch

---

### Description

Sets minimum level of given level switch.

---

### Examples
> EXAMPLE 1

```PowerShell
$levelSwitch | Set-LevelSwitch -MinimumLevel Information
```
> EXAMPLE 2

```PowerShell
$levelSwitch = Set-LevelSwitch -LevelSwitch $levelSwitch -MinimumLevel Information
```

---

### Parameters
#### **LevelSwitch**
Instance of LoggingLevelSwitch to change

|Type                  |Required|Position|PipelineInput |
|----------------------|--------|--------|--------------|
|`[LoggingLevelSwitch]`|true    |1       |true (ByValue)|

#### **MinimumLevel**
Sets current minimum level, below which no events should be generated
Valid Values:

* Verbose
* Debug
* Information
* Warning
* Error
* Fatal

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[LogEventLevel]`|true    |2       |false        |

#### **ToPreference**
Set to propagate desired minimum level to preference variables.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PassThru**
Outputs Serilog.Core.LoggingLevelSwitch with updated MinimumLevel into pipeline

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs
Instance of LoggingLevelSwitch

---

### Outputs
* Instance of LoggingLevelSwitch with altered minumum logging level

---

### Syntax
```PowerShell
Set-LevelSwitch [-LevelSwitch] <LoggingLevelSwitch> [-MinimumLevel] {Verbose | Debug | Information | Warning | Error | Fatal} [-ToPreference] [-PassThru] [<CommonParameters>]
```
