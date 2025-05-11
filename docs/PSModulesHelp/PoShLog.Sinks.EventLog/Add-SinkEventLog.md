Add-SinkEventLog
----------------

### Synopsis
Writes log events to console host

---

### Description

Writes log events to console host

---

### Examples
> EXAMPLE 1

```PowerShell
Add-SinkEventLog -Source 'SampleScript' -ManageEventSource $true
```

---

### Parameters
#### **LoggerConfig**
Instance of LoggerConfiguration

|Type                   |Required|Position|PipelineInput |
|-----------------------|--------|--------|--------------|
|`[LoggerConfiguration]`|true    |1       |true (ByValue)|

#### **Source**
The source name by which the application is registered on the local computer.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **LogName**
The name of the log the source's entries are written to. Possible values include Application, System, or a custom event log.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **MachineName**
The name of the machine hosting the event log written to. The local machine by default.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **ManageEventSource**
If true, check/create event source as required.  Defaults to false i.e. do not allow sink to manage event source creation.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **OutputTemplate**
A message template describing the format used to write to the sink.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **FormatProvider**
Supplies culture-specific formatting information, or null.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[IFormatProvider]`|false   |7       |false        |

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
|`[LogEventLevel]`|false   |8       |false        |

#### **EventIdProvider**
Supplies event ids for emitted log events

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[IEventIdProvider]`|false   |9       |false        |

---

### Inputs
Instance of LoggerConfiguration

---

### Outputs
* LoggerConfiguration object allowing method chaining

---

### Syntax
```PowerShell
Add-SinkEventLog [-LoggerConfig] <LoggerConfiguration> [-Source] <String> [[-LogName] <String>] [[-MachineName] <String>] [[-ManageEventSource] <String>] [[-OutputTemplate] <String>] [[-FormatProvider] <IFormatProvider>] [[-RestrictedToMinimumLevel] {Verbose | Debug | Information | Warning | Error | Fatal}] [[-EventIdProvider] <IEventIdProvider>] [<CommonParameters>]
```
