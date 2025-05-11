Start-ProcessAsUser
-------------------

### Synopsis
Launch a process under alternate credentials, providing functionality
similar to runas.exe.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
$file = Join-Path ([Environment]::GetFolderPath("System")) certmgr.msc
PS > Start-ProcessAsUser Administrator mmc $file
```

---

### Parameters
#### **Credential**
The credential to launch the process under

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **Process**
The process to start

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **ArgumentList**
Any arguments to pass to the process

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

---

### Syntax
```PowerShell
Start-ProcessAsUser [[-Credential] <Object>] [-Process] <String> [[-ArgumentList] <String>] [<CommonParameters>]
```
