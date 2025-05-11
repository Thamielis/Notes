Repair-GPOZaurrBrokenLink
-------------------------

### Synopsis
Removes any link to GPO that no longer exists.

---

### Description

Removes any link to GPO that no longer exists. It scans all site, organizational unit or domain root making sure every single link that may be linking to GPO that doesn't exists anymore is gone.

---

### Examples
> EXAMPLE 1

```PowerShell
Repair-GPOZaurrBrokenLink -Verbose -LimitProcessing 1 -WhatIf
```
> EXAMPLE 2

```PowerShell
Repair-GPOZaurrBrokenLink -Verbose -IncludeDomains ad.evotec.pl -LimitProcessing 1 -WhatIf
```

---

### Parameters
#### **Forest**
Target different Forest, by default current forest is used

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |1       |false        |ForestName|

#### **ExcludeDomains**
Exclude domain from search, by default whole forest is scanned

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **IncludeDomains**
Include only specific domains, by default whole forest is scanned

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |3       |false        |Domain<br/>Domains|

#### **ExtendedForestInformation**
Ability to provide Forest Information from another command to speed up processing

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |4       |false        |

#### **LimitProcessing**
Allows to specify maximum number of items that will be fixed in a single run. It doesn't affect amount of GPOs processed

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |5       |false        |

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
Repair-GPOZaurrBrokenLink [[-Forest] <String>] [[-ExcludeDomains] <String[]>] [[-IncludeDomains] <String[]>] [[-ExtendedForestInformation] <IDictionary>] [[-LimitProcessing] <Int32>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
