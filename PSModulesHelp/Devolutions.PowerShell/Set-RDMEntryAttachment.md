Set-RDMEntryAttachment
----------------------

### Synopsis
Save attachments

---

### Description

Save attachments. Only advanced data sources support attachment. The user must have the right to edit the attachments.

---

### Related Links
* [Add-RDMEntryAttachment](Add-RDMEntryAttachment)

* [Get-RDMEntryAttachment](Get-RDMEntryAttachment)

* [Remove-RDMEntryAttachment](Remove-RDMEntryAttachment)

* [Update-RDMEntryAttachment](Update-RDMEntryAttachment)

---

### Examples
> EXAMPLE 1

PS C:\> Get-RDMEntry -Name EntryA | Get-RDMEntryAttachment | Set-RDMEntryAttachment -AllowExport $false
Prevent the export of all EntryA's attachments.
> EXAMPLE 2

```PowerShell
PS C:\> $pwd = New-RDMRandomPassword -Mode Strong;
    $securepwd = ConvertTo-SecureString -String $pwd -AsPlainText;
    Get-RDMEntry -Name EntryA | Get-RDMEntryAttachment -Title 'AttachmentA' | Set-RDMEntryAttachment -Title 'Attachment A' -Description 'New description' -Password $securepwd
Change the title, description, and password of the attachment named AttachmentA of the entry EntryA
```

---

### Parameters
#### **AllowExport**
Allow or disallow the attachment to be exported.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **Description**
Attachment description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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

#### **InputObject**
Attachments to save. Can be obtained from Get-RDMEntryAttachment.

|Type                        |Required|Position|PipelineInput |
|----------------------------|--------|--------|--------------|
|`[PSConnectionAttachment[]]`|true    |1       |true (ByValue)|

#### **Password**
Attachment password.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[SecureString]`|false   |named   |false        |

#### **Refresh**
Refresh the entries in the vault. For modification in bulk, use Update-RDMEntries after the modifications instead of this switch.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Title**
Attachment title.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

---

### Inputs
RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnectionAttachment[]

Array of PSConnectionAttachment to save. Can be obtained from Get-RDMEntryAttachment.

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-RDMEntryAttachment -detailed". For technical information, type "Get-Help Set-RDMEntryAttachment -full".

---

### Syntax
```PowerShell
Set-RDMEntryAttachment [-InputObject] <PSConnectionAttachment[]> [-AllowExport <Boolean>] [-Description <String>] [-Password <SecureString>] [-Title <String>] [-Refresh] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
