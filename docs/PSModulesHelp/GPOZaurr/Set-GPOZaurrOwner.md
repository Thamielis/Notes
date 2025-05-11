Set-GPOZaurrOwner
-----------------

### Synopsis
Sets GPO Owner to Domain Admins or other choosen account

---

### Description

Sets GPO Owner to Domain Admins or other choosen account. GPO Owner is set in AD and SYSVOL unless specified otherwise. If account doesn't require change, no change is done.

---

### Examples
> EXAMPLE 1

```PowerShell
Set-GPOZaurrOwner -Type All -Verbose -WhatIf -LimitProcessing 2
```

---

### Parameters
#### **Type**
Unknown - finds unknown Owners and sets them to Administrative (Domain Admins) or chosen principal
NotMatching - find administrative groups only and if sysvol and gpo doesn't match - replace with chosen principal or Domain Admins if not specified
Inconsistent - same as not NotMatching
NotAdministrative - combination of Unknown/NotMatching and NotAdministrative - replace with chosen principal or Domain Admins if not specified
All - if Owner is known it checks if it's Administrative, if it sn't it fixes that. If owner is unknown it fixes it
Valid Values:

* Unknown
* NotAdministrative
* NotMatching
* Inconsistent
* All

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **GPOName**
Name of GPO. By default all GPOs are targetted

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **GPOGuid**
GUID of GPO. By default all GPOs are targetted

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[String]`|false   |named   |false        |GUID<br/>GPOID|

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

#### **Principal**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **SkipSysvol**
Set GPO Owner only in Active Directory. By default GPO Owner is being set in both places

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **LimitProcessing**
Allows to specify maximum number of items that will be fixed in a single run. It doesn't affect amount of GPOs processed

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **ApprovedOwner**

|Type        |Required|Position|PipelineInput|Aliases                 |
|------------|--------|--------|-------------|------------------------|
|`[String[]]`|false   |named   |false        |Exclusion<br/>Exclusions|

#### **Action**

Valid Values:

* OnlyAD
* OnlyFileSystem

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Force**
Pushes new owner regardless if it's already set or not

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
Set-GPOZaurrOwner -Type <String> [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-Principal <String>] [-SkipSysvol] [-LimitProcessing <Int32>] [-ApprovedOwner <String[]>] [-Action <String>] [-Force] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Set-GPOZaurrOwner [-GPOName <String>] [-GPOGuid <String>] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-Principal <String>] [-SkipSysvol] [-LimitProcessing <Int32>] [-ApprovedOwner <String[]>] [-Action <String>] [-Force] [-WhatIf] [-Confirm] [<CommonParameters>]
```
