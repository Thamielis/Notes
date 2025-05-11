Remove-RDMSessionAttachment
---------------------------

### Synopsis
Remove session attachment.

---

### Description

Remove session attachment.

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $session = Get-RDMSession -Name MySession; $attachments = Get-RDMSessionAttachment -Session $session; Update-RDMSessionAttachment -Attachment $attachments[0]
Remove the first attachment in the session.
```

---

### Parameters
#### **Attachment**
Connection.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[PSConnectionAttachment]`|true    |1       |false        |

#### **Force**
Forces removal of the attachment without confirmation by the user. Optional.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |3       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Remove-RDMSessionAttachment -detailed". For technical information, type "Get-Help Remove-RDMSessionAttachment -full".

---

### Syntax
```PowerShell
Remove-RDMSessionAttachment [[-Force]] [-Attachment] <PSConnectionAttachment> [<CommonParameters>]
```
