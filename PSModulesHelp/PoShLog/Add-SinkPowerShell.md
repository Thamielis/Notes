Add-SinkPowerShell
------------------

### Synopsis
Writes log events to powershell host

---

### Description

Writes log events to powershell host

---

### Examples
> EXAMPLE 1

```PowerShell
Add-SinkPowerShell
```
> EXAMPLE 2

```PowerShell
Add-SinkPowerShell -OutputTemplate "[{EnvironmentUserName}{MachineName} {Timestamp:HH:mm:ss} {Level:u3}] {Message:lj}{NewLine}{Exception}"
```

---

### Parameters
#### **LoggerConfig**
Instance of LoggerConfiguration

|Type                   |Required|Position|PipelineInput |
|-----------------------|--------|--------|--------------|
|`[LoggerConfiguration]`|true    |1       |true (ByValue)|

#### **RestrictedToMinimumLevel**
The minimum level for events passed through the sink. Ignored when LevelSwitch is specified.
Valid Values:

* Verbose
* Debug
* Information
* Warning
* Error
* Fatal

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[LogEventLevel]`|false   |2       |false        |

#### **OutputTemplate**
A message template describing the format used to write to the sink.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **LevelSwitch**
A switch allowing the pass-through minimum level to be changed at runtime.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[LoggingLevelSwitch]`|false   |4       |false        |

---

### Inputs
Instance of LoggerConfiguration

---

### Outputs
* LoggerConfiguration object allowing method chaining

---

### Syntax
```PowerShell
Add-SinkPowerShell [-LoggerConfig] <LoggerConfiguration> [[-RestrictedToMinimumLevel] {Verbose | Debug | Information | Warning | Error | Fatal}] [[-OutputTemplate] <String>] [[-LevelSwitch] <LoggingLevelSwitch>] [<CommonParameters>]
```
