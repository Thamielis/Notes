Remove-GPOZaurrLinkEmptyOU
--------------------------

### Synopsis
Removes Group Policy Object (GPO) links from empty Organizational Units (OUs) in a specified forest.

---

### Description

This function removes GPO links from OUs that are empty and meet specified criteria. It processes OUs within the specified forest based on inclusion and exclusion rules.

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-GPOZaurrLinkEmptyOU -Forest "ContosoForest" -IncludeDomains @("domain1", "domain2") -ExcludeDomains @("domain3") -ExtendedForestInformation $info -ExcludeOrganizationalUnit @("OU=TestOU,DC=contoso,DC=com") -LimitProcessing 100
Removes GPO links from empty OUs in the "ContosoForest" forest, including domains "domain1" and "domain2" but excluding "domain3". Additional forest information is provided, and processing is limited to 100 OUs.
```

---

### Parameters
#### **Forest**
Specifies the name of the forest to target for processing.

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

#### **ExcludeOrganizationalUnit**
Specifies an array of OUs to exclude from processing.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |5       |false        |

#### **LimitProcessing**
Specifies the maximum number of OUs to process.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |6       |false        |

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
Remove-GPOZaurrLinkEmptyOU [[-Forest] <String>] [[-ExcludeDomains] <String[]>] [[-IncludeDomains] <String[]>] [[-ExtendedForestInformation] <IDictionary>] [[-ExcludeOrganizationalUnit] <String[]>] [[-LimitProcessing] <Int32>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
