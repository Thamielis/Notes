New-SinkDataDogConfiguration
----------------------------

### Synopsis
Return a Datadog client configuration.

---

### Description

Return a Datadog client configuration that can be supplied as a parameter to Add-SinkDataDog.
This is important if you need to provide a different Url.

---

### Related Links
* [https://docs.datadoghq.com/logs/log_collection/?tab=host#supported-endpoints](https://docs.datadoghq.com/logs/log_collection/?tab=host#supported-endpoints)

---

### Examples
> EXAMPLE 1

```PowerShell
$config = New-SinkDataDogConfiguration -Url = "https://http-intake.logs.us3.datadoghq.com"
PS> New-Logger | Add-SinkDataDog -ApiKey abc123 -Configuration $config | Start-Logger
```

---

### Parameters
#### **Url**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Port**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |false        |

#### **UseSsl**

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |3       |false        |

#### **UseTcp**

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |4       |false        |

---

### Inputs
String

---

### Outputs
* Serilog.Sinks.Datadog.Logs.DatadogConfiguration

---

### Syntax
```PowerShell
New-SinkDataDogConfiguration [[-Url] <String>] [[-Port] <Int32>] [[-UseSsl] <Boolean>] [[-UseTcp] <Boolean>] [<CommonParameters>]
```
