Set-RDMEntryDomain
------------------

### Synopsis
Set the domain from the specified entry.

---

### Description

Set the domain of the specified entry.
    To modify the domain, the user must have the appropriate rights: add for a new entry, and edit for an existing one.

---

### Related Links
* [Set-RDMEntryDomain](Set-RDMEntryDomain)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $entry = Get-RDMEntry -Name EntryA;
    Set-RDMEntryDomain -InputObject $entry -Domain 'newDomain' -Set -Refresh
Set the domain to 'newDomain' for the entry named EntryA.
```
> EXAMPLE 2

PS C:\> $entries = Get-RDMEntry | Where { (Get-RDMEntryDomain -InputObject $_) -eq 'mydomain' };
    $entries | Set-RDMEntryDomain -InputObject $entry -Domain 'newDomain' -Set;
    Update-RDMEntries
For all entries whose domain is 'mydomain', update it to 'newDomain' and save the change. After all the modifications, refresh the entries list.

---

### Parameters
#### **Domain**
New domain name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

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
ID of the entry to modify. Use the VaultMode parameter to search in the User vault or the Global vault.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |1       |false        |

#### **InputObject**
Specifies the entry to set the domain to.

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSConnection]`|true    |1       |true (ByValue)|

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
Save the modified entry.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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

PSConnection object of the entry to modify the domain from.

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection

---

### Notes
For more information, type "Get-Help Set-RDMEntryDomain -detailed". For technical information, type "Get-Help Set-RDMEntryDomain -full".

---

### Syntax
```PowerShell
Set-RDMEntryDomain [-ID] <Guid> [-VaultMode <Default | User | Global>] [-Domain] <String> [-PassThru] [-Refresh] [-Set] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Set-RDMEntryDomain [-InputObject] <PSConnection> [-Domain] <String> [-PassThru] [-Refresh] [-Set] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
