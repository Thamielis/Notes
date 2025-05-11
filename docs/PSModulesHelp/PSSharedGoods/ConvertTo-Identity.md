ConvertTo-Identity
------------------

### Synopsis
Converts an identity to its corresponding information.

---

### Description

This function converts an identity to its corresponding information, such as Name, SID, Type, and Class. It retrieves information from Active Directory based on the provided identity.

---

### Examples
> EXAMPLE 1

```PowerShell
ConvertTo-Identity -Identity "JohnDoe" -Forest "example.com" -IncludeDomains "domain1", "domain2" -ExcludeDomains "domain3" -ADAdministrativeGroups $ADGroups -ExtendedForestInformation $ExtendedInfo
Converts the identity "JohnDoe" in the forest "example.com", including domains "domain1" and "domain2" while excluding "domain3", using the specified administrative groups and extended forest information.
```

---

### Parameters
#### **Identity**
Specifies the identity to convert.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **ADAdministrativeGroups**
Specifies the Active Directory administrative groups.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |2       |false        |

#### **Forest**
Specifies the forest name.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |3       |false        |ForestName|

#### **ExcludeDomains**
Specifies the domains to exclude.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |4       |false        |

#### **IncludeDomains**
Specifies the domains to include.

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |5       |false        |Domain<br/>Domains|

#### **ExtendedForestInformation**
Specifies additional information about the forest.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |6       |false        |

---

### Notes
File Name      : ConvertTo-Identity.ps1
Prerequisite   : This function requires Active Directory PowerShell module.

---

### Syntax
```PowerShell
ConvertTo-Identity [[-Identity] <String>] [[-ADAdministrativeGroups] <IDictionary>] [[-Forest] <String>] [[-ExcludeDomains] <String[]>] [[-IncludeDomains] <String[]>] [[-ExtendedForestInformation] <IDictionary>] [<CommonParameters>]
```
