Add-SinkDataDog
---------------

### Synopsis
Writes log events into seq

---

### Description

Writes log events into seq server

---

### Related Links
* [https://github.com/DataDog/serilog-sinks-datadog-logs](https://github.com/DataDog/serilog-sinks-datadog-logs)

* [https://docs.datadoghq.com/getting_started/tagging/unified_service_tagging/](https://docs.datadoghq.com/getting_started/tagging/unified_service_tagging/)

---

### Examples
> EXAMPLE 1

```PowerShell
New-Logger | Add-SinkDataDog -ApiKey abc123 | Start-Logger
```

---

### Parameters
#### **LoggerConfig**
Instance of LoggerConfiguration

|Type                   |Required|Position|PipelineInput |
|-----------------------|--------|--------|--------------|
|`[LoggerConfiguration]`|true    |named   |true (ByValue)|

#### **ApiKey**
Your Datadog API key.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Source**
The integration name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Service**
The service name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **HostName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Environment**
Add the env tag with the provided value.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Tags**
Custom tags in key:value format.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Configuration**
The Datadog logs client configuration.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[DatadogConfiguration]`|false   |named   |false        |

#### **ConfigurationSection**
A config section defining the datadog configuration.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[IConfigurationSection]`|false   |named   |false        |

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

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **Period**
The time to wait between checking for event batches

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **QueueSizeLimit**
Maximum number of events to hold in the sink's internal queue , or $null
      for an unbounded queue. The default is 10000.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **ExceptionHandler**
This function is called when an exception occurs when using
      DatadogConfiguration.UseTCP=false (the default configuration)
eg. [Action[Exception]]{param ([Exception]$e) Write-Error -Message "DataDog Serilog Sink encountered an error" -Exception $e}

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Action`1]`|false   |named   |false        |

#### **DetectTCPDisconnection**

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

---

### Inputs
Serilog.LoggerConfiguration

---

### Outputs
* Serilog.LoggerConfiguration

---

### Syntax
```PowerShell
Add-SinkDataDog -LoggerConfig <LoggerConfiguration> [-ApiKey <String>] [-Source <String>] [-Service <String>] [-HostName <String>] [-Environment <String>] [-Tags <String[]>] [-Configuration <DatadogConfiguration>] [-ConfigurationSection <IConfigurationSection>] [-RestrictedToMinimumLevel {Verbose | Debug | Information | Warning | Error | Fatal}] [-BatchPostingLimit <Nullable`1>] [-Period <Nullable`1>] [-QueueSizeLimit <Nullable`1>] [-ExceptionHandler <Action`1>] [-DetectTCPDisconnection <Boolean>] [<CommonParameters>]
```
