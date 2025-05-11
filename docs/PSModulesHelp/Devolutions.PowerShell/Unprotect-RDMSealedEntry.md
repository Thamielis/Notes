Unprotect-RDMSealedEntry
------------------------

### Synopsis
Unseal an entry.

---

### Description

To unseal entries, ensure that you are using a Devolutions Server data source, as only this type supports the operation. To find the sealed entries, use Get-RDMSealedEntry.

---

### Related Links
* [Get-RDMSealedEntry](Get-RDMSealedEntry)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Get-RDMSealedEntry -Name 'InCaseOfEmergency' | Unprotect-RDMSealedEntry;
PS C:\> $unsealedEntry = Get-RDMEntry -Name 'InCaseOfEmergency';
PS C:\> $password = Get-RDMEntryPassword -InputObject $unsealedEntry -AsPlainText;
PS C:\> $unsealedEntry.SealState = 'Sealed';
PS C:\> Set-RDMEntry -InputObject $unsealedEntry;
Unseal the entry 'InCaseOfEmergency', get its password, and reseal the entry
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
ID of the entry to seal

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

#### **InputObject**
Entry to seal

|Type                  |Required|Position|PipelineInput |
|----------------------|--------|--------|--------------|
|`[PSSealedConnection]`|true    |named   |true (ByValue)|

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
For more information, type "Get-Help Unprotect-RDMSealedEntry -detailed". For technical information, type "Get-Help Unprotect-RDMSealedEntry -full".

---

### Syntax
```PowerShell
Unprotect-RDMSealedEntry -ID <Guid> [-VaultMode <Default | User | Global>] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Unprotect-RDMSealedEntry -InputObject <PSSealedConnection> [-VaultMode <Default | User | Global>] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
