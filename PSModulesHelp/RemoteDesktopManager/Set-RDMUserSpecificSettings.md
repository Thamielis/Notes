Set-RDMUserSpecificSettings
---------------------------

### Synopsis
Save user specific settings in a session

---

### Description

Save user specific settings in a session

---

### Parameters
#### **Session**
PSConnection object, must be retrieved from Get-RDMSession or created via New-RDMSession.

|Type            |Required|Position|PipelineInput|Aliases   |
|----------------|--------|--------|-------------|----------|
|`[PSConnection]`|true    |1       |false        |Connection|

#### **UserSpecificSettings**
User specific settings, must be retrieved from Get-RDMUserSpecificSettings.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[BaseConnectionOverride]`|true    |2       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-RDMUserSpecificSettings -detailed". For technical information, type "Get-Help Set-RDMUserSpecificSettings -full".

---

### Syntax
```PowerShell
Set-RDMUserSpecificSettings [-Session] <PSConnection> [-UserSpecificSettings] <BaseConnectionOverride> [<CommonParameters>]
```
