Rename-RDMGroup
---------------

### Synopsis
Rename the group in a connection

---

### Description

Rename the group in a connection. All entries contained in the folder will also be updated.

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

#### **ID**
Specifies the ID of the session to be renamed.
Must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

#### **NewGroupName**
New group name. Must not include '\'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Session**
Specifies the session object to modifiy

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSConnection]`|true    |named   |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Rename-RDMGroup -detailed". For technical information, type "Get-Help Rename-RDMGroup -full".

---

### Syntax
```PowerShell
Rename-RDMGroup -ID <Guid> -NewGroupName <String> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Rename-RDMGroup -NewGroupName <String> -Session <PSConnection> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
