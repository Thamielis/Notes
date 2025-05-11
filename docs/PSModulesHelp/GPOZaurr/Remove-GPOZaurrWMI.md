Remove-GPOZaurrWMI
------------------

### Synopsis
Removes Group Policy WMI filters based on specified criteria.

---

### Description

This function removes WMI filters based on the provided GUIDs or names within the specified forest or domains. It retrieves WMI filters associated with the GPOs and removes them.

---

### Examples
> EXAMPLE 1

Remove-GPOZaurrWMI -Guid "12345678-1234-1234-1234-123456789012"
Description
-----------
Removes the WMI filter with the specified GUID.
> EXAMPLE 2

Remove-GPOZaurrWMI -Name "TestWMIFilter"
Description
-----------
Removes the WMI filter with the specified name.

---

### Parameters
#### **Guid**
Specifies an array of GUIDs of the WMI filters to be removed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|false   |1       |false        |

#### **Name**
Specifies an array of names of the WMI filters to be removed.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **Forest**
Specifies the forest name where the WMI filters are located.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |3       |false        |ForestName|

#### **ExcludeDomains**
Specifies an array of domains to exclude from the removal process.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |4       |false        |

#### **IncludeDomains**
Specifies an array of domains to include in the removal process.

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |5       |false        |Domain<br/>Domains|

#### **ExtendedForestInformation**
Specifies additional information about the forest.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |6       |false        |

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
Remove-GPOZaurrWMI [[-Guid] <Guid[]>] [[-Name] <String[]>] [[-Forest] <String>] [[-ExcludeDomains] <String[]>] [[-IncludeDomains] <String[]>] [[-ExtendedForestInformation] <IDictionary>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
