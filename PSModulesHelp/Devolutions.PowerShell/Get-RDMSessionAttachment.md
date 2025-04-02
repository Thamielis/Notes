Get-RDMSessionAttachment
------------------------

### Synopsis
Get session attachments of a session

---

### Description

Get session attachments of a session. Only advanced data sources support attachment.

---

### Related Links
* [Add-RDMSessionAttachment](Add-RDMSessionAttachment)

* [Set-RDMSessionAttachment](Set-RDMSessionAttachment)

* [Add-RDMPrivateSessionAttachment](Add-RDMPrivateSessionAttachment)

* [Get-RDMPrivateSessionAttachment](Get-RDMPrivateSessionAttachment)

* [Set-RDMPrivateSessionAttachment](Set-RDMPrivateSessionAttachment)

* [Remove-RDMSessionAttachment](Remove-RDMSessionAttachment)

* [Update-RDMSessionAttachment](Update-RDMSessionAttachment)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $entry = Get-RDMSession -Name EntryA;
        $attachments = Get-RDMSessionAttachment -Session $entry;
        $attachments[0].Description = 'New description';
        Set-RDMSessionAttachment -Attachment $attachments[0]
Get the attachments of the session EntryA. Change the description of the desired attachment and save the modification.
```
> EXAMPLE 2

```PowerShell
PS C:\> $entry = Get-RDMSession -Name EntryA;
        $attachments = Get-RDMSessionAttachment -Session $entry;
        Update-RDMSessionAttachment -Attachment $attachments[0] -Filename 'C:\another\path\filename.ext'
Get the attachments of the session EntryA. Update the document and save it.
```

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

#### **Session**
Specifies the connection to get the attachments from.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSConnection]`|true    |named   |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnectionAttachment[]

---

### Notes
For more information, type "Get-Help Get-RDMSessionAttachment -detailed". For technical information, type "Get-Help Get-RDMSessionAttachment -full".

---

### Syntax
```PowerShell
Get-RDMSessionAttachment -Session <PSConnection> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
