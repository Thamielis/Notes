Set-MinimumLevel
----------------

### Synopsis
Sets current minimum level of logger configuration

---

### Description

Sets current minimum level of logger configuration, below which no events should be generated.

---

### Examples
> EXAMPLE 1

```PowerShell
New-Logger | Set-MinimumLevel -Value Verbose | Add-SinkConsole | Start-Logger
```
> EXAMPLE 2

```PowerShell
New-Logger | Set-MinimumLevel -Value Verbose -ToPreference | Add-SinkConsole | Start-Logger
```
> EXAMPLE 3

```PowerShell
New-Logger | Set-MinimumLevel -ControlledBy $levelSwitch | Add-SinkConsole | Start-Logger
```
> EXAMPLE 4

```PowerShell
New-Logger | Set-MinimumLevel -FromPreference | Add-SinkConsole | Start-Logger
```

---

### Parameters
#### **LoggerConfig**
Instance of LoggerConfiguration

|Type                   |Required|Position|PipelineInput |
|-----------------------|--------|--------|--------------|
|`[LoggerConfiguration]`|true    |named   |true (ByValue)|

#### **Value**
The current minimum level, below which no events should be generated.
Valid Values:

* Verbose
* Debug
* Information
* Warning
* Error
* Fatal

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[LogEventLevel]`|true    |named   |false        |

#### **ToPreference**
Set to propagate desired minimum level to preference variables.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ControlledBy**
Sets the minimum level to be dynamically controlled by the provided switch

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[LoggingLevelSwitch]`|true    |named   |false        |

#### **FromPreference**
Sets the minimum level according to the lowest preference variable. For example if $DebugPreference -eq 'Continue' and $VerbosePreference -eq 'SilentlyContinue' then minimum level will be Debug.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs
Instance of LoggerConfiguration

---

### Outputs
* Instance of LoggerConfiguration object allowing method chaining with altered minumum logging level

---

### Syntax
```PowerShell
Set-MinimumLevel -LoggerConfig <LoggerConfiguration> -Value {Verbose | Debug | Information | Warning | Error | Fatal} [-ToPreference] [<CommonParameters>]
```
```PowerShell
Set-MinimumLevel -LoggerConfig <LoggerConfiguration> -ControlledBy <LoggingLevelSwitch> [<CommonParameters>]
```
```PowerShell
Set-MinimumLevel -LoggerConfig <LoggerConfiguration> -FromPreference [<CommonParameters>]
```
