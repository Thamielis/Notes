Get-RDMUserSpecificSettings
---------------------------

### Synopsis
Get the session user specific settings

---

### Description

Get the session user specific settings

---

### Parameters
#### **Session**
PSConnection object, must be retrieved from Get-RDMSession or created via New-RDMSession.

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSConnection]`|true    |1       |true (ByValue)|

---

### Inputs
None

---

### Outputs
* Devolutions.RemoteDesktopManager.Business.BaseConnectionOverride

---

### Notes
For more information, type "Get-Help Get-RDMUserSpecificSettings -detailed". For technical information, type "Get-Help Get-RDMUserSpecificSettings -full".

---

### Syntax
```PowerShell
Get-RDMUserSpecificSettings [-Session] <PSConnection> [<CommonParameters>]
```
