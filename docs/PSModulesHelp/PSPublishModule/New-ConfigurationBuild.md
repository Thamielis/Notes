New-ConfigurationBuild
----------------------

### Synopsis
Allows to configure build process for the module

---

### Description

Allows to configure build process for the module

---

### Examples
> EXAMPLE 1

```PowerShell
$newConfigurationBuildSplat = @{
    Enable                            = $true
    SignModule                        = $true
    MergeModuleOnBuild                = $true
    MergeFunctionsFromApprovedModules = $true
    CertificateThumbprint             = '483292C9E317AA1'
    NETResolveBinaryConflicts            = $true
    NETResolveBinaryConflictsName        = 'Transferetto'
    NETProjectName                    = 'Transferetto'
    NETConfiguration                  = 'Release'
    NETFramework                      = 'netstandard2.0'
    DotSourceLibraries                = $true
    DotSourceClasses                  = $true
    DeleteTargetModuleBeforeBuild     = $true
}
New-ConfigurationBuild @newConfigurationBuildSplat
```

---

### Parameters
#### **Enable**
Enable build process

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DeleteTargetModuleBeforeBuild**
Delete target module before build

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **MergeModuleOnBuild**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **MergeFunctionsFromApprovedModules**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SignModule**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DotSourceClasses**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DotSourceLibraries**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SeparateFileLibraries**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RefreshPSD1Only**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **UseWildcardForFunctions**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **LocalVersioning**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SkipBuiltinReplacements**
Skip builtin replacements option disables builtin replacements that are done by module builder.
This is useful if you use any of known replacements and you don't want them to be replaced by module builder.
This has to be used on the PSPublishModule by default, as it would break the module on publish.
Current known replacements are:
* <ModuleName> / {ModuleName} - the name of the module i.e PSPublishModule
* <ModuleVersion> / {ModuleVersion} - the version of the module i.e 1.0.0
* <ModuleVersionWithPreRelease> / {ModuleVersionWithPreRelease} - the version of the module with pre-release tag i.e 1.0.0-Preview1
* <TagModuleVersionWithPreRelease> / {TagModuleVersionWithPreRelease} - the version of the module with pre-release tag i.e v1.0.0-Preview1
* <TagName> / {TagName} - the name of the tag - i.e. v1.0.0

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DoNotAttemptToFixRelativePaths**
Configures module builder to not replace $PSScriptRoot\ with $PSScriptRoot\
This is useful if you have a module that has a lot of relative paths that are required when using Private/Public folders,
but for merge process those are not supposed to be there as the paths change.
By default module builder will attempt to fix it. This option disables this functionality.
Best practice is to use $MyInvocation.MyCommand.Module.ModuleBase or similar instead of relative paths.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **CertificateThumbprint**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **CertificatePFXPath**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **CertificatePFXBase64**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **CertificatePFXPassword**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **NETProjectPath**
Path to the project that you want to build. This is useful if it's not in Sources folder directly within module directory

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **NETConfiguration**
Parameter description
Valid Values:

* Release
* Debug

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **NETFramework**
Parameter description

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |7       |false        |

#### **NETProjectName**
By default it will assume same name as project name, but you can provide different name if needed.
It's required if NETProjectPath is provided

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |

#### **NETExcludeMainLibrary**
Exclude main library from build, this is useful if you have C# project that you want to build
that is used mostly for generating libraries that are used in PowerShell module
It won't include main library in the build, but it will include all other libraries

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NETExcludeLibraryFilter**
Provide list of filters for libraries that you want to exclude from build, this is useful if you have C# project that you want to build, but don't want to include all libraries for some reason

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |9       |false        |

#### **NETIgnoreLibraryOnLoad**
This is to exclude libraries from being loaded in PowerShell by PSM1/Librarties.ps1 files.
This is useful if you have a library that is not supposed to be loaded in PowerShell, but you still need it
For example library that's not NET based and is as dependency for other libraries

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |10      |false        |

#### **NETBinaryModule**
Provide list of binary modules that you want to import-module in the module.
This is useful if you're building a module that has binary modules and you want to import them in the module.
In here you provide one or more binrary module names that you want to import in the module.
Just the DLL name with extension without path. Path is assumed to be $PSScriptRoot\Lib\Standard or $PSScriptRoot\Lib\Default or $PSScriptRoot\Lib\Core

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |11      |false        |

