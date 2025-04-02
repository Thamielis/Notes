Add-SinkConsole
---------------

### Synopsis
Writes log events to console host

---

### Description

Writes log events to console host

---

### Examples
> EXAMPLE 1

```PowerShell
Add-SinkConsole
```
> EXAMPLE 2

```PowerShell
Add-SinkConsole -OutputTemplate "[{EnvironmentUserName}{MachineName} {Timestamp:HH:mm:ss} {Level:u3}] {Message:lj}{NewLine}{Exception}" -RestrictedToMinimumLevel Verbose
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

#### **FormatProvider**
Supplies culture-specific formatting information, or null.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[IFormatProvider]`|false   |4       |false        |

#### **LevelSwitch**
A switch allowing the pass-through minimum level to be changed at runtime.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[LoggingLevelSwitch]`|false   |5       |false        |

#### **StandardErrorFromLevel**
Specifies the level at which events will be written to standard error.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |6       |false        |

#### **Theme**
The theme to apply to the styled output. If not specified uses Serilog.Sinks.SystemConsole.Themes.SystemConsoleTheme.Literate.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[ConsoleTheme]`|false   |7       |false        |

---

### Inputs
Instance of LoggerConfiguration

---

### Outputs
* LoggerConfiguration object allowing method chaining

---

### Syntax
```PowerShell
Add-SinkConsole [-LoggerConfig] <LoggerConfiguration> [[-RestrictedToMinimumLevel] {Verbose | Debug | Information | Warning | Error | Fatal}] [[-OutputTemplate] <String>] [[-FormatProvider] <IFormatProvider>] [[-LevelSwitch] <LoggingLevelSwitch>] [[-StandardErrorFromLevel] <Nullable`1>] [[-Theme] <ConsoleTheme>] [<CommonParameters>]
```
