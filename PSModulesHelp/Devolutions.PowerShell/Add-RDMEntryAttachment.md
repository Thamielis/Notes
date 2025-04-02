Add-RDMEntryAttachment
----------------------

### Synopsis
Add new attachments to an existing entry

---

### Description

Add new attachments to an existing entry. Entries of the type SessionTool do not allow attachments. The type of an entry is the property ConnectionType of a PSConnection.
    To modify properties of the attachments, use Set-RDMEntryAttachment. To update a file of an existing attachment, use Update-RDMEntryAttachment. 
    Only advanced data sources support attachment. The user must have the permission to add attachments.

---

### Related Links
* [Get-RDMEntryAttachment](Get-RDMEntryAttachment)

* [Remove-RDMEntryAttachment](Remove-RDMEntryAttachment)

* [Set-RDMEntryAttachment](Set-RDMEntryAttachment)

* [Update-RDMEntryAttachment](Update-RDMEntryAttachment)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-RDMEntry -Name EntryA | Add-RDMEntryAttachment -Filename 'C:\my\path\filename.txt', 'localFile.txt'
Attach the files filename.txt, located in 'C:\my\path\', and localFile.txt, located in the current session directory, to the session named EntryA.
```
> EXAMPLE 2

```PowerShell
PS C:\> $entry = Get-RDMEntry -Name EntryA;
    $attachment = Add-RDMEntryAttachment -InputObject $entry -Filename 'filename.txt' -PassThru;
    Set-RDMEntryAttachment -InputObject $attachment -Title 'Filename' -Description 'This is an important file'
Attach the file filename.txt, located in 'C:\my\path\', to the session named EntryA.
```

---

### Parameters
#### **Filename**
Attachment filenames.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |2       |false        |

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
Entry to add the attachment to.

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSConnection]`|true    |1       |true (ByValue)|

#### **PassThru**
Return the all attachments as a PSConnectionAttachment[].

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Refresh**
Refresh the entries in the vault. For modification in bulk, use Update-RDMEntries after the modifications instead of this switch.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs
RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection

PSConnection object of the entry where the attachments will be. Can be obtained from Get-RDMEntry.

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnectionAttachment[]

---

### Notes
For more information, type "Get-Help Add-RDMEntryAttachment -detailed". For technical information, type "Get-Help Add-RDMEntryAttachment -full".

---

### Syntax
```PowerShell
Add-RDMEntryAttachment [-InputObject] <PSConnection> [-Filename] <String[]> [-PassThru] [-Refresh] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
