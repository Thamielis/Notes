Send-File
---------

### Synopsis
Sends a file to a remote session.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
$session = New-PsSession leeholmes1c23
PS > Send-File c:\temp\test.exe c:\temp\test.exe $session
```

---

### Parameters
#### **Source**
The path on the local computer

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

#### **Destination**
The target path on the remote computer

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |2       |false        |

#### **Session**
The session that represents the remote computer

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[PSSession]`|true    |3       |false        |

---

### Syntax
```PowerShell
Send-File [-Source] <Object> [-Destination] <Object> [-Session] <PSSession> [<CommonParameters>]
```
