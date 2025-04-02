Remove-RDMDeletedEntry
----------------------

### Synopsis
Delete the history of one or more deleted entries

---

### Description

Delete the history of one or more deleted entries. For the data source supporting this functionality, every time an entry is deleted it is logged. This cmdlet will delete the entries from the log, permanently deleting them.
The user can permanently delete an entry by its ID, or by the result of the cmdlet Get-DSDeletedEntry.
The user must be an administrator or vault owner this use this cmdlet.

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $today = (Get-Date).Date;
        $deletedEntries = Get-RDMDeletedEntry | Where ModifiedDate -ge $today
        Remove-RDMDeletedEntry -InputObject $deletedEntries
Delete all entries deleted today
```
> EXAMPLE 2

```PowerShell
PS C:\> $deletedEntries = Get-RDMDeletedEntry | Where GroupName -eq 'a\group\name'
        Remove-RDMDeletedEntry -InputObject $deletedEntries
Delete all deleted entries whose groupName is 'a\group\name'.
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
Histories to delete of a specific entry

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |1       |false        |

#### **InputObject**
Histories to delete obtained from Get-RDMDeletedEntry

|Type                     |Required|Position|PipelineInput |
|-------------------------|--------|--------|--------------|
|`[PSConnectionHistory[]]`|true    |1       |true (ByValue)|

#### **PassThru**
Return the InputObject input.

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
RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnectionHistory[]

Array of PSConnectionHistory obtained from Get-RDMDeletedEntry

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnectionHistory[]

---

### Notes
For more information, type "Get-Help Remove-RDMDeletedEntry -detailed". For technical information, type "Get-Help Remove-RDMDeletedEntry -full".

---

### Syntax
```PowerShell
Remove-RDMDeletedEntry [-ID] <Guid> [-VaultMode <Default | User | Global>] [-PassThru] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Remove-RDMDeletedEntry [-InputObject] <PSConnectionHistory[]> [-PassThru] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
