New-PSMDDotNetProject
---------------------

### Synopsis
Wrapper function around 'dotnet new'

---

### Description

This function is a wrapper around the dotnet.exe application with the parameter 'new'.
It can be used to create projects from templates, as well as to administrate templates.

---

### Examples
> EXAMPLE 1

```PowerShell
dotnetnew -l
Lists all installed templates.
```
> EXAMPLE 2

dotnetnew mvc foo F:\temp\projects\foo -au Windows --no-restore
Creates a new MVC project named "foo" in folder "F:\Temp\projects\foo"
- It will set authentication to windows
- It will skip the automatic restore of the project on create

---

### Parameters
#### **TemplateName**
The name of the template to create

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **List**
List the existing templates.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |false        |l      |

#### **Help**
Ask for help / documentation.
Particularly useful when dealing with project types that have a lot of options.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |false        |h      |

#### **Force**
Overwrite existing files.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Name**
The name of the project to create

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |2       |false        |n      |

#### **Output**
The folder in which to create it.
Note: This folder will automatically be te root folder of the project.
If this folder doesn't exist yet, it will be created.
When used with -Force, it will automatically purge all contents.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |3       |false        |o      |

#### **Install**
Install the specified template from the VS marketplace.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |named   |false        |i      |

#### **Uninstall**
Uninstall an installed template.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |named   |false        |u      |

#### **Arguments**
Additional arguments to pass to the application.
Generally used for parameters when creating a project from a template.

|Type        |Required|Position|PipelineInput|Aliases|
|------------|--------|--------|-------------|-------|
|`[String[]]`|false   |named   |false        |a      |

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
New-PSMDDotNetProject [-TemplateName] <String> [-Help] [-Force] [[-Name] <String>] [[-Output] <String>] [-Arguments <String[]>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
New-PSMDDotNetProject [[-TemplateName] <String>] [-List] [-Help] [-Force] [-Arguments <String[]>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
New-PSMDDotNetProject [-Help] [-Force] -Install <String> [-Arguments <String[]>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
New-PSMDDotNetProject [-Help] [-Force] -Uninstall <String> [-Arguments <String[]>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
