Start-Logger
------------

### Synopsis
Starts logging

---

### Description

Creates new instance of logger, that writes to configured sinks.

---

### Examples
> EXAMPLE 1

```PowerShell
New-Logger | Add-SinkConsole | Start-Logger
```
> EXAMPLE 2

```PowerShell
Start-Logger
```
> EXAMPLE 3

```PowerShell
Start-Logger -MinimumLevel Verbose -Console -FilePath 'C:\Data\test.log' -FileRollingInterval Day
```

---

### Parameters
#### **LoggerConfig**
Instance of LoggerConfiguration that is already setup.

|Type                   |Required|Position|PipelineInput |
|-----------------------|--------|--------|--------------|
|`[LoggerConfiguration]`|true    |named   |true (ByValue)|

#### **MinimumLevel**
Configures the minimum level at which events will be passed to sinks. All messages with levels beneath this level will be ignored.
Valid Values:

* Verbose
* Debug
* Information
* Warning
* Error
* Fatal

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[LogEventLevel]`|false   |named   |false        |

#### **Console**
Setups Console sink. All messages will be writen to console host.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PowerShell**
Setups PowerShell console sink. All messages will be writen to powershell host.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **FilePath**
Setups File sink at given path. All messages will be written to given file path.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FileRollingInterval**
The interval at which logging will roll over to a new file.
Valid Values:

* Infinite
* Year
* Month
* Day
* Hour
* Minute

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[RollingInterval]`|false   |named   |false        |

#### **SetAsDefault**
Assigns created logger into static static property [Serilog.Log]::Logger that can be used globally. Works only together with PassThru parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PassThru**
Outputs instance of Serilog.Logger into pipeline

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs
Instance of LoggerConfiguration

---

### Outputs
* None

---

### Syntax
```PowerShell
Start-Logger -LoggerConfig <LoggerConfiguration> [-SetAsDefault] [-PassThru] [<CommonParameters>]
```
```PowerShell
Start-Logger [-MinimumLevel {Verbose | Debug | Information | Warning | Error | Fatal}] [-Console] [-PowerShell] [-FilePath <String>] [-FileRollingInterval {Infinite | Year | Month | Day | Hour | Minute}] [-SetAsDefault] [-PassThru] [<CommonParameters>]
```
