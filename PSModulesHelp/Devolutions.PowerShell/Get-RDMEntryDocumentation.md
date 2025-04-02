Get-RDMEntryDocumentation
-------------------------

### Synopsis
Get documentation pages of entries

---

### Description

Get documentations pages of entries. The entries must be fetched by Get-RDMEntry. There is two possibility to filter the pages: by their name and by their data (content).
    The data source must support the documentation feature and be online. The user must have the rights to access the documentation.

---

### Related Links
* [New-RDMEntryDocumentation](New-RDMEntryDocumentation)

* [Remove-RDMEntryDocumentation](Remove-RDMEntryDocumentation)

* [Set-RDMEntryDocumentation](Set-RDMEntryDocumentation)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $page = Get-RDMEntry -Name EntryA | Get-RDMEntryDocumentation -Name PageA;
    $page.Data
Get the documentation page named 'PageA' of the entry named 'EntryA' and see its content.
```
> EXAMPLE 2

```PowerShell
PS C:\> $defaultPages = Get-RDMEntry -VaultMode Global | Get-RDMEntryDocumentation -Default;
    foreach ($defaultPage in $defaultPages) { $defaultPage.Default = $false }
    Set-RDMEntryDocumentation -InputObject $defaultPages
Remove the default status of the default documentation page of each entries in the system vault.
```
> EXAMPLE 3

```PowerShell
PS C:\> Get-RDMEntry -Name EntryA | Get-RDMEntryDocumentation -Data '*Temporary*' -CaseSensitive | Remove-RDMEntryDocumentation
Delete all documentation pages of the entry 'EntryA' that contains the word 'Temporary'
```

---

### Parameters
#### **CaseSensitive**
Filtering will be case sensitive.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Data**
Filter the handbook pages by their content.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Default**
Obtain only the default page. Maximum one default page per entry.

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

#### **InputObject**
Entry from which to extract the documentation.

|Type              |Required|Position|PipelineInput |
|------------------|--------|--------|--------------|
|`[PSConnection[]]`|true    |1       |true (ByValue)|

#### **LiteralName**
Filter the handbook pages by their name. No characters are interpreted as

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **Name**
Filter the handbook pages by their name.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

---

### Inputs
RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection

Entries, obtained from Get-RDMEntry, containing the documentation.

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSHandbookPage[]

---

### Notes
For more information, type "Get-Help Get-RDMEntryDocumentation -detailed". For technical information, type "Get-Help Get-RDMEntryDocumentation -full".

---

### Syntax
```PowerShell
Get-RDMEntryDocumentation [[-LiteralName] <String[]>] [-InputObject] <PSConnection[]> [-Data <String[]>] [-CaseSensitive] [-Default] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Get-RDMEntryDocumentation [[-Name] <String[]>] [-InputObject] <PSConnection[]> [-Data <String[]>] [-CaseSensitive] [-Default] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
