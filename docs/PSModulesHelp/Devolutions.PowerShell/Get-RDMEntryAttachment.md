Get-RDMEntryAttachment
----------------------

### Synopsis
Get attachments of an entry

---

### Description

Get attachments of an entry. They can filtered by their filename and title. Only advanced data sources support attachments

---

### Related Links
* [Add-RDMEntryAttachment](Add-RDMEntryAttachment)

* [Remove-RDMEntryAttachment](Remove-RDMEntryAttachment)

* [Set-RDMEntryAttachment](Set-RDMEntryAttachment)

* [Update-RDMEntryAttachment](Update-RDMEntryAttachment)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-RDMEntry -Name EntryA | Get-RDMEntryAttachment
Get all the attachments of the entry EntryA
```
> EXAMPLE 2

```PowerShell
PS C:\> Get-RDMEntry -Name EntryA | Get-RDMEntryAttachment -Title 'UniqueTitle' | Update-RDMEntryCommand -Filename 'revisedFile.txt' -Refresh
Update the document of the attachment 'UniqueTitle' with the file 'revisedFile.txt' in the current session directory.
```
> EXAMPLE 3

```PowerShell
PS C:\> Get-RDMEntry -Name EntryA | Get-RDMEntryAttachment -Filename 'UniqueTitle' -CaseSensitive | Update-RDMEntryCommand -Filename 'revisedFile.txt' -Refresh
Update the document of the attachment 'UniqueTitle' with the file 'revisedFile.txt' in the current session directory.
```
> EXAMPLE 4

PS C:\> Get-RDMEntry -Name EntryA | Get-RDMEntryAttachment | Set-RDMEntryAttachment -AllowExport $false
Prevent the export of all EntryA's attachments.

---

### Parameters
#### **CaseSensitive**
Filtering by the title and the filename will be case sensitive.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Filename**
Filter the attachments based on their filename.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

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
Specifies the connection to get the attachments from.

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSConnection]`|true    |1       |true (ByValue)|

#### **Title**
Filter the attachments based on their title.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

---

### Inputs
RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection

PSConnection object of the entry where the attachments will be. Can be obtained from Get-RDMEntry.

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnectionAttachment[]

---

### Notes
For more information, type "Get-Help Get-RDMEntryAttachment -detailed". For technical information, type "Get-Help Get-RDMEntryAttachment -full".

---

### Syntax
```PowerShell
Get-RDMEntryAttachment [-CaseSensitive] [<CommonParameters>]
```
