Set-RDMEntryProperty
--------------------

### Synopsis
Set the property's value of an entry

---

### Description

Set the property's value of an entry. The property is specified with the parameters Path and Property. The entry is found by its ID. If the VaultMode parameter is not used, the three vaults (current one, user vault, and global vault) will be searched.
The user must have the right to edit the entry.".

---

### Related Links
* [Get-RDMEntry](Get-RDMEntry)

* [Get-RDMEntryProperty](Get-RDMEntryProperty)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Set-RDMEntryProperty -ID "{00000000-0000-0000-0000-000000000000}" -Property "Group" -Value "My New Group Name"
Set the Group value of the entry with ID = "{00000000-0000-0000-0000-000000000000}".
```
> EXAMPLE 2

```PowerShell
PS C:\> Set-RDMSessionProperty -ID "{00000000-0000-0000-0000-000000000000}" -Path "MetaInformation" -Property "OS" -Value "Windows Server 2008 R2"
Set the MetaInformation.OS value from the session with ID = "{00000000-0000-0000-0000-000000000000}".
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
Specifies the ID of the entry to set the property to.
Must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}.

|Type    |Required|Position|PipelineInput |
|--------|--------|--------|--------------|
|`[Guid]`|true    |1       |true (ByValue)|

#### **Path**
The path to the property being set (reference RDM export xml). In the case of top level property, do not specify parameter or pass empty string [""] or $null.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Property**
Property to set.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

#### **Refresh**
Refresh entries in the vault. All entries of type 'Group' automatically trigger a refresh to ensure they are available for other entries. For modification in bulk, use Update-RDMEntries after the modifications instead of this switch.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Value**
New value.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |4       |false        |

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
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-RDMEntryProperty -detailed". For technical information, type "Get-Help Set-RDMEntryProperty -full".

---

### Syntax
```PowerShell
Set-RDMEntryProperty [-ID] <Guid> [[-Path] <String>] [-Property] <String> [-Value] <Object> [-Refresh] [-VaultMode <Default | User | Global>] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
