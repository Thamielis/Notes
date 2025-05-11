Set-RDMPrivateSessionAttachment
-------------------------------

### Synopsis
Save attachments in the user vault

---

### Description

Save attachments in the user vault. Only advanced data sources support attachment. The user must have the permission to edit attachments.

---

### Related Links
* [Add-RDMSessionAttachment](Add-RDMSessionAttachment)

* [Get-RDMSessionAttachment](Get-RDMSessionAttachment)

* [Set-RDMSessionAttachment](Set-RDMSessionAttachment)

* [Add-RDMPrivateSessionAttachment](Add-RDMPrivateSessionAttachment)

* [Get-RDMPrivateSessionAttachment](Get-RDMPrivateSessionAttachment)

* [Remove-RDMSessionAttachment](Remove-RDMSessionAttachment)

* [Update-RDMSessionAttachment](Update-RDMSessionAttachment)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $entry = Get-RDMPrivateSession -Name EntryA;
        $attachments = Get-RDMPrivateSessionAttachment -Session $entry;
        $attachments[0].Description = 'New description';
        Set-RDMPrivateSessionAttachment -Attachment $attachments[0]
Get the attachments of the session EntryA in the user vault. Change the description of the desired attachment and save the modification.
```

---

### Parameters
#### **Attachment**
PSSession object, must be retrieved from Get-RDMSession or created via New-RDMSession.

|Type                        |Required|Position|PipelineInput |
|----------------------------|--------|--------|--------------|
|`[PSConnectionAttachment[]]`|true    |1       |true (ByValue)|

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
RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnectionAttachment[]

Array of PSConnectionAttachment to save. Can be obtained from Get-RDMPrivateSessionAttachment.

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-RDMPrivateSessionAttachment -detailed". For technical information, type "Get-Help Set-RDMPrivateSessionAttachment -full".

---

### Syntax
```PowerShell
Set-RDMPrivateSessionAttachment [-Attachment] <PSConnectionAttachment[]> [-Refresh] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
