Get-GPOZaurrOrganizationalUnit
------------------------------

### Synopsis
Retrieves information about Group Policy Objects (GPOs) linked to Organizational Units (OUs) within a specified forest.

---

### Description

This function retrieves detailed information about the GPOs linked to OUs within a specified forest. It provides information on linked GPOs, objects within OUs, and counts of objects at different levels.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GPOZaurrOrganizationalUnit -Forest "contoso.com" -IncludeDomains "child.contoso.com" -ExcludeDomains "test.contoso.com" -ExtendedForestInformation $ExtendedInfo -Option "OK" -ExcludeOrganizationalUnit "OU=Test,DC=contoso,DC=com"
Retrieves information about GPOs linked to OUs in the "contoso.com" forest, including the "child.contoso.com" domain, excluding the "test.contoso.com" domain, with additional forest information, performing the 'OK' action, and excluding the "OU=Test,DC=contoso,DC=com" OU.
```

---

### Parameters
#### **Forest**
Specifies the name of the forest to retrieve information from.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |1       |false        |ForestName|

#### **ExcludeDomains**
Specifies an array of domains to exclude from processing.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **IncludeDomains**
Specifies an array of domains to include for processing.

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |3       |false        |Domain<br/>Domains|

#### **ExtendedForestInformation**
Specifies additional information about the forest.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |4       |false        |

#### **Option**
Specifies the action to perform on the retrieved data. Valid values are 'OK', 'Unlink', or 'Delete'.
Valid Values:

* OK
* Unlink
* Delete

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |5       |false        |

#### **ExcludeOrganizationalUnit**
Specifies an array of OUs to exclude from processing.

|Type        |Required|Position|PipelineInput|Aliases                 |
|------------|--------|--------|-------------|------------------------|
|`[String[]]`|false   |6       |false        |ExcludeOU<br/>Exclusions|

---

### Syntax
```PowerShell
Get-GPOZaurrOrganizationalUnit [[-Forest] <String>] [[-ExcludeDomains] <String[]>] [[-IncludeDomains] <String[]>] [[-ExtendedForestInformation] <IDictionary>] [[-Option] <String[]>] [[-ExcludeOrganizationalUnit] <String[]>] [<CommonParameters>]
```
