Remove-RDMEntry
---------------

### Synopsis
Delete existing entries.

---

### Description

Delete existing entries. If an entry is a folder, all entries it contains are also deleted. For each entry, the user must have the delete permission. Use the VaultMode parameter to specify the user vault ou global vault if required.

---

### Related Links
* [Get-RDMEntry](Get-RDMEntry)

* [New-RDMEntry](New-RDMEntry)

* [Set-RDMEntry](Set-RDMEntry)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-RDMEntry -Name Entry* | Remove-RDMEntry
Delete all entries whose name starts with Entry in the current vault.
```
> EXAMPLE 2

```PowerShell
PS C:\> Get-RDMEntry -Name Entry* -VaultMode User | Remove-RDMEntry -VaultMode User -Confirm
Delete all entries whose name starts with Entry in the user vault. The user will be prompted before each entry.
```
> EXAMPLE 3

```PowerShell
PS C:\> $deletedEntries = Remove-RDMEntry -ID $folderID, $entryID -VaultMode Global -PassThru
Delete the entries specified by the ids stored in $folderID and $entryID in the system vault. All deleted entries, including the entries contained in the folder specified by $folderID, are stored in $deletedEntries.
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
IDs of the entries be deleted.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|true    |1       |false        |

#### **InputObject**
Specifies the entries to delete.

|Type              |Required|Position|PipelineInput |
|------------------|--------|--------|--------------|
|`[PSConnection[]]`|true    |1       |true (ByValue)|

#### **PassThru**
Return all deleted entries, including entries in a deleted folder.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Refresh**
Refresh the entries in the vault. For modification in bulk, use Update-RDMEntries after the modifications instead of this switch.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection[]

Entries to delete obtained from Get-RDMEntry for a specfic vault mode.

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection[]

---

### Notes
For more information, type "Get-Help Remove-RDMEntry -detailed". For technical information, type "Get-Help Remove-RDMEntry -full".

---

### Syntax
```PowerShell
Remove-RDMEntry [-ID] <Guid[]> [-PassThru] [-Refresh] [-VaultMode <Default | User | Global>] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Remove-RDMEntry [-InputObject] <PSConnection[]> [-PassThru] [-Refresh] [-VaultMode <Default | User | Global>] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
