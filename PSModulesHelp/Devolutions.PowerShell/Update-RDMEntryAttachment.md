Update-RDMEntryAttachment
-------------------------

### Synopsis
Update an entry's attachment file

---

### Description

Update an entry's attachment file. Only advanced data sources support attachment. The user must have the permission to edit attachments.

---

### Related Links
* [Add-RDMEntryAttachment](Add-RDMEntryAttachment)

* [Get-RDMEntryAttachment](Get-RDMEntryAttachment)

* [Remove-RDMEntryAttachment](Remove-RDMEntryAttachment)

* [Set-RDMEntryAttachment](Set-RDMEntryAttachment)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Get-RDMEntry -Name EntryA | Get-RDMEntryAttachment -Title 'UniqueTitle' | Update-RDMEntryCommand -Filename 'revisedFile.txt' -Refresh
Update the document of the attachment 'UniqueTitle' with the file 'revisedFile.txt' in the current session directory.
```

---

### Parameters
#### **Filename**
Attachment filename.

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

#### **InputObject**
Attachment to update. Can be obtained from Get-RDMEntryAttachment.

|Type                      |Required|Position|PipelineInput |
|--------------------------|--------|--------|--------------|
|`[PSConnectionAttachment]`|true    |1       |true (ByValue)|

#### **Refresh**
Refresh the entries in the vault. For modification in bulk, use Update-RDMEntries after the modifications instead of this switch.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnectionAttachment

PSConnectionAttachment to update. Can be obtained from Get-RDMEntryAttachment.

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Update-RDMEntryAttachment -detailed". For technical information, type "Get-Help Update-RDMEntryAttachment -full".

---

### Syntax
```PowerShell
Update-RDMEntryAttachment [-InputObject] <PSConnectionAttachment> [-Filename] <String> [-Refresh] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
