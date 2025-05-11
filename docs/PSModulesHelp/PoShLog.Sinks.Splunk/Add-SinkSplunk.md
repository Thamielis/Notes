Add-SinkSplunk
--------------

### Synopsis
Adds a sink that writes log events to a Splunk instance via the HTTP Event Collector.

---

### Description

This function adds a sink that writes log events to a Splunk instance using the HTTP Event Collector.
It requires the configuration, Splunk host, event collector token, and other optional parameters to be provided.

---

### Parameters
#### **LoggerConfig**
The logger configuration to add this sink to.

|Type                   |Required|Position|PipelineInput |
|-----------------------|--------|--------|--------------|
|`[LoggerConfiguration]`|true    |1       |true (ByValue)|

#### **SplunkHost**
The Splunk host that is configured with an Event Collector.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **EventCollectorToken**
The token provided to authenticate to the Splunk Event Collector.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

#### **UriPath**
(Optional) Change the default endpoint of the Event Collector, e.g., services/collector/event.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **Source**
(Optional) The source of the event.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **SourceType**
(Optional) The source type of the event.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **HostName**
(Optional) The host that generated the event.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **Index**
(Optional) The Splunk index to log to.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |

#### **RestrictedToMinimumLevel**
(Optional) The minimum log event level required in order to write an event to the sink.
Valid Values:

* Verbose
* Debug
* Information
* Warning
* Error
* Fatal

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[LogEventLevel]`|false   |9       |false        |

#### **FormatProvider**
(Optional) Supplies culture-specific formatting information, or null.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[IFormatProvider]`|false   |10      |false        |

#### **DontRenderTemplate**
(Optional) If supplied, the message template will not be rendered.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **BatchIntervalSeconds**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |11      |false        |

#### **BatchSizeLimit**
(Optional) The size of the batch.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |12      |false        |

#### **QueueLimit**
(Optional) Maximum number of events in the queue.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |13      |false        |

#### **HttpMessageHandler**
(Optional) The handler used to send HTTP requests.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[HttpMessageHandler]`|false   |14      |false        |

#### **LevelSwitch**
(Optional) A switch allowing the pass-through minimum level to be changed at runtime.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[LoggingLevelSwitch]`|false   |15      |false        |

---

### Outputs
* Serilog.LoggerConfiguration

---

### Syntax
```PowerShell
Add-SinkSplunk [-LoggerConfig] <LoggerConfiguration> [-SplunkHost] <String> [-EventCollectorToken] <String> [[-UriPath] <String>] [[-Source] <String>] [[-SourceType] <String>] [[-HostName] <String>] [[-Index] <String>] [[-RestrictedToMinimumLevel] {Verbose | Debug | Information | Warning | Error | Fatal}] [[-FormatProvider] <IFormatProvider>] [-DontRenderTemplate] [[-BatchIntervalSeconds] <Int32>] [[-BatchSizeLimit] <Int32>] [[-QueueLimit] <Nullable`1>] [[-HttpMessageHandler] <HttpMessageHandler>] [[-LevelSwitch] <LoggingLevelSwitch>] [<CommonParameters>]
```
