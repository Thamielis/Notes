Remove-GPOZaurrDuplicateObject
------------------------------

### Synopsis
Removes duplicate Group Policy Objects (GPOs) identified by the Get-GPOZaurrDuplicateObject function.

---

### Description

This function removes duplicate GPOs based on the criteria provided. It retrieves duplicate GPO objects using Get-GPOZaurrDuplicateObject and then attempts to remove them from the Active Directory.

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-GPOZaurrDuplicateObject -Forest "contoso.com" -IncludeDomains "domain1.com", "domain2.com" -ExcludeDomains "domain3.com" -LimitProcessing 5
Description:
Removes duplicate GPOs from the forest "contoso.com" for domains "domain1.com" and "domain2.com", excluding "domain3.com", processing only the first 5 duplicates.
```

---

### Parameters
#### **LimitProcessing**
Specifies the maximum number of duplicate GPOs to process. Default is set to [int32]::MaxValue.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |1       |false        |

#### **Forest**
Specifies the forest where the duplicate GPOs are located.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |2       |false        |ForestName|

#### **ExcludeDomains**
Specifies an array of domains to exclude from the duplicate GPO removal process.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |false        |

#### **IncludeDomains**
Specifies an array of domains to include in the duplicate GPO removal process.

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |4       |false        |Domain<br/>Domains|

#### **ExtendedForestInformation**
Specifies additional information about the forest.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |5       |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---

### Syntax
```PowerShell
Remove-GPOZaurrDuplicateObject [[-LimitProcessing] <Int32>] [[-Forest] <String>] [[-ExcludeDomains] <String[]>] [[-IncludeDomains] <String[]>] [[-ExtendedForestInformation] <IDictionary>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
