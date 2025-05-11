Clear-GPOZaurrSysvolDFSR
------------------------

### Synopsis
Clears the ConflictAndDeleted folder in DFSR for specified GPOs.

---

### Description

This function clears the ConflictAndDeleted folder in DFSR for specified Group Policy Objects (GPOs) within a given forest. It allows excluding specific domains and domain controllers if needed.

---

### Examples
> EXAMPLE 1

```PowerShell
Clear-GPOZaurrSysvolDFSR -Forest "contoso.com" -IncludeDomains "child.contoso.com" -ExcludeDomainControllers "dc1.contoso.com" -SkipRODC
Clears the ConflictAndDeleted folder in DFSR for GPOs in the "contoso.com" forest, including only the "child.contoso.com" domain and excluding the "dc1.contoso.com" domain controller.
```
> EXAMPLE 2

```PowerShell
Clear-GPOZaurrSysvolDFSR -Forest "contoso.com" -IncludeDomains "child.contoso.com" -LimitProcessing 5
Clears the ConflictAndDeleted folder in DFSR for GPOs in the "contoso.com" forest, including only the "child.contoso.com" domain, and processes a maximum of 5 GPOs.
```

---

### Parameters
#### **Forest**
Specifies the forest name where the GPOs are located.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |1       |false        |ForestName|

#### **ExcludeDomains**
Specifies an array of domains to exclude from the cleanup process.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **ExcludeDomainControllers**
Specifies an array of domain controllers to exclude from the cleanup process.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |false        |

#### **IncludeDomains**
Specifies an array of domains to include in the cleanup process.

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |4       |false        |Domain<br/>Domains|

#### **IncludeDomainControllers**
Specifies an array of domain controllers to include in the cleanup process.

|Type        |Required|Position|PipelineInput|Aliases          |
|------------|--------|--------|-------------|-----------------|
|`[String[]]`|false   |5       |false        |DomainControllers|

#### **SkipRODC**
Indicates whether Read-Only Domain Controllers (RODCs) should be skipped during cleanup.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ExtendedForestInformation**
Specifies additional forest information if needed.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |6       |false        |

#### **LimitProcessing**
Specifies the maximum number of GPOs to process.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |7       |false        |

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
Clear-GPOZaurrSysvolDFSR [[-Forest] <String>] [[-ExcludeDomains] <String[]>] [[-ExcludeDomainControllers] <String[]>] [[-IncludeDomains] <String[]>] [[-IncludeDomainControllers] <String[]>] [-SkipRODC] [[-ExtendedForestInformation] <IDictionary>] [[-LimitProcessing] <Int32>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
