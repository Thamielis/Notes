Add-SinkElmahIo
---------------

### Synopsis
Writes log events into elmah.io

---

### Description

Writes log events into elmah.io server

---

### Examples
> EXAMPLE 1

```PowerShell
New-Logger | Add-SinkElmahIo -ApiKey 'API_KEY' -LogId 'LOG_ID' | Start-Logger
```

---

### Parameters
#### **LoggerConfig**
Instance of LoggerConfiguration

|Type                   |Required|Position|PipelineInput |
|-----------------------|--------|--------|--------------|
|`[LoggerConfiguration]`|true    |1       |true (ByValue)|

#### **ApiKey**
The API key available on the elmah.io UI

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **LogId**
The log ID available on the elmah.io UI

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

#### **RestrictedToMinimumLevel**
The minimum level for events passed through the sink.
Valid Values:

* Verbose
* Debug
* Information
* Warning
* Error
* Fatal

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[LogEventLevel]`|false   |4       |false        |

---

### Inputs
Instance of LoggerConfiguration

---

### Outputs
* LoggerConfiguration object allowing method chaining

---

### Syntax
```PowerShell
Add-SinkElmahIo [-LoggerConfig] <LoggerConfiguration> [-ApiKey] <String> [-LogId] <String> [[-RestrictedToMinimumLevel] {Verbose | Debug | Information | Warning | Error | Fatal}] [<CommonParameters>]
```
