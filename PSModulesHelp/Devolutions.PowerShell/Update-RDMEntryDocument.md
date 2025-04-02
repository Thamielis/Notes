Update-RDMEntryDocument
-----------------------

### Synopsis
Update the document of the specified entry.

---

### Description

Update the document of the specified entry. The entry must of the type Document, and the document must be stored in the database. The updated document must be of the same type as the existing one. It must also respect the maximum file size defined in the system settings.
This cmdlet cannot be used offline. The data source must support attachments. The user must have the right to modify the attachments.

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $entry = Get-RDMEntry -Name MyDocumentEntry;
    Update-RDMEntryDocument -InputObject $entry -Filename 'C:\Mytestfile.txt' -Refresh
Update the document of the entry MyDocumentEntry with the file 'C:\Mytestfile.txt'
```
> EXAMPLE 2

```PowerShell
PS C:\> $entry = Get-RDMEntry -Name MyDocumentEntry;
    $entryWithAttachment = Get-RDMEntry -Name MyEntryWithAttachment;
    $attachment = Get-RDMEntryAttachment -InputObject $entryWithAttachment -Title 'My Attachment File';
    Update-RDMEntryDocument -InputObject $entry -Attachment $attachment
Update the document of the entry MyDocumentEntry with the attachment 'My Attachment File' present in the entry MyEntryWithAttachment.
```

---

### Parameters
#### **Attachment**
Attachment to update the document to.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[PSConnectionAttachment]`|true    |2       |false        |

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

#### **InputObject**
Entry to update the document to.

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSConnection]`|true    |1       |true (ByValue)|

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
RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection

Document entry obtained from Get-RDMEntry

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Update-RDMEntryDocument -detailed". For technical information, type "Get-Help Update-RDMEntryDocument -full".

---

### Syntax
```PowerShell
Update-RDMEntryDocument [-Filename] <String> [-InputObject] <PSConnection> [-Refresh] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Update-RDMEntryDocument [-Attachment] <PSConnectionAttachment> [-InputObject] <PSConnection> [-Refresh] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
