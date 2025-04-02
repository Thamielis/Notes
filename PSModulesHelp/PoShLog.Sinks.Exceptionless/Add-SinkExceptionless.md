Add-SinkExceptionless
---------------------

### Synopsis

Add-SinkExceptionless [-loggerConfig] <LoggerConfiguration> [-ApiKey] <string> [[-ServerUrl] <string>] [[-AdditionalOperation] <Func[EventBuilder,EventBuilder]>] [[-IncludeProperties] <bool>] [[-RestrictedToMinimumLevel] <LogEventLevel>] [<CommonParameters>]

---

### Description

---

### Parameters
#### **AdditionalOperation**

|Type                               |Required|Position|PipelineInput|
|-----------------------------------|--------|--------|-------------|
|`[Func[EventBuilder,EventBuilder]]`|false   |3       |false        |

#### **ApiKey**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|true    |1       |false        |

#### **IncludeProperties**

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[bool]`|false   |4       |false        |

#### **RestrictedToMinimumLevel**

Valid Values:

* Verbose
* Debug
* Information
* Warning
* Error
* Fatal

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[LogEventLevel]`|false   |5       |false        |

#### **ServerUrl**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |2       |false        |

#### **loggerConfig**

|Type                   |Required|Position|PipelineInput |
|-----------------------|--------|--------|--------------|
|`[LoggerConfiguration]`|true    |0       |true (ByValue)|

---

### Inputs
Serilog.LoggerConfiguration

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Syntax
```PowerShell
syntaxItem
```
```PowerShell
----------
```
```PowerShell
{@{name=Add-SinkExceptionless; CommonParameters=True; parameter=System.Object[]}}
```
