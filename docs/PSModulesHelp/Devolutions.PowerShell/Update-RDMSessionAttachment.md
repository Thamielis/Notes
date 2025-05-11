Update-RDMSessionAttachment
---------------------------

### Synopsis
Update session attachment

---

### Description

Update session attachment. Only advanced data sources support attachment. The user must have the permission to edit attachments.

---

### Related Links
* [Add-RDMSessionAttachment](Add-RDMSessionAttachment)

* [Get-RDMSessionAttachment](Get-RDMSessionAttachment)

* [Set-RDMSessionAttachment](Set-RDMSessionAttachment)

* [Add-RDMPrivateSessionAttachment](Add-RDMPrivateSessionAttachment)

* [Get-RDMPrivateSessionAttachment](Get-RDMPrivateSessionAttachment)

* [Set-RDMPrivateSessionAttachment](Set-RDMPrivateSessionAttachment)

* [Remove-RDMSessionAttachment](Remove-RDMSessionAttachment)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $session = Get-RDMSession -Name MySession;
        $attachments = Get-RDMSessionAttachment -Session $session;
        Update-RDMSessionAttachment -Attachment $attachments[0] -Filename 'C:\\Mytestfile.txt'
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

#### **Refresh**
Send refresh notification to Remote Desktop Manager application.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
Update-RDMSessionAttachment [-Attachment] <PSConnectionAttachment> [-Filename] <String> [-Refresh] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
