Get-GPOZaurrOwner
-----------------

### Synopsis
Gets owners of GPOs from Active Directory and SYSVOL

---

### Description

Gets owners of GPOs from Active Directory and SYSVOL

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GPOZaurrOwner -Verbose -IncludeSysvol
```
> EXAMPLE 2

```PowerShell
Get-GPOZaurrOwner -Verbose -IncludeSysvol -SkipBroken
```

---

### Parameters
#### **GPOName**
Name of GPO. By default all GPOs are returned

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **GPOGuid**
GUID of GPO. By default all GPOs are returned

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[String]`|false   |named   |false        |GUID<br/>GPOID|

#### **IncludeSysvol**
Includes Owner from SYSVOL as well

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SkipBroken**
Doesn't display GPOs that have no SYSVOL content (orphaned GPOs)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Forest**
Target different Forest, by default current forest is used

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |named   |false        |ForestName|

#### **ExcludeDomains**
Exclude domain from search, by default whole forest is scanned

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **IncludeDomains**
Include only specific domains, by default whole forest is scanned

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |named   |false        |Domain<br/>Domains|

#### **ExtendedForestInformation**
Ability to provide Forest Information from another command to speed up processing

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |named   |false        |

#### **ADAdministrativeGroups**
Ability to provide AD Administrative Groups from another command to speed up processing

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |named   |false        |

#### **ApprovedOwner**
Ability to provide different owner (non administrative that still is approved for use)

|Type        |Required|Position|PipelineInput|Aliases                 |
|------------|--------|--------|-------------|------------------------|
|`[String[]]`|false   |named   |false        |Exclusion<br/>Exclusions|

---

### Notes
General notes

---

### Syntax
```PowerShell
Get-GPOZaurrOwner [-IncludeSysvol] [-SkipBroken] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-ADAdministrativeGroups <IDictionary>] [-ApprovedOwner <String[]>] [<CommonParameters>]
```
```PowerShell
Get-GPOZaurrOwner [-GPOName <String>] [-IncludeSysvol] [-SkipBroken] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-ADAdministrativeGroups <IDictionary>] [-ApprovedOwner <String[]>] [<CommonParameters>]
```
```PowerShell
Get-GPOZaurrOwner [-GPOGuid <String>] [-IncludeSysvol] [-SkipBroken] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-ADAdministrativeGroups <IDictionary>] [-ApprovedOwner <String[]>] [<CommonParameters>]
```
