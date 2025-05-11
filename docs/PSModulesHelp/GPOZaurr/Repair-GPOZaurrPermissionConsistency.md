Repair-GPOZaurrPermissionConsistency
------------------------------------

### Synopsis
Repairs permission consistency for Group Policy Objects (GPOs) in a specified domain or forest.

---

### Description

The Repair-GPOZaurrPermissionConsistency function repairs permission consistency for GPOs in a specified domain or forest. It checks for inconsistencies in GPO permissions and attempts to make them consistent.

---

### Examples
> EXAMPLE 1

```PowerShell
Repair-GPOZaurrPermissionConsistency -GPOName "ExampleGPO" -Forest "example.com"
Repairs permission consistency for the GPO named "ExampleGPO" in the "example.com" forest.
```
> EXAMPLE 2

```PowerShell
Repair-GPOZaurrPermissionConsistency -GPOGuid "12345678-1234-1234-1234-1234567890AB" -ExcludeDomains @("domain1", "domain2") -LimitProcessing 5
Repairs permission consistency for the GPO with the specified GUID, excluding domains "domain1" and "domain2", and processing a maximum of 5 GPOs.
```

---

### Parameters
#### **GPOName**
Specifies the name of the GPO to repair.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **GPOGuid**
Specifies the GUID of the GPO to repair.

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[String]`|false   |named   |false        |GUID<br/>GPOID|

#### **Forest**
Specifies the forest where the GPOs are located.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |named   |false        |ForestName|

#### **ExcludeDomains**
Specifies an array of domains to exclude from the repair process.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **IncludeDomains**
Specifies an array of domains to include in the repair process.

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |named   |false        |Domain<br/>Domains|

#### **ExtendedForestInformation**
Specifies additional information about the forest.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |named   |false        |

#### **LimitProcessing**
Specifies the maximum number of GPOs to process.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

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
Repair-GPOZaurrPermissionConsistency [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-LimitProcessing <Int32>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Repair-GPOZaurrPermissionConsistency [-GPOName <String>] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-LimitProcessing <Int32>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Repair-GPOZaurrPermissionConsistency [-GPOGuid <String>] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-LimitProcessing <Int32>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
