Set-RDMPrivateSession
---------------------

### Synopsis
Save the session in the user private vault

---

### Description

Save the session in the user private vault

---

### Parameters
#### **Refresh**
Send refresh notification to Remote Desktop Manager application.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |2       |false        |

#### **Session**
PSSession object, must be retrieved from Get-RDMSession or Get-RDMPrivateSession or created via New-RDMSession.

|Type              |Required|Position|PipelineInput |
|------------------|--------|--------|--------------|
|`[PSConnection[]]`|true    |1       |true (ByValue)|

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-RDMPrivateSession -detailed". For technical information, type "Get-Help Set-RDMPrivateSession -full".

---

### Syntax
```PowerShell
Set-RDMPrivateSession [-Session] <PSConnection[]> [[-Refresh]] [<CommonParameters>]
```
