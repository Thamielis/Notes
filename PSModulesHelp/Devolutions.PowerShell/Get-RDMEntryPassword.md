Get-RDMEntryPassword
--------------------

### Synopsis
Resolve the password of the specified entry

---

### Description

Resolve the password of the specified entry. The entry can be specified in two way: by its ID and by passing the PSConnection object. When using the ID parameter, the VaultMode parameter can be used to search the entry in the user vault or in global vault. For the InputObjet parameter, the entry can be obtained from Get-RDMEntry, Get-RDMPersonalCredentials, and Get-RDMPrivilegedAccount.
        If the password has been modified locally via Set-RDMEntryPassword and the entry is a credential, the old password will be returned. To see the new password, Update-RDMEntries must be called.
        To obtain the password, the user must be able to copy it. Generally, this means the right to view it. However, in some cases, an adminstrator might be required or a non-empty password. The status of the entry, such as Locked or Expired, can also prevent the obtention of the password.
        If the data source required a prompt on credentials viewed, the user will be prompted for each required field. To avoid this, the TicketID and Comment parameters must be used.

---

### Related Links
* [Get-RDMEntry](Get-RDMEntry)

* [Get-RDMPersonalCredentials](Get-RDMPersonalCredentials)

* [Get-RDMPrivilegedAccount](Get-RDMPrivilegedAccount)

* [Set-RDMEntryPassword](Set-RDMEntryPassword)

---

### Examples
> EXAMPLE 1

PS C:\> Get-RDMEntryPassword -ID '00000000-0000-0000-0000-000000000000' -AsPlainText -VaultMode User
Obtain, as plain text, the password of the entry in the user vault whose ID is '00000000-0000-0000-0000-000000000000'
> EXAMPLE 2

PS C:\> Get-RDMEntry -Name 'MyCredEntry' -VaultMode Global | Get-RDMEntryPassword -TicketID 'tick101' -Comment 'Why not'
Obtain, as a SecureString, the password of the entry 'MyCredEntry' in the system vault. The ticket number and the comment are passed with the associated parameters to avoid being prompted.
> EXAMPLE 3

PS C:\> Get-RDMPersonalCredentials | Get-RDMEntryPassword -AsPlainText
Obtain, as a plain text, the password of 'My Personal Credentials' in the user settings.
> EXAMPLE 4

PS C:\> Get-RDMPrivilegedAccount | Get-RDMEntryPassword -AsPlainText
Obtain, as a plain text, the password of 'My Privileged Account' in the user settings.

---

### Parameters
#### **AsPlainText**
Return the password as plain text.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Switch]`|false   |named   |true (ByValue)|

#### **Comment**
Comment for the credential viewed log.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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
ID of the entry to get the password from.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |1       |false        |

#### **InputObject**
Entry to get the password from. Can be obtained from Get-RDMEntry, Get-RDMPersonalCredentials, or Get-RDMPrivilegedAccount.

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSConnection]`|true    |1       |true (ByValue)|

#### **TicketID**
Ticket number for the credential viewed log

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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
RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection

PSConnection object of the entry obtained from Get-RDMEntry, Get-RDMPersonalCredentials, or Get-RDMPrivilegedAccount

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

* [Security.SecureString](https://learn.microsoft.com/en-us/dotnet/api/System.Security.SecureString)

---

### Notes
For more information, type "Get-Help Get-RDMEntryPassword -detailed". For technical information, type "Get-Help Get-RDMEntryPassword -full".

---

### Syntax
```PowerShell
Get-RDMEntryPassword [-ID] <Guid> [-Comment <String>] [-TicketID <String>] [-AsPlainText] [-VaultMode <Default | User | Global>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Get-RDMEntryPassword [-InputObject] <PSConnection> [-Comment <String>] [-TicketID <String>] [-AsPlainText] [-VaultMode <Default | User | Global>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
