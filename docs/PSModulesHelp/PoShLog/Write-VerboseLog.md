Write-VerboseLog
----------------

### Synopsis
Writes Verbose log message

---

### Description

Write a log event with the Verbose level.

---

### Examples
> EXAMPLE 1

```PowerShell
Write-VerboseLog 'Verbose log message'
```
> EXAMPLE 2

```PowerShell
Write-VerboseLog -MessageTemplate 'Processed {@Position} in {Elapsed:000} ms.' -PropertyValues $position, $elapsedMs
```
> EXAMPLE 3

```PowerShell
Write-VerboseLog 'Error occured' -Exception ([System.Exception]::new('Some exception'))
```

---

### Parameters
#### **MessageTemplate**
Message template describing the event.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|true    |1       |true (ByValue)|

#### **Logger**
Instance of Serilog.Logger. By default static property [Serilog.Log]::Logger is used.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[ILogger]`|false   |named   |false        |

#### **Exception**
Exception related to the event.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Exception]`|false   |named   |false        |

#### **ErrorRecord**
ErrorRecord related to the event.

|Type           |Required|Position|PipelineInput|Aliases|
|---------------|--------|--------|-------------|-------|
|`[ErrorRecord]`|true    |named   |false        |ER     |

#### **PropertyValues**
Objects positionally formatted into the message template.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Object[]]`|false   |named   |false        |

#### **PassThru**
Outputs MessageTemplate populated with PropertyValues into pipeline

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs
MessageTemplate - Message template describing the event.

---

### Outputs
* None or MessageTemplate populated with PropertyValues into pipeline if PassThru specified

---

### Syntax
```PowerShell
Write-VerboseLog [-MessageTemplate] <String> [-Logger <ILogger>] [-Exception <Exception>] [-PropertyValues <Object[]>] [-PassThru] [<CommonParameters>]
```
```PowerShell
Write-VerboseLog [[-MessageTemplate] <String>] [-Logger <ILogger>] [-Exception <Exception>] -ErrorRecord <ErrorRecord> [-PropertyValues <Object[]>] [-PassThru] [<CommonParameters>]
```
