Search-DSEntry
--------------

### Synopsis
Search an entry in the DVLS instance

---

### Description

Search an entry in the DVLS instance.
There are two way to execute a search. This cmdlet allows a simple search with a single criterion using three parameters: By, Match, and Value. For a more complex search or ease of use, criteria can be created with the cmdlet New-DSSearchCriteria. The InputObject will accept an array of those criteria.
By default, all vaults are searched, except the User vault and the PAM vaults. For those two vaults, each will be included by using the corresponding parameter: IncludeUserVault and IncludePAMVaults. It is also possible to search only a subset of vaults by using one of IncludeVault and ExcludeVault.

---

### Related Links
* [New-DSSearchCriteria](New-DSSearchCriteria)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Search-DSEntry -By Name -Match ExactExpression -Value 'SomeValue' -IncludeVault @($pamVaultAID, $pamVaultBID)
Search in the two vaults identified by the IDs stored in $pamvaultAID and $pamVaultBID for an entry whose name named 'SomeValue'
```
> EXAMPLE 2

```PowerShell
PS C:\> New-DSSearchCriteria -By Name -Match StartsWith -Value ThePrefix | Search-DSEntry
Search all entries whose name starts with ThePrefix in all vaults, excluding the User vault and the PAM vaults.
```
> EXAMPLE 3

```PowerShell
PS C:\> $criteria = @();
        $criteria += New-DSSearchCriteria -By Username -Value AUsername;
        $criteria += New-DSSearchCriteria -By CreationDate -Value Last30Days;
        Search-DSEntry -InputObject $criteria -IncludePamVaults -IncludeVault @()
Search all PAM entries whose username contains AUsername created in the last 30 days. Only the PAM vaults will be searched.
```

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **By**
Field on which the expression will be applied
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
|`[SearchItemType]`|true    |1       |false        |

#### **ExcludeVault**
Vaults to be excluded from the search.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|false   |named   |false        |

#### **IncludePAMVaults**
Include the PAM Vaults

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IncludeUserVault**
Include the user vault

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IncludeVault**
Vaults to be searched. If not specified, all of them will be searched except the PAM Vaults and User vault. For the PAM vaults or User vault, use the corresponding switch.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|false   |named   |false        |

#### **InputObject**
Search criteria created from New-DSSearchCriteria

|Type                          |Required|Position|PipelineInput |
|------------------------------|--------|--------|--------------|
|`[MultiVaultSearchItemData[]]`|true    |1       |true (ByValue)|

#### **Match**
Condition the expression must respect. By default, the condition is 'Contains'.
Valid Values:

* Contains
* StartsWith
* EndsWith
* ExactExpression
* DoesNotContain
* Regex

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[SearchItemText]`|false   |named   |false        |

#### **Value**
String value

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

---

### Inputs
Devolutions.RemoteDesktopManager.Business.MultiVaultSearchItemData[]

Array of criteria created by New-DSSearchCriteria calls.

---

### Outputs
* RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[System.Management.Automation.PSObject, System.Management.Automation, Version=3.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35]]

---

### Notes
For more information, type "Get-Help Search-DSEntry -detailed". For technical information, type "Get-Help Search-DSEntry -full".

---

### Syntax
```PowerShell
Search-DSEntry [-InputObject] <MultiVaultSearchItemData[]> [-ExcludeVault <Guid[]>] [-IncludeVault <Guid[]>] [-IncludePAMVaults] [-IncludeUserVault] [-AsLegacyResponse] [<CommonParameters>]
```
```PowerShell
Search-DSEntry [-By] <AccountingNumber | AssetTag | CheckedOutBy | ConnectionSubType | ConnectionType | CreationDate | Description | DocumentType | Expiration | Folder | InvoiceNumber | LastUpdateDate | Name | PONumber | ServiceTag | State | Status | Tags | Username> [-Match <Contains | EndsWith | ExactExpression | StartsWith>] -Value <String> [-ExcludeVault <Guid[]>] [-IncludeVault <Guid[]>] [-IncludePAMVaults] [-IncludeUserVault] [-AsLegacyResponse] [<CommonParameters>]
```
