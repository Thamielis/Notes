Get-GPOZaurrInheritance
-----------------------

### Synopsis
Retrieves inheritance information for Group Policy Objects (GPOs) within specified Organizational Units (OUs).

---

### Description

This function retrieves and displays inheritance information for GPOs within specified OUs. It provides details on blocked inheritance, excluded objects, and group policies associated with blocked objects.

---

### Examples
> EXAMPLE 1

```PowerShell
$Objects = Get-GPOZaurrInheritance -IncludeBlockedObjects -IncludeExcludedObjects -OnlyBlockedInheritance -Exclusions $ExcludedOU
$Objects | Format-Table
```

---

### Parameters
#### **IncludeBlockedObjects**
Specifies whether to include OUs with blocked inheritance. By default, this is disabled.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **OnlyBlockedInheritance**
Specifies whether to show only OUs with blocked inheritance.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IncludeExcludedObjects**
Specifies whether to show excluded objects. By default, this is disabled.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IncludeGroupPoliciesForBlockedObjects**
Specifies whether to include Group Policies for blocked objects. By default, this is disabled.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Exclusions**
Specifies the OUs approved by IT to be excluded. You can provide OUs by canonical name or distinguishedName.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **Forest**
Specifies the target forest. By default, the current forest is used.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |2       |false        |ForestName|

#### **ExcludeDomains**
Specifies the domain to exclude from the search. By default, the entire forest is scanned.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |false        |

#### **IncludeDomains**
Specifies specific domains to include. By default, the entire forest is scanned.

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |4       |false        |Domain<br/>Domains|

#### **ExtendedForestInformation**
Allows providing Forest Information from another command to speed up processing.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |5       |false        |

---

### Notes
These are general notes about the function.

---

### Syntax
```PowerShell
Get-GPOZaurrInheritance [-IncludeBlockedObjects] [-OnlyBlockedInheritance] [-IncludeExcludedObjects] [-IncludeGroupPoliciesForBlockedObjects] [[-Exclusions] <String[]>] [[-Forest] <String>] [[-ExcludeDomains] <String[]>] [[-IncludeDomains] <String[]>] [[-ExtendedForestInformation] <IDictionary>] [<CommonParameters>]
```
