Set-RDMEntryPassword
--------------------

### Synopsis
Set the password of an entry

---

### Description

Set the password of an entry. The entry to modify can be fetched by its id or by a PSConnection object obtained from Get-RDMEntry, New-RDMEntry, Get-RDMPersonalCredentials, or Get-RDMPrivilegedAccount. In the latter case, the local object will be modified.
        To modify the password, the user must have the appropriate rights: add for a new entry, and edit for an existing one.
        For data source supporting the password age, it is also possible to modify that value for the new password. It can be used to indicate when the password was generated instead of when the password has been set in the entry.

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $entry = New-RDMEntry -Type Credential -Name 'NewCredEntry';
    $entry.Credentials.UserName = 'MyUserName';
    Set-RDMEntryPassword -InputObject $entry -Password (Read-Host -AsSecureString -Prompt 'Password')
    Set-RDMEntry -InputObject $entry
The user create a new credential entry. Its username and password are being set. The call to Set-RDMEntryPassword does modify the local object. The user can do more modifications if desired. The last line finally save the new entry.
```
> EXAMPLE 2

```PowerShell
PS C:\> $pwd = ConvertTo-SecureString -AsPlainText -String 'passwordFr0mSomewhereElse';
    Get-RDMEntry -Name 'EntryToModify' | Set-RDMEntryPassword -Password $pwd -PasswordAge 14 -Set -Refresh
The entry named 'EntryToModify' will have an updated password, the one stored in $pwd, and it will be aged of 14 days.
```
> EXAMPLE 3

```PowerShell
PS C:\> Get-RDMEntry -Name 'UniqueName' |
                    Set-RDMEntryDomain -Domain 'MyOtherDomain.com' -PassThru |
                    Set-RDMEntryPassword -Password $securePassword -PassThru |
                    Set-RDMEntryUsername -UserName 'NewUserName' -PassThru |
                    Set-RDMEntry
Modify the domain, password and username of the entry named 'UniqueName'. The variable $securePassword is a secure string previously set. Persist the modification with the Set-RDMEntry call.
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
Specifies the ID of the session to get the password from.
Must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}.

|Type    |Required|Position|PipelineInput |
|--------|--------|--------|--------------|
|`[Guid]`|true    |1       |true (ByValue)|

#### **InputObject**
Specifies the session to set the password to.

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSConnection]`|true    |1       |true (ByValue)|

#### **PassThru**
Return the modified entry.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Password**
Password as SecureString. Use either "Read-Host -AsSecureString" or "ConvertTo-SecureString"

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[SecureString]`|true    |2       |false        |

#### **PasswordAge**
Specifies password age in days. PasswordAge takes presedence over PasswordSinceDate.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **PasswordSinceDate**
Specifies date/time (UTC) at which the password was first created. PasswordAge takes presedence over PasswordSinceDate.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |false        |

#### **Refresh**
Send refresh notification to Remote Desktop Manager application.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Set**
Save the session in the current data source.

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
RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection

Entry whose password will be modified. Can be obtained from Get-RDMEntry, New-RDMEntry, Get-RDMPersonalCredentials, or Get-RDMPrivilegedAccount.

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection

---

### Notes
For more information, type "Get-Help Set-RDMEntryPassword -detailed". For technical information, type "Get-Help Set-RDMEntryPassword -full".

---

### Syntax
```PowerShell
Set-RDMEntryPassword [-ID] <Guid> [-Password] <SecureString> [-PasswordAge <Int32>] [-PasswordSinceDate <DateTime>] [-PassThru] [-Refresh] [-Set] [-VaultMode <Default | User | Global>] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Set-RDMEntryPassword [-InputObject] <PSConnection> [-Password] <SecureString> [-PasswordAge <Int32>] [-PasswordSinceDate <DateTime>] [-PassThru] [-Refresh] [-Set] [-VaultMode <Default | User | Global>] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
