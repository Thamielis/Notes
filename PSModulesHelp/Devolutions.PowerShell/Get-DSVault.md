Get-DSVault
-----------

### Synopsis
Get vault(s) from the Devolutions Server instance.

---

### Description

Get vaults in the Devolutions Server instance in three ways: a single vault by its ID, all vaults, or a subset of vaults from pagination.

---

### Related Links
* [New-DSVault](New-DSVault)

* [Remove-DSVault](Remove-DSVault)

* [Update-DSVault](Update-DSVault)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $vaults = Get-DSVault -All
Retrieve all vaults and store the ServerResponse<RepositoryEntity[]> in $vaults.
```
> EXAMPLE 2

```PowerShell
PS C:\> $vault = Get-DSVault -VaultID 00000000-0000-0000-0000-000000000000
Retrieve the vault with the matching ID and store the ServerResponse<RepositoryEntity> in $vault.
```
> EXAMPLE 3

```PowerShell
PS C:\> $vaults = Get-DSVault -PageNumber 2 -PageSize 10
Retrieve the second page of 10 vaults and store the ServerResponse<RepositoryEntity[]> in $vaults.
```

---

### Parameters
#### **All**
Fetches all vaults.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Descending**
Sort the field in the descending order.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Legacy**
Deprecated. Do not use.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **PageNumber**
Specify the desired page. If not specified, the first one will be returned.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **PageSize**
Number of vaults in a page. If not specified, there will be 25 vaults per page.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **SortField**
Specify the field on which the vaults will be ordered.
Valid Values:

* Name
* Description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **VaultID**
Specify the ID of the desired vault.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

---

### Inputs
None

---

### Outputs
* Devolutions.RemoteDesktopManager.Business.Entities.RepositoryEntity[]

* RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[Devolutions.RemoteDesktopManager.Business.Entities.RepositoryEntity, RemoteDesktopManager.Business, Version=2024.2.1.0, Culture=neutral, PublicKeyToken=null]]

* RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[Devolutions.RemoteDesktopManager.Business.Entities.RepositoryEntity, RemoteDesktopManager.Business, Version=2024.2.1.0, Culture=neutral, PublicKeyToken=null]]

---

### Notes
For more information, type "Get-Help Get-DSVault -detailed". For technical information, type "Get-Help Get-DSVault -full".

---

### Syntax
```PowerShell
Get-DSVault -All [-AsLegacyResponse] [<CommonParameters>]
```
```PowerShell
Get-DSVault [-Descending] [-PageNumber <Int32>] [-PageSize <Int32>] [-SortField <Name | Description>] [-AsLegacyResponse] [<CommonParameters>]
```
```PowerShell
Get-DSVault -Legacy [-AsLegacyResponse] [<CommonParameters>]
```
```PowerShell
Get-DSVault -VaultID <Guid> [-AsLegacyResponse] [<CommonParameters>]
```
