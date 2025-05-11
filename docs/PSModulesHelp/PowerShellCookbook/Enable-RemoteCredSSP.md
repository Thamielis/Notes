Enable-RemoteCredSSP
--------------------

### Synopsis
Enables CredSSP support on a remote computer. Requires that the machine
have PowerShell Remoting enabled, and that its operating system is Windows
Vista or later.

---

### Description

---

### Examples
> EXAMPLE 1

Enable-RemoteCredSSP <Computer>

---

### Parameters
#### **Computername**
The computer on which to enable CredSSP

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
Enable-RemoteCredSSP [[-Computername] <Object>] [[-Credential] <Object>] [<CommonParameters>]
```
