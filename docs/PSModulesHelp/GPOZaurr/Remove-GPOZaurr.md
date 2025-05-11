Remove-GPOZaurr
---------------

### Synopsis
Removes Group Policy Objects based on specified criteria.

---

### Description

The Remove-GPOZaurr function removes Group Policy Objects (GPOs) based on the specified criteria. It allows for filtering by various parameters such as GPO type, forest, domains, and more.

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-GPOZaurr -Type 'Empty' -Forest 'Contoso' -IncludeDomains 'Domain1', 'Domain2' -BackupPath 'C:\GPOBackups' -BackupDated -RequireDays 7
Removes all empty GPOs from the 'Contoso' forest for 'Domain1' and 'Domain2', backs them up to 'C:\GPOBackups' with dated folders, and requires removal after 7 days.
```
> EXAMPLE 2

```PowerShell
Remove-GPOZaurr -Type 'Disabled' -Forest 'Fabrikam' -ExcludeDomains 'Domain3' -LimitProcessing 10
Removes all disabled GPOs from the 'Fabrikam' forest excluding 'Domain3' and processes only the first 10 GPOs.
```

---

### Parameters
#### **ExcludeGroupPolicies**
Specifies the Group Policies to exclude from removal.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |2       |false        |

#### **Type**
Specifies the type of GPOs to target for removal. Valid values are 'Empty', 'Unlinked', 'Disabled', 'NoApplyPermission'.
Valid Values:

* Empty
* Unlinked
* Disabled
* NoApplyPermission

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |1       |false        |

#### **LimitProcessing**
Specifies the maximum number of GPOs to process before stopping.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Forest**
Specifies the forest to target for GPO removal.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |named   |false        |ForestName|

#### **ExcludeDomains**
Specifies the domains to exclude from GPO removal.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **IncludeDomains**
Specifies the domains to include for GPO removal.

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |named   |false        |Domain<br/>Domains|

#### **ExtendedForestInformation**
Specifies additional information about the forest.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |named   |false        |

#### **GPOPath**
Specifies the path to the GPOs to be removed.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **BackupPath**
Specifies the path for backing up GPOs before removal.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **BackupDated**
Indicates whether the backup should be dated.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RequireDays**
Specifies the number of days before GPO removal is required.

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
Remove-GPOZaurr [[-ExcludeGroupPolicies] <ScriptBlock>] [-Type] <String[]> [-LimitProcessing <Int32>] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-GPOPath <String[]>] [-BackupPath <String>] [-BackupDated] [-RequireDays <Int32>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
