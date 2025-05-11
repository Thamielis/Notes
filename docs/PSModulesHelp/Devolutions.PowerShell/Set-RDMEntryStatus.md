Set-RDMEntryStatus
------------------

### Synopsis
Set the status on the specified entry.

---

### Description

Set the status on the specified entry. To persist the new status, the switch Set must be used.
    To modify the status, the user must have the appropriate rights: add for a new entry, and edit for an existing one.

---

### Related Links
* [Get-RDMEntryDomain](Get-RDMEntryDomain)

---

### Examples
> EXAMPLE

PS C:\> $entry = Get-RDMEntry -Name 'EntryA';
    Set-RDMEntrystatus -InputObject $entry -Status 'Expired' -Set
Update the specified entry's status to 'Expired'

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
ID of the entries to modify. Use the VaultMode parameter to search in the User vault or the Global vault.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|true    |1       |false        |

#### **InputObject**
Specifies the entries to set the status to

|Type              |Required|Position|PipelineInput |
|------------------|--------|--------|--------------|
|`[PSConnection[]]`|true    |1       |true (ByValue)|

#### **Message**
Status message

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **PassThru**
Return the modified entry.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Refresh**
Send refresh notification to Remote Desktop Manager application. Use Set switch to persist the modification.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Set**
Save the entry in the current data source.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Status**
Status type
Valid Values:

* Default
* Disabled
* Expired
* Locked
* Warning

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **VaultMode**
Vault where the command will be applied. Three choices are offered:
        - Default: Current vault that has been set.
        - User: Vault specific to the current user.
        - Global: Global vault of the data source.
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
RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection

PSConnection object of the entry to modify the status from.

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection

---

### Notes
For more information, type "Get-Help Set-RDMEntryStatus -detailed". For technical information, type "Get-Help Set-RDMEntryStatus -full".

---

### Syntax
```PowerShell
Set-RDMEntryStatus [-ID] <Guid[]> [-VaultMode <Default | User | Global>] [-Status] <Default | Disabled | Expired | Locked | Warning> [[-Message] <String>] [-PassThru] [-Refresh] [-Set] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Set-RDMEntryStatus [-InputObject] <PSConnection[]> [-Status] <Default | Disabled | Expired | Locked | Warning> [[-Message] <String>] [-PassThru] [-Refresh] [-Set] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
