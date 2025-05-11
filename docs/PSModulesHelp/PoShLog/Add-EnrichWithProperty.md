Add-EnrichWithProperty
----------------------

### Synopsis
Enriches log events with custom property.

---

### Description

Enriches log events with custom property. For example script name.

---

### Examples
> EXAMPLE 1

```PowerShell
New-Logger | Add-EnrichWithProperty -Name ScriptName -Value 'Test' | Add-SinkConsole | Start-Logger
```

---

### Parameters
#### **LoggerConfig**
Instance of LoggerConfiguration

|Type                   |Required|Position|PipelineInput |
|-----------------------|--------|--------|--------------|
|`[LoggerConfiguration]`|true    |1       |true (ByValue)|

#### **Name**
The name of the property

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **Value**
The value of the property

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

#### **DestructureObjects**
If true, and the value is a non-primitive, non-array type, then the value will be converted to a structure; otherwise, unknown types will be converted to scalars, which are generally stored as strings.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |4       |false        |

---

### Inputs
None

---

### Outputs
* LoggerConfiguration object allowing method chaining

---

### Syntax
```PowerShell
Add-EnrichWithProperty [-LoggerConfig] <LoggerConfiguration> [-Name] <String> [-Value] <String> [[-DestructureObjects] <Boolean>] [<CommonParameters>]
```
