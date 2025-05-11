Repair-GPOZaurrPermission
-------------------------

### Synopsis
Repairs permissions for Group Policy Objects (GPOs) based on specified criteria.

---

### Description

The Repair-GPOZaurrPermission function repairs permissions for GPOs based on the specified criteria. It analyzes the permissions of GPOs and adds necessary permissions if they are missing.

---

### Examples
> EXAMPLE 1

```PowerShell
Repair-GPOZaurrPermission -Type 'All' -Forest 'ContosoForest' -IncludeDomains @('Domain1', 'Domain2') -ExcludeDomains @('Domain3') -ExtendedForestInformation $info -LimitProcessing 100
Repairs permissions for all types of users in the 'ContosoForest' forest, including only 'Domain1' and 'Domain2' while excluding 'Domain3', with extended forest information and processing a maximum of 100 GPOs.
```

---

### Parameters
#### **Type**
Specifies the type of permissions to repair. Valid values are 'AuthenticatedUsers', 'Unknown', 'System', 'Administrative', and 'All'.
Valid Values:

* AuthenticatedUsers
* Unknown
* System
* Administrative
* All

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |1       |false        |

#### **Forest**
Specifies the forest name to analyze GPO permissions.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |2       |false        |ForestName|

#### **ExcludeDomains**
Specifies an array of domains to exclude from the analysis.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |false        |

#### **IncludeDomains**
Specifies an array of domains to include in the analysis.

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |4       |false        |Domain<br/>Domains|

#### **ExtendedForestInformation**
Specifies additional information about the forest.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |5       |false        |

#### **LimitProcessing**
Specifies the maximum number of GPOs to process.

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
Repair-GPOZaurrPermission [-Type] <String[]> [[-Forest] <String>] [[-ExcludeDomains] <String[]>] [[-IncludeDomains] <String[]>] [[-ExtendedForestInformation] <IDictionary>] [[-LimitProcessing] <Int32>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
