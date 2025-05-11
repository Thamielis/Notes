New-DSSearchCriteria
--------------------

### Synopsis
Create a search criterion to be used in the Search-DSEntry

---

### Description

Create a search criterion to be used in the Search-DSEntry. The vaults to be searched are determined in the Search-DSEntry cmdlet.
A criterion is determined at two fields: By, to indicate the field where the seach will be applied, and Value, the value whose type depend of the field. For a standard string value, the parameter Match indicates how to search is conducted. For date values, to use a custom interval, the value must be set to Custom and specified with the parameters After and Before.
Search by ConnectionType or Description will ignore PAM vaults.

---

### Related Links
* [Search-DSEntry](Search-DSEntry)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> New-DSSearchCriteria -By Name -Match StartsWith -Value ThePrefix | Search-DSEntry
Search all entries whose name starts with ThePrefix in all vaults, excluding the User vault and the PAM vaults.
```
> EXAMPLE 2

```PowerShell
PS C:\> $criteria = @();
        $criteria += New-DSSearchCriteria -By Username -Value AUsername;
        $criteria += New-DSSearchCriteria -By CreationDate -Value Last30Days;
        Search-DSEntry -InputObject $criteria -IncludePamVaults -IncludeVault @()
Search all PAM entries whose username contains AUsername created in the last 30 days. Only the PAM vaults will be searched.
```

---

### Parameters
#### **After**
Set the inclusive lower custom limit date

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |false        |

#### **Before**
Set the inclusive upper custom limit date

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |false        |

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

#### **IncludeExpired**
Include expired entries

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IncludeManuallyFlaggedExpired**
Include manually flagged expired entries

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Value**
Search date interval for the creation or the last update. For a custom value, use After and Before parameters. By default, it will be set to Last Week.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[DateFilter]`|true    |named   |false        |

---

### Inputs
None

---

### Outputs
* Devolutions.RemoteDesktopManager.Business.MultiVaultSearchItemData

---

### Notes
For more information, type "Get-Help New-DSSearchCriteria -detailed". For technical information, type "Get-Help New-DSSearchCriteria -full".

---

### Syntax
```PowerShell
New-DSSearchCriteria -By <CreationDate | LastUpdateDate> -Value <LastWeek | Today | Yesterday | Custom | LastMonth | CurrentMonth | Last7Days | Last30Days | Last31Days | Last60Days | Last90Days> [-After <DateTime>] [-Before <DateTime>] [<CommonParameters>]
```
```PowerShell
New-DSSearchCriteria -By <DocumentType> -Value <Certificate | Data Source Configuration (.rdd) | Document | Documentation Editor | Email | Html | Image | Microsoft Excel | Microsoft OneNote | Microsoft PowerPoint | Microsoft Visio | Microsoft Word | PDF | Text (RDF) | Video> [<CommonParameters>]
```
```PowerShell
New-DSSearchCriteria -By <ConnectionType> -Value <Credential | Document | Group | RDPConfigured | Root | VPN> [<CommonParameters>]
```
```PowerShell
New-DSSearchCriteria -By <Expiration> [-Value <Int32>] [-IncludeExpired] [-IncludeManuallyFlaggedExpired] [<CommonParameters>]
```
```PowerShell
New-DSSearchCriteria -By <State> -Value <Check Out | Edit Lock | Runnning> [<CommonParameters>]
```
```PowerShell
New-DSSearchCriteria -By <Status> -Value <Default | Locked | Disabled | Warning | Expired | Archived | Broken> [<CommonParameters>]
```
