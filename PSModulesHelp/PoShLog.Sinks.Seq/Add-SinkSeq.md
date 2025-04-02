Add-SinkSeq
-----------

### Synopsis
Writes log events into seq

---

### Description

Writes log events into seq server

---

### Examples
> EXAMPLE 1

```PowerShell
New-Logger | Add-SinkSeq -ServerUrl 'http://localhost:5341' | Start-Logger
```

---

### Parameters
#### **LoggerConfig**
Instance of LoggerConfiguration

|Type                   |Required|Position|PipelineInput |
|-----------------------|--------|--------|--------------|
|`[LoggerConfiguration]`|true    |named   |true (ByValue)|

#### **ServerUrl**
The base URL of the Seq server that log events will be written to.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

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
|`[LogEventLevel]`|false   |named   |false        |

#### **BatchPostingLimit**
The maximum number of events to post in a single batch.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Period**
The time to wait between checking for event batches

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **ApiKey**
A Seq API key that authenticates the client to the Seq server

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **BufferSizeLimitBytes**
The maximum amount of data, in bytes, to which the buffer log file for a specific date will be allowed to grow. By default no limit will be applied.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **EventBodyLimitBytes**
The maximum size, in bytes, that the JSON representation of an event may take before it is dropped rather than being sent to the Seq server. Specify null for no limit.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **ControlLevelSwitch**
If provided, the switch will be updated based on the Seq server's level setting 
for the corresponding API key. Passing the same key to MinimumLevel.ControlledBy() will make the whole pipeline
dynamically controlled. Do not specify parameter RestrictedToMinimumLevel with this setting.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[LoggingLevelSwitch]`|false   |named   |false        |

#### **MessageHandler**
Used to construct the HttpClient that will send the log messages to Seq.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[HttpMessageHandler]`|false   |named   |false        |

#### **RetainedInvalidPayloadsLimitBytes**
A soft limit for the number of bytes to use for storing failed requests. 
The limit is soft in that it can be exceeded by any single error payload, but in that case only that single error payload will be retained.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **Compact**
Use the compact log event format defined by Serilog.Formatting.Compact. Has no effect on durable log shipping.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **QueueSizeLimit**
The maximum number of events that will be held in-memory while waiting to ship them to Seq.
Beyond this limit, events will be dropped. The default is 100,000. Has no effect on durable log shipping.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs
Instance of LoggerConfiguration

---

### Outputs
* LoggerConfiguration object allowing method chaining

---

### Syntax
```PowerShell
Add-SinkSeq -LoggerConfig <LoggerConfiguration> -ServerUrl <String> [-RestrictedToMinimumLevel {Verbose | Debug | Information | Warning | Error | Fatal}] [-BatchPostingLimit <Int32>] [-Period <Nullable`1>] [-ApiKey <String>] [-BufferSizeLimitBytes <Nullable`1>] [-EventBodyLimitBytes <Nullable`1>] [-ControlLevelSwitch <LoggingLevelSwitch>] [-MessageHandler <HttpMessageHandler>] [-RetainedInvalidPayloadsLimitBytes <Nullable`1>] [-Compact <Boolean>] [-QueueSizeLimit <Int32>] [<CommonParameters>]
```
