Enable-RemotePsRemoting
-----------------------

### Synopsis
Enables PowerShell Remoting on a remote computer. Requires that the machine
responds to WMI requests, and that its operating system is Windows Vista or
later.

---

### Description

---

### Examples
> EXAMPLE 1

Enable-RemotePsRemoting <Computer>

---

### Parameters
#### **Computername**
The computer on which to enable remoting

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **Credential**
The credential to use when connecting

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

---

### Syntax
```PowerShell
Enable-RemotePsRemoting [[-Computername] <Object>] [[-Credential] <Object>] [<CommonParameters>]
```
