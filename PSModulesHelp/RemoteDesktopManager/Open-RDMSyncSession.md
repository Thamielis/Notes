Open-RDMSyncSession
-------------------

### Synopsis
Open the the specified sync session.

---

### Description

Open the the specified sync session.

---

### Related Links
* [Open-RDMSession](Open-RDMSession)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $result = Open-RDMSyncSession -ID "{00000000-0000-0000-0000-000000000000}"
Open the sync session with ID = "{00000000-0000-0000-0000-000000000000}".
```

---

### Parameters
#### **DontSetSessions**
Don't save the new sessions into the data source

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Switch]`|false   |2       |true (ByValue)|

#### **ID**
Specifies the ID of the session to open.
Must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}.

|Type    |Required|Position|PipelineInput |
|--------|--------|--------|--------------|
|`[Guid]`|true    |1       |true (ByValue)|

#### **Session**
Specifies the PSConnection to open

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSConnection]`|true    |1       |true (ByValue)|

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Open-RDMSyncSession -detailed". For technical information, type "Get-Help Open-RDMSyncSession -full".

---

### Syntax
```PowerShell
Open-RDMSyncSession [-ID] <Guid> [[-DontSetSessions]] [<CommonParameters>]
```
```PowerShell
Open-RDMSyncSession [-Session] <PSConnection> [[-DontSetSessions]] [<CommonParameters>]
```
