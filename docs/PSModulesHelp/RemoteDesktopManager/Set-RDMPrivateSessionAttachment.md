Set-RDMPrivateSessionAttachment
-------------------------------

### Synopsis
Save/set the session.

---

### Description

Save/set the session. Session must be first fetch via Session property of the Get-RDM-Session cmdlet or via the New-RDMSession result.

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $list = Get-RDMUserVaultSession; $list[1].Name = "New Name";Set-RDMUserVaultSession $list[1]
Retrieves the list of available sessions, modify the name of the second session, update the session.
```

---

### Parameters
#### **Attachment**
PSSession object, must be retrieved from Get-RDMSession or created via New-RDMSession.

|Type                        |Required|Position|PipelineInput |
|----------------------------|--------|--------|--------------|
|`[PSConnectionAttachment[]]`|true    |1       |true (ByValue)|

#### **Refresh**
Send refresh notification to Remote Desktop Manager application.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |2       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-RDMPrivateSessionAttachment -detailed". For technical information, type "Get-Help Set-RDMPrivateSessionAttachment -full".

---

### Syntax
```PowerShell
Set-RDMPrivateSessionAttachment [-Attachment] <PSConnectionAttachment[]> [[-Refresh]] [<CommonParameters>]
```
