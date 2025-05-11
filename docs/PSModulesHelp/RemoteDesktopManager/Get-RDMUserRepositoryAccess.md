Get-RDMUserRepositoryAccess
---------------------------

### Synopsis
Retrieve the list of available user vaults.

---

### Description

Retrieve the list of available vaults for the provided user.

---

### Related Links
* [Set-RDMUser](Set-RDMUser)

* [Set-RDMUserProperty](Set-RDMUserProperty)

* [New-RDMUser](New-RDMUser)

* [Remove-RDMUser](Remove-RDMUser)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-RDMUserVaultAccess
Retrieves the list of available user vaults.
```
> EXAMPLE 2

```PowerShell
PS C:\> $list = Get-RDMUserVaultAccess $user; $list[0]
Retrieves the list of available user vaults and displays the first item. $user must be retrieved from Get-RDMUser or New-RDMUser.
```
> EXAMPLE 3

```PowerShell
PS C:\> Get-RDMUserVaultAccess $user -Name Default
Retrieves the Default vault information if associated to $user. $user must be retrieved from Get-RDMUser or New-RDMUser.
```

---

### Parameters
#### **CaseSensitive**
Case sensitive

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |3       |false        |

#### **ID**
Specifies the GUID of the user to user.
The value must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}

|Type    |Required|Position|PipelineInput |
|--------|--------|--------|--------------|
|`[Guid]`|true    |1       |true (ByValue)|

#### **Name**
Vault's name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **User**
User object, must be retrieved from Get-RDMUser or created via New-RDMUser.

|Type          |Required|Position|PipelineInput |
|--------------|--------|--------|--------------|
|`[PSUserInfo]`|true    |1       |true (ByValue)|

---

### Inputs
System.String

User

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSRepositoryInfo[]

---

### Notes
For more information, type "Get-Help Get-RDMUserRepositoryAccess -detailed". For technical information, type "Get-Help Get-RDMUserRepositoryAccess -full".

---

### Syntax
```PowerShell
Get-RDMUserRepositoryAccess [-ID] <Guid> [[-CaseSensitive]] [[-Name] <String>] [<CommonParameters>]
```
```PowerShell
Get-RDMUserRepositoryAccess [-User] <PSUserInfo> [[-CaseSensitive]] [[-Name] <String>] [<CommonParameters>]
```
