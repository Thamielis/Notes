Get-GPOZaurrBroken
------------------

### Synopsis
Detects broken or otherwise damaged Group Policies

---

### Description

Detects broken or otherwise damaged Group Policies providing insight whether GPO exists in both AD and SYSVOL.
It provides few statuses:
- Permissions issue - means account couldn't read GPO due to permissions
- ObjectClass issue - means that ObjectClass is of type Container, rather than expected groupPolicyContainer
- Not available on SYSVOL - means SYSVOL data is missing, yet AD metadata is available
- Not available in AD - means AD metadata is missing, yet SYSVOL data is available
- Exists - means AD metadata and SYSVOL data are available

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GPOZaurrBroken -Verbose | Format-Table
```

---

### Parameters
#### **Forest**
Target different Forest, by default current forest is used

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |1       |false        |ForestName|

#### **ExcludeDomains**
Exclude domain from search, by default whole forest is scanned

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **ExcludeDomainControllers**
Exclude specific domain controllers, by default there are no exclusions, as long as VerifyDomainControllers switch is enabled. Otherwise this parameter is ignored.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |false        |

#### **IncludeDomains**
Include only specific domains, by default whole forest is scanned

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |4       |false        |Domain<br/>Domains|

#### **IncludeDomainControllers**
Include only specific domain controllers, by default all domain controllers are included, as long as VerifyDomainControllers switch is enabled. Otherwise this parameter is ignored.

|Type        |Required|Position|PipelineInput|Aliases          |
|------------|--------|--------|-------------|-----------------|
|`[String[]]`|false   |5       |false        |DomainControllers|

#### **SkipRODC**
Skip Read-Only Domain Controllers. By default all domain controllers are included.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ExtendedForestInformation**
Ability to provide Forest Information from another command to speed up processing

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |6       |false        |

#### **VerifyDomainControllers**
Forces cmdlet to check GPO Existance on Domain Controllers rather then per domain

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Get-GPOZaurrBroken [[-Forest] <String>] [[-ExcludeDomains] <String[]>] [[-ExcludeDomainControllers] <String[]>] [[-IncludeDomains] <String[]>] [[-IncludeDomainControllers] <String[]>] [-SkipRODC] [[-ExtendedForestInformation] <IDictionary>] [-VerifyDomainControllers] [<CommonParameters>]
```
