Set-RDMUserSpecificSettings
---------------------------

### Synopsis
Save user specific settings in a session

---

### Description

Save user specific settings in a session

---

### Parameters
#### **ForcePromptAnswer**
Switch to use with caution. It will automatically answer prompt asking yes/no, yes/no/cancel, or ok/cancel questions. In case of multiple prompts, multiple values can be passed to this parameter. Here are the accepted values:
* Yes: Accept the prompt. Cover the OK and Automatic value.
* No: Refuse the yes/no/cancel prompt. Cancel is the fallback option if there is not an option No.
* Cancel: Cancel the yes/no/cancel prompt. No is the fallback option if there is not an option Cancel.
Valid Values:

* Cancel
* No
* Yes

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[DialogResult[]]`|false   |named   |false        |

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
Set-RDMUserSpecificSettings [-Session] <PSConnection> [-UserSpecificSettings] <BaseConnectionOverride> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
