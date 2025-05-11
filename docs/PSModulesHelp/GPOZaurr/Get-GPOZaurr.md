Get-GPOZaurr
------------

### Synopsis
Gets information about all Group Policies. Similar to what Get-GPO provides by default.

---

### Description

Gets information about all Group Policies. Similar to what Get-GPO provides by default.

---

### Examples
> EXAMPLE 1

```PowerShell
$GPOs = Get-GPOZaurr
$GPOs | Format-Table DisplayName, Owner, OwnerSID, OwnerType
```
> EXAMPLE 2

```PowerShell
$GPO = Get-GPOZaurr -GPOName 'ALL | Allow use of biometrics'
$GPO | Format-List *
```
> EXAMPLE 3

```PowerShell
$GPOS = Get-GPOZaurr -ExcludeGroupPolicies {
    Skip-GroupPolicy -Name 'de14_usr_std'
    Skip-GroupPolicy -Name 'de14_usr_std' -DomaiName 'ad.evotec.xyz'
    Skip-GroupPolicy -Name 'All | Trusted Websites' #-DomaiName 'ad.evotec.xyz'
    '{D39BF08A-87BF-4662-BFA0-E56240EBD5A2}'
    'COMPUTERS | Enable Sets'
}
$GPOS | Format-Table -AutoSize *
```

---

### Parameters
#### **ExcludeGroupPolicies**
Marks the GPO as excluded from the list.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **GPOName**
Provide a GPOName to get information about a specific GPO.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **GPOGuid**
Provide a GPOGuid to get information about a specific GPO.

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[String]`|false   |3       |false        |GUID<br/>GPOID|

#### **Type**
Choose a specific type of GPO. Options are: 'Empty', 'Unlinked', 'Disabled', 'NoApplyPermission', 'All'. Default is All.
Valid Values:

* Empty
* Unlinked
* Disabled
* NoApplyPermission
* All

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |4       |false        |

#### **Forest**
Target different Forest, by default current forest is used

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |5       |false        |ForestName|

#### **ExcludeDomains**
Exclude domain from search, by default whole forest is scanned

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |6       |false        |

#### **IncludeDomains**
Include only specific domains, by default whole forest is scanned

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |7       |false        |Domain<br/>Domains|

#### **ExtendedForestInformation**
Ability to provide Forest Information from another command to speed up processing

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |8       |false        |

#### **GPOPath**
Define GPOPath where the XML files are located to be analyzed instead of asking Active Directory

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |9       |false        |

#### **PermissionsOnly**
Only show permissions, by default all information is shown

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **OwnerOnly**
only show owner information, by default all information is shown

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Limited**
Provide limited output without analyzing XML data

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ADAdministrativeGroups**
Ability to provide ADAdministrativeGroups from different function to speed up processing

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |10      |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Get-GPOZaurr [[-ExcludeGroupPolicies] <ScriptBlock>] [[-GPOName] <String>] [[-GPOGuid] <String>] [[-Type] <String[]>] [[-Forest] <String>] [[-ExcludeDomains] <String[]>] [[-IncludeDomains] <String[]>] [[-ExtendedForestInformation] <IDictionary>] [[-GPOPath] <String[]>] [-PermissionsOnly] [-OwnerOnly] [-Limited] [[-ADAdministrativeGroups] <IDictionary>] [<CommonParameters>]
```
