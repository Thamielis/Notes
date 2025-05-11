Get-RDMEntryDocument
--------------------

### Synopsis
Get documents stored in the database

---

### Description

Get documents stored in the database. The user can specify the desired vault: default or user.

---

### Related Links
* [Set-RDMEntryDocument](Set-RDMEntryDocument)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $doc = Get-RDMEntryDocument -Name 'SimpleTextDocument' -VaultMode User;
    $doc.Data = [System.Text.Encoding]::UTF8.GetBytes('My new content');
    Set-RDMEntryDocument -InputObject $doc
Update the content of the document stored in the database of the entry SimpleTextDocument.
```
> EXAMPLE 2

```PowerShell
PS C:\> $doc = Get-RDMEntryDocument -Name 'SimpleTextDocument';
    $doc.Data = Get-Content -Path MyFile.txt -AsByteStream;
    Set-RDMEntryDocument -InputObject $doc
Update the content of the document stored in the database of the entry SimpleTextDocument with the content of the file contained in the entry SimpleTextDocument
```

---

### Parameters
#### **CaseSensitive**
Filtering by name will be case sensitive.

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

#### **LiteralName**
Filter the document entries by their name. No characters are interpreted as wildcards.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |named   |false        |

#### **Name**
Filter the document entries by their name. Support wildcard characters.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **VaultMode**
Vault where the command will be applied. Three choices are offered:
* Default: Current vault that has been set.
* User: Vault specific to the current user.
* Global: Global vault of the data source.
Valid Values:

* Default
* User
* Global

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[VaultMode]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnectionDocument[]

---

### Notes
For more information, type "Get-Help Get-RDMEntryDocument -detailed". For technical information, type "Get-Help Get-RDMEntryDocument -full".

---

### Syntax
```PowerShell
Get-RDMEntryDocument -LiteralName <String[]> [-VaultMode <Default | User>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Get-RDMEntryDocument [-Name <String[]>] [-CaseSensitive] [-VaultMode <Default | User>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
