New-DSVault
-----------

### Synopsis
Create a new vault

---

### Description

Create a new vault and add users, applications and roles to it if the respective list is supplied.

---

### Related Links
* [Get-DSVault](Get-DSVault)

* [Remove-DSVault](Remove-DSVault)

* [Update-DSVault](Update-DSVault)

---

### Examples
> EXAMPLE

```PowerShell
$Vault = @{
        Name                   = 'NewVault'
        Description            = 'This is a description for the new vault.'
        IsAllowedOffline       = $true
        Password               = 'Pa$$w0rd!'
        AllowedUsernameList    = @("User1")
        AllowedRolesList       = @("Role1", "Role2")
        AllowedApplicationList = @("App1")
        }

        $response = New-DSVault @Vault
Create the vault NewVault who can be accessed by User1, App1 and the roles Role1 and Role2.
```

---

### Parameters
#### **AllowedApplicationList**
Accept an array of strings containing application names (not app id) to add to the vault

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |5       |false        |

#### **AllowedRolesList**
Accept an array of strings containing user group's name (not id) to add to the vault

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |6       |false        |

#### **AllowedUsernameList**
Accept an array of strings containing usernames (not id) to add to the vault

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |4       |false        |

#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Description**
Vault's description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **IsAllowedOffline**
Specify if the vault is allowed to be used while offline. It is allowed by default.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |3       |false        |

#### **Name**
Name of the vault

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Password**
Vault's master password. Backend does not verify password complexity, so you should use New-DSPassword and choose a password in the list

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **SecurityLevel**
Set the security level. A high security level disables the offline mode. The default value is High.
Valid Values:

* Standard
* High

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VaultSecurityLevel]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.Private.ServerResponse

---

### Notes
For more information, type "Get-Help New-DSVault -detailed". For technical information, type "Get-Help New-DSVault -full".

---

### Syntax
```PowerShell
New-DSVault [[-AllowedApplicationList] <String[]>] [[-AllowedRolesList] <String[]>] [[-AllowedUsernameList] <String[]>] [[-Description] <String>] [[-IsAllowedOffline] <Boolean>] -Name <String> [[-Password] <String>] [-SecurityLevel <Standard | High>] [-AsLegacyResponse] [<CommonParameters>]
```
