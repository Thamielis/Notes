Add-SinkHttp
------------

### Synopsis
Writes log events into given server over the network using HTTP

---

### Description

Adds a non-durable sink that sends log events using HTTP POST over the network.

A non-durable sink will lose data after a system or process restart.

---

### Examples
> EXAMPLE 1

```PowerShell
PS> New-Logger | Add-SinkHttp -RequestUri 'https://requestbin.net/r/6y06j5z8' | Start-Logger
```

---

### Parameters
#### **LoggerConfig**

|Type                           |Required|Position|PipelineInput |
|-------------------------------|--------|--------|--------------|
|`[Serilog.LoggerConfiguration]`|true    |0       |true (ByValue)|

#### **RequestUri**

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[System.String]`|true    |named   |false        |

#### **BatchPostingLimit**

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[System.Int32]`|false   |named   |false        |

#### **QueueLimit**

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[System.Int32]`|false   |named   |false        |

#### **Period**

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[System.TimeSpan]`|false   |named   |false        |

#### **TextFormatter**

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[Serilog.Formatting.ITextFormatter]`|false   |named   |false        |

#### **BatchFormatter**

|Type                                  |Required|Position|PipelineInput|
|--------------------------------------|--------|--------|-------------|
|`[Serilog.Sinks.Http.IBatchFormatter]`|false   |named   |false        |

#### **RestrictedToMinimumLevel**
Possible values: Verbose, Debug, Information, Warning, Error, Fatal
Valid Values:

* Verbose
* Debug
* Information
* Warning
* Error
* Fatal

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[Serilog.Events.LogEventLevel]`|false   |named   |false        |

#### **HttpClient**

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[Serilog.Sinks.Http.IHttpClient]`|false   |named   |false        |

#### **Configuration**

|Type                                                 |Required|Position|PipelineInput|
|-----------------------------------------------------|--------|--------|-------------|
|`[Microsoft.Extensions.Configuration.IConfiguration]`|false   |named   |false        |

---

### Inputs
Serilog.LoggerConfiguration

---

### Outputs
* Serilog.LoggerConfiguration

---

### Syntax
```PowerShell
Add-SinkHttp [-LoggerConfig] <LoggerConfiguration> -RequestUri <string> [-BatchFormatter <IBatchFormatter>] [-BatchPostingLimit <int>] [-Configuration <IConfiguration>] [-HttpClient <IHttpClient>] [-Period <TimeSpan>] [-QueueLimit <int>] [-RestrictedToMinimumLevel {Verbose | Debug | Information | Warning | Error | Fatal}] [-TextFormatter <ITextFormatter>] [<CommonParameters>]
```