#### **NETHandleAssemblyWithSameName**
Adds try/catch block to handle assembly with same name is already loaded exception and ignore it.
It's useful in PowerShell 7, as it's more strict about this than Windows PowerShell, and usually everything should work as expected.

|Type      |Required|Position|PipelineInput|Aliases                   |
|----------|--------|--------|-------------|--------------------------|
|`[Switch]`|false   |named   |false        |HandleAssemblyWithSameName|

#### **NETLineByLineAddType**
Adds Add-Type line by line, this is useful if you have a lot of libraries and you want to see which one is causing the issue.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NETBinaryModuleCmdletScanDisabled**
This is to disable scanning for cmdlets in binary modules, this is useful if you have a lot of binary modules and you don't want to scan them for cmdlets.
By default it will scan for cmdlets/aliases in binary modules and add them to the module PSD1/PSM1 files.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NETMergeLibraryDebugging**
Add special logic to simplify debugging of merged libraries, this is useful if you have a lot of libraries and you want to see which one is causing the issue.

|Type      |Required|Position|PipelineInput|Aliases              |
|----------|--------|--------|-------------|---------------------|
|`[Switch]`|false   |named   |false        |MergeLibraryDebugging|

#### **NETResolveBinaryConflicts**
Add special logic to resolve binary conflicts. It uses by defalt the project name. If you want to use different name use NETResolveBinaryConflictsName

|Type      |Required|Position|PipelineInput|Aliases               |
|----------|--------|--------|-------------|----------------------|
|`[Switch]`|false   |named   |false        |ResolveBinaryConflicts|

#### **NETResolveBinaryConflictsName**
Add special logic to resolve binary conflicts for specific project name.

|Type      |Required|Position|PipelineInput|Aliases                   |
|----------|--------|--------|-------------|--------------------------|
|`[String]`|false   |12      |false        |ResolveBinaryConflictsName|

#### **NETBinaryModuleDocumenation**
Include documentation for binary modules, this is useful if you have a lot of binary modules and you want to include documentation for them (if available in XML format)

|Type      |Required|Position|PipelineInput|Aliases         |
|----------|--------|--------|-------------|----------------|
|`[Switch]`|false   |named   |false        |NETDocumentation|

#### **NETDoNotCopyLibrariesRecursively**
Do not copy libraries recursively. Normally all libraries are copied recursively, but this option disables that functionality so it won't copy subfolders of libraries.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NETSearchClass**
Provide a name for class when using NETResolveBinaryConflicts or NETResolveBinaryConflictsName. By default it uses `$LibraryName.Initialize` however that may not be always the case

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |13      |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
New-ConfigurationBuild [-Enable] [-DeleteTargetModuleBeforeBuild] [-MergeModuleOnBuild] [-MergeFunctionsFromApprovedModules] [-SignModule] [-DotSourceClasses] [-DotSourceLibraries] [-SeparateFileLibraries] [-RefreshPSD1Only] [-UseWildcardForFunctions] [-LocalVersioning] [-SkipBuiltinReplacements] [-DoNotAttemptToFixRelativePaths] [[-CertificateThumbprint] <String>] [[-CertificatePFXPath] <String>] [[-CertificatePFXBase64] <String>] [[-CertificatePFXPassword] <String>] [[-NETProjectPath] <String>] [[-NETConfiguration] <String>] [[-NETFramework] <String[]>] [[-NETProjectName] <String>] [-NETExcludeMainLibrary] [[-NETExcludeLibraryFilter] <String[]>] [[-NETIgnoreLibraryOnLoad] <String[]>] [[-NETBinaryModule] <String[]>] [-NETHandleAssemblyWithSameName] [-NETLineByLineAddType] [-NETBinaryModuleCmdletScanDisabled] [-NETMergeLibraryDebugging] [-NETResolveBinaryConflicts] [[-NETResolveBinaryConflictsName] <String>] [-NETBinaryModuleDocumenation] [-NETDoNotCopyLibrariesRecursively] [[-NETSearchClass] <String>] [<CommonParameters>]
```
