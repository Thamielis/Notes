Get-RDMRoleRepositoryAccess
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
|`[Switch]`|false   |named   |false        |

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

#### **Role**
User object, must be retrieved from Get-RDMUser or created via New-RDMUser.

|Type          |Required|Position|PipelineInput |
|--------------|--------|--------|--------------|
|`[PSRoleInfo]`|true    |1       |true (ByValue)|

---

### Inputs
System.String

User

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSRepositoryInfo[]

---

### Notes
For more information, type "Get-Help Get-RDMRoleRepositoryAccess -detailed". For technical information, type "Get-Help Get-RDMRoleRepositoryAccess -full".

---

### Syntax
```PowerShell
Get-RDMRoleRepositoryAccess [-ID] <Guid> [-CaseSensitive] [[-Name] <String>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Get-RDMRoleRepositoryAccess [-Role] <PSRoleInfo> [-CaseSensitive] [[-Name] <String>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
