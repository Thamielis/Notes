Update-DSVault
--------------

### Synopsis
Update a vault.

---

### Description

Update a vault using the supplied parameters. If name is present, it cannot be null nor empty. Backend does not verify password complexity, so use New-DSPassword to generate a strong password with house policy.

---

### Related Links
* [Get-DSVault](Get-DSVault)

* [New-DSVault](New-DSVault)

* [Remove-DSVault](Remove-DSVault)

---

### Examples
> EXAMPLE

```PowerShell
$UpdatedVault = @{
            VaultID                = "36120922-539d-4550-8567-fc4f21d77352"
            Name                   = "Test"
            Description            = "Test"
            IsAllowedOffline       = $false
            Password               = 'Pa$$w0rd!'
            AllowedUsersList       = @("User1")
            AllowedRolesList       = @("Role1")
            AllowedApplicationList = @("App1")
        }

    Update-DSVault @UpdatedVault -Verbose
Update an existing vault whose ID is 36120922-539d-4550-8567-fc4f21d77352. All other fields are modified by the value specified in the hash table.
```

---

### Parameters
#### **AllowedApplicationList**
Accept an array of strings containing application names (not app id) to add to the vault

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |6       |false        |

#### **AllowedRolesList**
Accept an array of strings containing user group's name (not id) to add to the vault

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |7       |false        |

#### **AllowedUsernameList**
Accept an array of strings containing usernames (not id) to add to the vault

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |5       |false        |

#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Description**
Vault's description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **InputObject**
Vault obtained from Get-DSVault

|Type                |Required|Position|PipelineInput |
|--------------------|--------|--------|--------------|
|`[RepositoryEntity]`|true    |named   |true (ByValue)|

#### **IsAllowedOffline**
Specify if the vault is allowed to be used while offline. Its default value is true.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |4       |false        |

#### **Name**
Vault's name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Password**
Vault's master password. Backend does not verify password complexity, so you should use New-DSPassword and choose a password in the list

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **VaultID**
Vault's ID to update

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.Private.ServerResponse

---

### Notes
For more information, type "Get-Help Update-DSVault -detailed". For technical information, type "Get-Help Update-DSVault -full".

---

### Syntax
```PowerShell
Update-DSVault -VaultID <Guid> [[-AllowedUsernameList] <String[]>] [[-AllowedApplicationList] <String[]>] [[-AllowedRolesList] <String[]>] [[-Description] <String>] [[-IsAllowedOffline] <Boolean>] [[-Name] <String>] [[-Password] <String>] [-AsLegacyResponse] [<CommonParameters>]
```
```PowerShell
Update-DSVault -InputObject <RepositoryEntity> [[-AllowedUsernameList] <String[]>] [[-AllowedApplicationList] <String[]>] [[-AllowedRolesList] <String[]>] [[-Description] <String>] [[-IsAllowedOffline] <Boolean>] [[-Name] <String>] [[-Password] <String>] [-AsLegacyResponse] [<CommonParameters>]
```
