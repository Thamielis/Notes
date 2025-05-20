Set-PSMDModuleDebug
-------------------

### Synopsis
Configures how modules are handled during import of this module.

---

### Description

This module allows specifying other modules to import during import of this module.
Using the Set-PSMDModuleDebug function it is possible to configure, which module is automatically imported, without having to edit the profile each time.
This import occurs at the end of importing this module, thus setting this module in the profile as automatically imported is recommended.

---

### Examples
> EXAMPLE 1

```PowerShell
Set-PSMDModuleDebug -Name 'cPSNetwork' -AutoImport
Configures the module cPSNetwork to automatically import after importing PSModuleDevelopment
```
> EXAMPLE 2

```PowerShell
Set-PSMDModuleDebug -Name 'cPSNetwork' -AutoImport -DebugMode
Configures the module cPSNetwork to automatically import after importing PSModuleDevelopment using debug mode.
```
> EXAMPLE 3

Set-PSMDModuleDebug -Name 'cPSNetwork' -AutoImport -DebugMode -PreImportAction { Write-Host "Was done before importing" } -PostImportAction { Write-Host "Was done after importing" }
Configures the module cPSNetwork to automatically import after importing PSModuleDevelopment using debug mode.
- Running a scriptblock before import
- Running another scriptblock after import

Note: Using Write-Host is generally - but not always - bad practice
Note: Verbose output during module import is generally discouraged (doesn't apply to tests of course)

---

### Parameters
#### **Name**
The name of the module to configure for automatic import.
Needs to be an exact match, the first entry found using "Get-Module -ListAvailable" will be imported.

|Type      |Required|Position|PipelineInput                 |Aliases|
|----------|--------|--------|------------------------------|-------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|n      |

#### **AutoImport**
Setting this will cause the module to be automatically imported at the end of importing the PSModuleDevelopment module.
Even when set to false, the configuration can still be maintained and the debug mode enabled.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |false        |ai     |

#### **DebugMode**
Setting this will cause the module to create a global variable named "<ModuleName>_DebugMode" with value $true during import of PSModuleDevelopment.
Modules configured to use this variable can determine the intended import mode using this variable.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |false        |dbg    |

#### **PreImportAction**
Any scriptblock that should run before importing the module.
Only used when importing modules using the "Invoke-ModuleDebug" funtion, as is used for modules set to auto-import.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |named   |false        |

#### **PostImportAction**
Any scriptblock that should run after importing the module.
Only used when importing modules using the "Invoke-ModuleDebug" funtion, as his used for modules set to auto-import.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |named   |false        |

#### **Priority**
When importing modules in a debugging context, they are imported in the order of their priority.
The lower the number, the sooner it is imported.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **AllAutoImport**
Changes all registered modules to automatically import on powershell launch.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|true    |named   |false        |aai    |

#### **NoneAutoImport**
Changes all registered modules to not automatically import on powershell launch.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|true    |named   |false        |nai    |

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
Set-PSMDModuleDebug [-Name] <String> [-AutoImport] [-DebugMode] [-PreImportAction <ScriptBlock>] [-PostImportAction <ScriptBlock>] [-Priority <Int32>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Set-PSMDModuleDebug -AllAutoImport [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Set-PSMDModuleDebug -NoneAutoImport [-WhatIf] [-Confirm] [<CommonParameters>]
```
