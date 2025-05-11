Set-RDMEntryUsername
--------------------

### Synopsis
Set the username on the specified entry.

---

### Description

Set the username on the specified entry. To persist the new username, the switch Set must be used.
    To modify the username, the user must have the appropriate rights: add for a new entry, and edit for an existing one.

---

### Related Links
* [Get-RDMEntryDomain](Get-RDMEntryDomain)

---

### Examples
> EXAMPLE 1

PS C:\> $entry = Get-RDMEntry -Name 'EntryA';
    Set-RDMEntryUsername -InputObject $entry -UserName 'newUserName' -Set
Update the specified entry's username to 'newUserName'
> EXAMPLE 2

```PowerShell
PS C:\> $securePassword = ConvertTo-SecureString -AsPlainText -String 'newPas$w0rd!';
    Get-RDMEntry -Name 'UniqueName' |
    Set-RDMEntryDomain -Domain 'MyOtherDomain.com' -PassThru |
    Set-RDMEntryPassword -Password $securePassword -PassThru |
    Set-RDMEntryUsername -UserName 'NewUserName' -PassThru |
    Set-RDMEntry
Modify the domain, password and username of the entry named 'UniqueName'. The variable $securePassword is a secure string previously set. Persist the modification with the Set-RDMSession call.
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
ID of the entry to modify. Use the VaultMode parameter to search in the User vault or the Global vault.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |1       |false        |

#### **InputObject**
Specifies the entry to set the username to.

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

#### **Username**
New username.

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

PSConnection object of the entry to modify the username from.

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection

---

### Notes
For more information, type "Get-Help Set-RDMEntryUsername -detailed". For technical information, type "Get-Help Set-RDMEntryUsername -full".

---

### Syntax
```PowerShell
Set-RDMEntryUsername [-ID] <Guid> [-VaultMode <Default | User | Global>] [-Username] <String> [-PassThru] [-Refresh] [-Set] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Set-RDMEntryUsername [-InputObject] <PSConnection> [-Username] <String> [-PassThru] [-Refresh] [-Set] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
