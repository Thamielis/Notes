Update-RDMSessionAttachment
---------------------------

### Synopsis
Update attachment document.

---

### Description

Update attachment document.

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $session = Get-RDMSession -Name MySession; $attachments = Get-RDMSessionAttachment -Session $session; Update-RDMSessionAttachment -Attachment $attachments[0] -Filename 'C:\Mytestfile.txt'
Update the first attachment to the document at 'C:\Mytestfile.txt'.
```

---

### Parameters
#### **Attachment**
Attachment to update the document to.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[PSConnectionAttachment]`|true    |1       |false        |

#### **Filename**
New document filename

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **Refresh**
Send refresh notification to Remote Desktop Manager application.

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
For more information, type "Get-Help Update-RDMSessionAttachment -detailed". For technical information, type "Get-Help Update-RDMSessionAttachment -full".

---

### Syntax
```PowerShell
Update-RDMSessionAttachment [[-Refresh]] [-Attachment] <PSConnectionAttachment> [-Filename] <String> [<CommonParameters>]
```
