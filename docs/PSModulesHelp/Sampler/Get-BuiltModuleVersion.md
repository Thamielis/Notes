Get-BuiltModuleVersion
----------------------

### Synopsis
Get the module version from the module built by Sampler.

---

### Description

Will read the ModuleVersion and PrivateData.PSData.Prerelease tag of the Module Manifest
that has been built by Sampler, by looking into the OutputDirectory where the Project's
Module should have been built.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-BuiltModuleVersion -OutputDirectory 'output' -ProjectName Sampler
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

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Syntax
```PowerShell
Get-BuiltModuleVersion [-OutputDirectory] <String> [[-BuiltModuleSubdirectory] <String>] [-ModuleName] <String> [-VersionedOutputDirectory] [<CommonParameters>]
```
