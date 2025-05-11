Backup-GPOZaurr
---------------

### Synopsis
Provides Backup functionality to Group Policies

---

### Description

Provides Backup functionality to Group Policies

---

### Examples
> EXAMPLE 1

```PowerShell
$GPOSummary = Backup-GPOZaurr -BackupPath "$Env:UserProfile\Desktop\GPO" -Verbose -Type All
$GPOSummary | Format-Table # only if you want to display output of backup
```
> EXAMPLE 2

```PowerShell
$GPOSummary = Backup-GPOZaurr -BackupPath "$Env:UserProfile\Desktop\GPO" -Verbose -Type All -BackupDated
$GPOSummary | Format-Table # only if you want to display output of backup
```

---

### Parameters
#### **LimitProcessing**
Limits amount of GPOs that are backed up

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |1       |false        |

#### **Type**
Provides a way to backup only Empty or Unlinked GPOs. The default is All.
Valid Values:

* Empty
* Unlinked
* Disabled
* All

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **Forest**
Target different Forest, by default current forest is used

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |3       |false        |ForestName|

#### **ExcludeDomains**
Exclude domain from search, by default whole forest is scanned

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |4       |false        |

#### **IncludeDomains**
Include only specific domains, by default whole forest is scanned

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |5       |false        |Domain<br/>Domains|

#### **ExtendedForestInformation**
Ability to provide Forest Information from another command to speed up processing

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |6       |false        |

#### **BackupPath**
Path where to keep the backup

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **BackupDated**
Whether cmdlet should created Dated folders for executed backup or not. Keep in mind it's not nessecary and two backups made to same folder have their dates properly tagged

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---

### Notes
General notes

---

### Syntax
```PowerShell
Backup-GPOZaurr [[-LimitProcessing] <Int32>] [[-Type] <String[]>] [[-Forest] <String>] [[-ExcludeDomains] <String[]>] [[-IncludeDomains] <String[]>] [[-ExtendedForestInformation] <IDictionary>] [[-BackupPath] <String>] [-BackupDated] [-WhatIf] [-Confirm] [<CommonParameters>]
```
