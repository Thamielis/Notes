Remove-RDMSessionAttachment
---------------------------

### Synopsis
Remove session attachment

---

### Description

Remove session attachment. Only advanced data sources support attachment. The user must have the permission to delete attachments.

---

### Related Links
* [Add-RDMSessionAttachment](Add-RDMSessionAttachment)

* [Get-RDMSessionAttachment](Get-RDMSessionAttachment)

* [Set-RDMSessionAttachment](Set-RDMSessionAttachment)

* [Add-RDMPrivateSessionAttachment](Add-RDMPrivateSessionAttachment)

* [Get-RDMPrivateSessionAttachment](Get-RDMPrivateSessionAttachment)

* [Set-RDMPrivateSessionAttachment](Set-RDMPrivateSessionAttachment)

* [Update-RDMSessionAttachment](Update-RDMSessionAttachment)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $session = Get-RDMSession -Name MySession;
        $attachments = Get-RDMSessionAttachment -Session $session;
        Remove-RDMSessionAttachment -Attachment $attachments[0]
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
|`[Switch]`|false   |named   |false        |

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
Remove-RDMSessionAttachment [-Attachment] <PSConnectionAttachment> [-Force] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
