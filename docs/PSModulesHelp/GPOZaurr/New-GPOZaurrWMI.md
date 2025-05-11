New-GPOZaurrWMI
---------------

### Synopsis
Creates a new WMI filter based on a WMI filter query.

---

### Description

This function creates a new WMI filter in Active Directory based on a specified WMI filter query.

---

### Examples
> EXAMPLE 1

```PowerShell
New-GPOZaurrWMI -Name "TestWMIFilter1" -Query "SELECT * FROM Win32_OperatingSystem" -Force
Creates a new WMI filter named "TestWMIFilter1" targeting all Windows operating systems.
```
> EXAMPLE 2

```PowerShell
New-GPOZaurrWMI -Name "TestWMIFilter2" -Query "SELECT * FROM Win32_Processor" -Forest "Contoso" -IncludeDomains "FinanceDomain"
Creates a new WMI filter named "TestWMIFilter2" targeting all processors in the "FinanceDomain" within the "Contoso" forest.
```

---

### Parameters
#### **Name**
The name of the new WMI filter to be created.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Description**
The description for the new WMI filter. Default is an empty string.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Namespace**
The WMI namespace to target. Default is 'root\CIMv2'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Query**
The WMI filter query to be applied to the WMI entry.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |4       |false        |

#### **SkipQueryCheck**
Switch to skip the query check before creating the WMI entry.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Force**
Switch to force the creation of the WMI entry without confirmation.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Forest**
The forest to target for WMI creation.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |5       |false        |ForestName|

#### **ExcludeDomains**
An array of domains to exclude from WMI application.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |6       |false        |

#### **IncludeDomains**
An array of domains to include for WMI application.

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |7       |false        |Domain<br/>Domains|

#### **ExtendedForestInformation**
Additional information about the forest for WMI customization.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |8       |false        |

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
New-GPOZaurrWMI [-Name] <String> [[-Description] <String>] [[-Namespace] <String>] [-Query] <String> [-SkipQueryCheck] [-Force] [[-Forest] <String>] [[-ExcludeDomains] <String[]>] [[-IncludeDomains] <String[]>] [[-ExtendedForestInformation] <IDictionary>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
