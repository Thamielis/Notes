Set-GPOZaurrStatus
------------------

### Synopsis
Enables or disables user/computer section of Group Policy.

---

### Description

Enables or disables user/computer section of Group Policy.

---

### Examples
> EXAMPLE 1

```PowerShell
Set-GPOZaurrStatus -Name 'TEST | Empty GPO - AD.EVOTEC.PL CrossDomain GPO' -Status AllSettingsEnabled -Verbose
```
> EXAMPLE 2

```PowerShell
Set-GPOZaurrStatus -Name 'TEST | Empty GPO - AD.EVOTEC.PL CrossDomain GPO' -DomainName ad.evotec.pl -Status AllSettingsEnabled -Verbose
```

---

### Parameters
#### **GPOName**
Provide Group Policy Name

|Type      |Required|Position|PipelineInput|Aliases             |
|----------|--------|--------|-------------|--------------------|
|`[String]`|true    |named   |false        |Name<br/>DisplayName|

#### **GPOGuid**
Provide Group Policy GUID

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[String]`|true    |named   |false        |GUID<br/>GPOID|

#### **Status**
Choose a status for provided Group Policy
Valid Values:

* AllSettingsDisabled
* UserSettingsDisabled
* ComputerSettingsDisabled
* AllSettingsEnabled

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[GpoStatus]`|true    |named   |false        |

#### **Forest**
Choose forest to target.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |named   |false        |ForestName|

#### **ExcludeDomains**
Exclude domains from trying to find Group Policy Name or GUID

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **IncludeDomains**
Include domain (one or more) to find Group Policy Name or GUID

|Type        |Required|Position|PipelineInput|Aliases                          |
|------------|--------|--------|-------------|---------------------------------|
|`[String[]]`|false   |named   |false        |Domain<br/>Domains<br/>DomainName|

#### **ExtendedForestInformation**
Provide Extended Forest Information

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
Set-GPOZaurrStatus -GPOName <String> -Status {AllSettingsDisabled | UserSettingsDisabled | ComputerSettingsDisabled | AllSettingsEnabled} [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Set-GPOZaurrStatus -GPOGuid <String> -Status {AllSettingsDisabled | UserSettingsDisabled | ComputerSettingsDisabled | AllSettingsEnabled} [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
