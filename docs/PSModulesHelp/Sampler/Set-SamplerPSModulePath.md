Set-SamplerPSModulePath
-----------------------

### Synopsis
Sets the PSModulePath for the build environment.

---

### Description

This command let you define the PSModulePath for the build environment. This could
be important for DSC related builds when there are conflicts with modules in the
Program Files folder.

---

### Examples
> EXAMPLE 1

```PowerShell
Set-SamplerPSModulePath -PSModulePath "C:\Modules" -RemovePersonal -RemoveProgramFiles
```

---

### Parameters
#### **PSModulePath**
Makes the command to set the PSModulePath to the specified value.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **BuiltModuleSubdirectory**
The BuiltModuleSubdirectory that should be added to the PSModulePath.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **RequiredModulesDirectory**
The RequiredModulesDirectory that should be added to the PSModulePath.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **RemovePersonal**
Removes the personal module path from the PSModulePath.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RemoveProgramFiles**
Removes the Program Files module path from the PSModulePath.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RemoveWindows**
Removes the Windows module path from the PSModulePath.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SetSystemDefault**
Sets the PSModulePath to the default value for the system.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PassThru**
Returns the PSModulePath after the command has been executed.

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

### Outputs
* [String[]](https://learn.microsoft.com/en-us/dotnet/api/System.String[])

---

### Syntax
```PowerShell
Set-SamplerPSModulePath -PSModulePath <String> [-BuiltModuleSubdirectory <String>] [-RequiredModulesDirectory <String>] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Set-SamplerPSModulePath [-BuiltModuleSubdirectory <String>] [-RequiredModulesDirectory <String>] [-RemovePersonal] [-RemoveProgramFiles] [-RemoveWindows] [-SetSystemDefault] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```
