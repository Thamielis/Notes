Rename-RDMGroup
---------------

### Synopsis
Rename the group in a connection

---

### Description

Rename the group in a connection

---

### Parameters
#### **ID**
Specifies the ID of the session to be deleted.
Must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |1       |false        |

#### **NewGroupName**
New group name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Session**
Specifies the session object to modifiy

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSConnection]`|true    |1       |false        |

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
Rename-RDMGroup [-ID] <Guid> [-NewGroupName] <String> [<CommonParameters>]
```
```PowerShell
Rename-RDMGroup [-NewGroupName] <String> [-Session] <PSConnection> [<CommonParameters>]
```
