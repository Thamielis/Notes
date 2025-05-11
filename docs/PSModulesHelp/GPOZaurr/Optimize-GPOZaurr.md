Optimize-GPOZaurr
-----------------

### Synopsis
Enables or disables user/computer section of group policy based on it's content.

---

### Description

Enables or disables user/computer section of group policy based on it's content.

---

### Examples
> EXAMPLE 1

```PowerShell
Optimize-GPOZaurr -All -WhatIf -Verbose -LimitProcessing 2
```
> EXAMPLE 2

```PowerShell
Optimize-GPOZaurr -All -WhatIf -Verbose -LimitProcessing 2 {
    Skip-GroupPolicy -Name 'TEST | Drive Mapping 1'
    Skip-GroupPolicy -Name 'TEST | Drive Mapping 2'
}
```

---

### Parameters
#### **ExcludeGroupPolicies**
Provide a list of group policies to skip using Skip-GroupPolicy cmdlet

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |2       |false        |

#### **GPOName**

|Type      |Required|Position|PipelineInput|Aliases             |
|----------|--------|--------|-------------|--------------------|
|`[String]`|true    |named   |false        |Name<br/>DisplayName|

#### **GPOGuid**

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[String]`|true    |named   |false        |GUID<br/>GPOID|

#### **All**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

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
Optimize-GPOZaurr [[-ExcludeGroupPolicies] <ScriptBlock>] -GPOName <String> [-LimitProcessing <Int32>] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Optimize-GPOZaurr [[-ExcludeGroupPolicies] <ScriptBlock>] -GPOGuid <String> [-LimitProcessing <Int32>] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Optimize-GPOZaurr [[-ExcludeGroupPolicies] <ScriptBlock>] -All [-LimitProcessing <Int32>] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
