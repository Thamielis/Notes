Add-RDMSessionAttachment
------------------------

### Synopsis
Add a new attachment to a session

---

### Description

Add a new attachment to a session.
    Two parameters are required: Filename, path to the file to attach, and Session, where the file is attached. Additional information can be provided via the title and description. The attachment can be protected by a password.
    Only advanced data sources support attachment. The user must have the permission to add attachments.

---

### Related Links
* [Get-RDMSessionAttachment](Get-RDMSessionAttachment)

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
        Add-RDMSessionAttachment -Filename 'C:\my\path\filename.ext' -Session $entry
Attach the file filename.ext, located in 'C:\my\path\', to the session named EntryA.
```
> EXAMPLE 2

```PowerShell
PS C:\> $entry = Get-RDMSession -Name EntryA;
        $password = Read-Host -AsSecureString;
        Add-RDMSessionAttachment -Filename 'C:\my\path\filename.ext' -Session $entry -Description 'A description of the attachment' -Title 'Essential' -Password $password -Refresh
Attach the file filename.ext, located in 'C:\my\path\', to the session named EntryA. The attachment will be protected by the password entered with Read-Host. Additional information is stored. The refresh parameter will update the RDM UI.
```

---

### Parameters
#### **Description**
Attachment description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Filename**
Attachment filename.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|true    |2       |true (ByValue)|

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

#### **Password**
Attachment password.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[SecureString]`|false   |named   |false        |

#### **Refresh**
Send refresh notification to Remote Desktop Manager application.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Session**
Session to add the attachment to.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSConnection]`|true    |1       |false        |

#### **Title**
Attachment title.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Add-RDMSessionAttachment -detailed". For technical information, type "Get-Help Add-RDMSessionAttachment -full".

---

### Syntax
```PowerShell
Add-RDMSessionAttachment [-Description <String>] [-Filename] <String> [-Password <SecureString>] [-Refresh] [-Session] <PSConnection> [-Title <String>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
