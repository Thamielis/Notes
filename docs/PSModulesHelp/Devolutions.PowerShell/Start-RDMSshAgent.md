Start-RDMSshAgent
-----------------

### Synopsis

---

### Description

---

### Parameters
#### **Name**
Agent name. In a Windows environment, it is a string representing the agent name (\\.\pipe\youragentname). For the others platforms, it is the socket path (/yoursocketpath).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **VerboseLevel**
Verbose level of the log. Level 2 is for debugging.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Start-RDMSshAgent -detailed". For technical information, type "Get-Help Start-RDMSshAgent -full".

---

### Syntax
```PowerShell
Start-RDMSshAgent [-Name] <String> [[-VerboseLevel] <Int32>] [<CommonParameters>]
```
