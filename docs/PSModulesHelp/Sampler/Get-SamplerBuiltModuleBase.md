Get-SamplerBuiltModuleBase
--------------------------

### Synopsis
Get the ModuleBase of a module built with Sampler (directory where the module
manifest is).

---

### Description

Based on a project's configuration of OutputDirectory, BuiltModuleSubdirectory,
ModuleName and whether the built module is within a VersionedOutputDirectory;
this function will resolve the expected ModuleBase of that Module.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-SamplerBuiltModuleBase -OutputDirectory C:\src\output -BuiltModuleSubdirectory 'Module' -ModuleName 'stuff' -ModuleVersion 3.1.2-preview001
# C:\src\output\Module\stuff\3.1.2
```

---

### Parameters
#### **OutputDirectory**
Output directory (usually as defined by the Project).
By default it is set to 'output' in a Sampler project.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **BuiltModuleSubdirectory**
Sub folder where you want to build the Module to (instead of $OutputDirectory/$ModuleName).
This is especially useful when you want to build DSC Resources, but you don't want the
`Get-DscResource` command to find several instances of the same DSC Resources because
of the overlapping $Env:PSmodulePath (`$buildRoot/output` for the built module and `$buildRoot/output/RequiredModules`).
In most cases I would recommend against setting $BuiltModuleSubdirectory.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **ModuleName**
Name of the Module to retrieve the version from its manifest (See Get-SamplerProjectName).

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[String]`|true    |3       |false        |ProjectName|

#### **VersionedOutputDirectory**
Whether the Module is built with its versioned Subdirectory, as you would see it on a System.
For instance, if VersionedOutputDirectory is $true, the built module's ModuleBase would be: `output/MyModuleName/2.0.1/`

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ModuleVersion**
Allows to specify a specific ModuleVersion to search the ModuleBase if known.
If the ModuleVersion is not known but the VersionedOutputDirectory is set to $true,
a wildcard (*) will be used so that the path can be resolved by Get-Item or similar commands.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Syntax
```PowerShell
Get-SamplerBuiltModuleBase [-OutputDirectory] <String> [[-BuiltModuleSubdirectory] <String>] [-ModuleName] <String> [-VersionedOutputDirectory] [[-ModuleVersion] <String>] [<CommonParameters>]
```
