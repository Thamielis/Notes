Get-RDMEntryProperty
--------------------

### Synopsis
Get the specified property's value of an entry.

---

### Description

Get the specified property's value of an entry.
Protected values will always return null. Those values are those who are ignored when entries are exported.
Non value types will always return ".ToString()".

---

### Related Links
* [Get-RDMEntry](Get-RDMEntry)

* [Set-RDMEntryProperty](Set-RDMEntryProperty)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-RDMEntryProperty -ID "{00000000-0000-0000-0000-000000000000}" -Property "Group"
Get the Group value from the entry with ID = "{00000000-0000-0000-0000-000000000000}".
```
> EXAMPLE 2

```PowerShell
PS C:\> Get-RDMEntryProperty -ID "{00000000-0000-0000-0000-000000000000}" -Path "MetaInformation" -Property "OS"
Get the MetaInformation.OS value from the entry with ID = "{00000000-0000-0000-0000-000000000000}".
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

#### **ID**
Specifies the ID of the entry to get the property from.
Must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}.

|Type    |Required|Position|PipelineInput |
|--------|--------|--------|--------------|
|`[Guid]`|true    |1       |true (ByValue)|

#### **Path**
The path to the property being read (refernce RDM export xml). If top level property do not sepcify parameter or pass empty string [""] or $null

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Property**
Property to read(get).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

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
* None

---

### Notes
For more information, type "Get-Help Get-RDMEntryProperty -detailed". For technical information, type "Get-Help Get-RDMEntryProperty -full".

---

### Syntax
```PowerShell
Get-RDMEntryProperty [-ID] <Guid> [[-Path] <String>] [-Property] <String> [-VaultMode <Default | User | Global>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
