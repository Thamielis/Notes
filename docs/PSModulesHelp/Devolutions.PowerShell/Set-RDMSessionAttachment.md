Set-RDMSessionAttachment
------------------------

### Synopsis
Save attachments

---

### Description

Save attachments. Only advanced data sources support attachment.

---

### Related Links
* [Add-RDMSessionAttachment](Add-RDMSessionAttachment)

* [Get-RDMSessionAttachment](Get-RDMSessionAttachment)

* [Add-RDMPrivateSessionAttachment](Add-RDMPrivateSessionAttachment)

* [Get-RDMPrivateSessionAttachment](Get-RDMPrivateSessionAttachment)

* [Set-RDMPrivateSessionAttachment](Set-RDMPrivateSessionAttachment)

* [Remove-RDMSessionAttachment](Remove-RDMSessionAttachment)

* [Update-RDMSessionAttachment](Update-RDMSessionAttachment)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $entry = Get-RDMSession -Name EntryA;
        $attachments = Get-RDMSessionAttachment -Session $entry;
        $attachments[0].Description = 'New description';
        Set-RDMSessionAttachment -Attachment $attachments[0]
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

Array of PSConnectionAttachment to save. Can be obtained from Get-RDMSessionAttachment.

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-RDMSessionAttachment -detailed". For technical information, type "Get-Help Set-RDMSessionAttachment -full".

---

### Syntax
```PowerShell
Set-RDMSessionAttachment [-Attachment] <PSConnectionAttachment[]> [-Refresh] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
