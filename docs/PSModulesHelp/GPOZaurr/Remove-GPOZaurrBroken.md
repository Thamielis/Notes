Remove-GPOZaurrBroken
---------------------

### Synopsis
Finds and removes broken Group Policies from SYSVOL or AD or both.

---

### Description

Finds and removes broken Group Policies from SYSVOL or AD or both. Assesment is based on Get-GPOZaurrBroken and there are 3 supported types:
- AD - meaning GPOs which have no SYSVOL content will be deleted from AD
- SYSVOL - meaning GPOs which have no AD content will be deleted from SYSVOL
- ObjectClass - meaning GPOs which have ObjectClass category of Container rather than groupPolicyContainer will be deleted from AD & SYSVOL

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-GPOZaurrBroken -Verbose -WhatIf -Type AD, SYSVOL
```
> EXAMPLE 2

```PowerShell
Remove-GPOZaurrBroken -Verbose -WhatIf -Type AD, SYSVOL -IncludeDomains 'ad.evotec.pl' -LimitProcessing 2
```
> EXAMPLE 3

```PowerShell
Remove-GPOZaurrBroken -Verbose -IncludeDomains 'ad.evotec.xyz' -BackupPath $Env:UserProfile\Desktop\MyBackup1 -WhatIf -Type AD, SYSVOL
```

---

### Parameters
#### **Type**
Choose one or more types to delete. Options are AD, ObjectClass, SYSVOL
Valid Values:

* SYSVOL
* AD
* ObjectClass

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |1       |false        |

#### **BackupPath**
Path to optional backup of SYSVOL content before deletion

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **BackupDated**
Forces backup to be created within folder that has date in it

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **LimitProcessing**
Allows to specify maximum number of items that will be fixed in a single run. It doesn't affect amount of GPOs processed

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Forest**
Target different Forest, by default current forest is used

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |named   |false        |ForestName|

#### **ExcludeDomains**
Exclude domain from search, by default whole forest is scanned

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **IncludeDomains**
Include only specific domains, by default whole forest is scanned

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |named   |false        |Domain<br/>Domains|

#### **ExtendedForestInformation**
Ability to provide Forest Information from another command to speed up processing

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |named   |false        |

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
Remove-GPOZaurrBroken [-Type] <String[]> [-BackupPath <String>] [-BackupDated] [-LimitProcessing <Int32>] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
