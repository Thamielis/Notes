Invoke-BinaryProcess
--------------------

### Synopsis
Invokes a process that emits or consumes binary data.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
Invoke-BinaryProcess binaryProcess.exe -RedirectOutput -ArgumentList "-Emit" |
       Invoke-BinaryProcess binaryProcess.exe -RedirectInput -ArgumentList "-Consume"
```

---

### Parameters
#### **ProcessName**
The name of the process to invoke

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **RedirectInput**
Specifies that input to the process should be treated as
binary

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |false        |Input  |

#### **RedirectOutput**
Specifies that the output of the process should be treated
as binary

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |false        |Output |

#### **ArgumentList**
Specifies the arguments for the process

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

---

### Syntax
```PowerShell
Invoke-BinaryProcess [[-ProcessName] <String>] [-RedirectInput] [-RedirectOutput] [[-ArgumentList] <String>] [<CommonParameters>]
```
