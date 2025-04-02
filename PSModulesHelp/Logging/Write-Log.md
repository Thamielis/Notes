Write-Log
---------

### Synopsis
Emits a log record

---

### Description

This function write a log record to configured targets with the matching level

---

### Related Links
* [https://logging.readthedocs.io/en/latest/functions/Write-Log.md](https://logging.readthedocs.io/en/latest/functions/Write-Log.md)

* [https://logging.readthedocs.io/en/latest/functions/Add-LoggingLevel.md](https://logging.readthedocs.io/en/latest/functions/Add-LoggingLevel.md)

* [https://github.com/EsOsO/Logging/blob/master/Logging/public/Write-Log.ps1](https://github.com/EsOsO/Logging/blob/master/Logging/public/Write-Log.ps1)

---

### Examples
> EXAMPLE 1

```PowerShell
Write-Log 'Hello, World!'
```
> EXAMPLE 2

```PowerShell
Write-Log -Level ERROR -Message 'Hello, World!'
```
> EXAMPLE 3

```PowerShell
Write-Log -Level ERROR -Message 'Hello, {0}!' -Arguments 'World'
```
> EXAMPLE 4

```PowerShell
Write-Log -Level ERROR -Message 'Hello, {0}!' -Arguments 'World' -Body @{Server='srv01.contoso.com'}
```

---

### Parameters
#### **Message**
The text message to write

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

#### **Arguments**
An array of objects used to format <Message>

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Array]`|false   |4       |false        |

#### **Body**
An object that can contain additional log metadata (used in target like ElasticSearch)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |5       |false        |

#### **ExceptionInfo**
An optional ErrorRecord

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ErrorRecord]`|false   |6       |false        |

---

### Syntax
```PowerShell
Write-Log [-Message] <String> [[-Arguments] <Array>] [[-Body] <Object>] [[-ExceptionInfo] <ErrorRecord>] [<CommonParameters>]
```
