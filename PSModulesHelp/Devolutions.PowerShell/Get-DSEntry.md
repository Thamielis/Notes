Get-DSEntry
-----------

### Synopsis
Get entry(ies) from your Devolutions Server instance.

---

### Description

Using different parameter sets, returns either all entries (from one or all vaults), a specific entry by filter (Get-Help Get-DSEntry -Parameter FilterBy) or paginated results.

---

### Related Links
* [Get-DSEntryPasswordHistory](Get-DSEntryPasswordHistory)

* [Get-DSEntrySensitiveData](Get-DSEntrySensitiveData)

* [Get-DSEntrySubConnections](Get-DSEntrySubConnections)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-DSEntry
Get the first page containing 25 entries directly in the root of the default vault.
```
> EXAMPLE 2

```PowerShell
PS C:\> Get-DSEntry -SearchAllVaults $EntryId $entryId -AsRDMConnection
Get the entry by its ID. The search covers all vaults. The
```
> EXAMPLE 3

```PowerShell
PS C:\> Get-DSEntry -VaultID $vaultID -All
Get all entries of the specified vault.
```
> EXAMPLE 4

```PowerShell
PS C:\> Get-DSEntry -Filter Name -FilterMatch StartsWith -FilterValue ABC -SearchAllVaults
Get all entries whose name starts with "ABC" in all the vaults.
```

---

### Parameters
#### **All**
Get all entries.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsRDMConnection**
Return a ConnectionInfoEntity instead of a partial connection

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EntryId**
Id of the desired entry

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |1       |false        |

#### **FilterBy**
Field on which the filter will be applied. It will be on the Name by default.
Valid Values:

* None
* ConnectionType
* ContactReference
* CreationDate
* CustomField
* Description
* Domain
* Group
* Host
* IsFavorite
* Keywords
* LastUpdateDate
* Name
* OS
* PasswordStrength
* SecurityGroup
* SerialNumber
* ServerRole
* Status
* Username
* Url
* Version
* IP
* MAC
* Software
* ConnectionSubType
* Expiration
* DocumentType
* State
* AccountingNumber
* PONumber
* InvoiceNumber
* ServiceTag
* AssetTag
* CheckedOutBy

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[SearchItemType]`|false   |2       |false        |

#### **FilterMatch**
Determine the condition of the search. Default condition is Contains.
Valid Values:

* Contains
* StartsWith
* EndsWith
* ExactExpression
* DoesNotContain
* Regex

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[SearchItemText]`|false   |3       |false        |

#### **FilterValue**
Value used in the filter

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **FolderID**
Folder where the entries will be fetched. The default value will the root.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|false   |3       |false        |

#### **PageNumber**
Determine which page is fetched.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |false        |

#### **PageSize**
Number of entries in a page. Default value is 25 entries per page.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |1       |false        |

#### **SearchAllVaults**
All vaults will bew considered for the search.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **VaultID**
Id of the vault to be searched

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|false   |named   |false        |

#### **VaultPassword**
Password of the vault

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.Private.ServerResponse

* RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[System.Management.Automation.PSObject, System.Management.Automation, Version=3.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35]]

* RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[System.Management.Automation.PSObject, System.Management.Automation, Version=3.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35]]

* [Management.Automation.PSObject[]](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject[])

---

### Notes
For more information, type "Get-Help Get-DSEntry -detailed". For technical information, type "Get-Help Get-DSEntry -full".

---

### Syntax
```PowerShell
Get-DSEntry -All [-SearchAllVaults] [-VaultID <Guid>] [-AsLegacyResponse] [<CommonParameters>]
```
```PowerShell
Get-DSEntry [-AsRDMConnection] [-EntryId] <Guid> [[-VaultPassword] <String>] [-SearchAllVaults] [-VaultID <Guid>] [-AsLegacyResponse] [<CommonParameters>]
```
```PowerShell
Get-DSEntry [[-FilterBy] <Name | Username | Folder | Description | Keywords>] [[-FilterMatch] <Contains | StartsWith | EndsWith | ExactExpression>] [-FilterValue] <String> [-SearchAllVaults] [-VaultID <Guid>] [-AsLegacyResponse] [<CommonParameters>]
```
```PowerShell
Get-DSEntry [[-FolderID] <Guid>] [[-PageNumber] <Int32>] [[-PageSize] <Int32>] [-SearchAllVaults] [-VaultID <Guid>] [-AsLegacyResponse] [<CommonParameters>]
```
