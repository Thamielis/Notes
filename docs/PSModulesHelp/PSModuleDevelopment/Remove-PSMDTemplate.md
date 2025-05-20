Remove-PSMDTemplate
-------------------

### Synopsis
Removes templates

---

### Description

This function removes templates used in the PSModuleDevelopment templating system.

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-PSMDTemplate -TemplateName '*' -Deprecated
Remove all templates that have been superseded by a newer version.
```
> EXAMPLE 2

```PowerShell
Get-PSMDTemplate -TemplateName 'module' -RequiredVersion '1.2.2.1' | Remove-PSMDTemplate
Removes all copies of the template 'module' with exactly the version '1.2.2.1'
```

---

### Parameters
#### **Template**
A template object returned by Get-PSMDTemplate.
Will clear exactly the version specified, from exactly its location.

|Type              |Required|Position|PipelineInput |
|------------------|--------|--------|--------------|
|`[TemplateInfo[]]`|true    |named   |true (ByValue)|

#### **TemplateName**
The name of the template to remove.
Templates are filtered by this using wildcard comparison.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Store**
The template store to retrieve tempaltes from.
By default, all stores are queried.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Path**
Instead of a registered store, look in this path for templates.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Deprecated**
Will delete all versions of matching templates except for the latest one.
Note:
If the same template is found in multiple stores, it will keep a single copy across all stores.
To process by store, be sure to specify the store parameter and loop over the stores desired.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EnableException**
Replaces user friendly yellow warnings with bloody red exceptions of doom!
Use this if you want the function to throw terminating errors you want to catch.

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

### Syntax
```PowerShell
Remove-PSMDTemplate [-TemplateName] <String> [-Store <String>] [-Deprecated] [-EnableException] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Remove-PSMDTemplate -Template <TemplateInfo[]> [-EnableException] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Remove-PSMDTemplate [-TemplateName] <String> -Path <String> [-Deprecated] [-EnableException] [-WhatIf] [-Confirm] [<CommonParameters>]
```
