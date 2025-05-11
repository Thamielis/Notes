Build-Module
------------

### Synopsis
Compile a module from ps1 files to a single psm1

---

### Description

Compiles modules from source according to conventions:
1. A single ModuleName.psd1 manifest file with metadata
2. Source subfolders in the same directory as the Module manifest:
   Enum, Classes, Private, Public contain ps1 files
3. Optionally, a build.psd1 file containing settings for this function

The optimization process:
1. The OutputDirectory is created
2. All psd1/psm1/ps1xml files (except build.psd1) in the Source will be copied to the output
3. If specified, $CopyPaths (relative to the Source) will be copied to the output
4. The ModuleName.psm1 will be generated (overwritten completely) by concatenating all .ps1 files in the $SourceDirectories subdirectories
5. The ModuleVersion and ExportedFunctions in the ModuleName.psd1 may be updated (depending on parameters)

---

### Examples
> EXAMPLE 1

Build-Module -Suffix "Export-ModuleMember -Function *-* -Variable PreferenceVariable"
This example shows how to build a simple module from it's manifest, adding an Export-ModuleMember as a Suffix
> EXAMPLE 2

Build-Module -Prefix "using namespace System.Management.Automation"
This example shows how to build a simple module from it's manifest, adding a using statement at the top as a prefix
> EXAMPLE 3

```PowerShell
$gitVersion = gitversion | ConvertFrom-Json | Select -Expand InformationalVersion
Build-Module -SemVer $gitVersion
This example shows how to use a semantic version from gitversion to version your build.
```

---

### Parameters
#### **SourcePath**
The path to the module folder, manifest or build.psd1

|Type      |Required|Position|PipelineInput        |Aliases                |
|----------|--------|--------|---------------------|-----------------------|
|`[String]`|false   |1       |true (ByPropertyName)|ModuleManifest<br/>Path|

#### **OutputDirectory**
Where to build the module. Defaults to "../Output" adjacent to the "SourcePath" folder.
The ACTUAL output may be in a subfolder of this path ending with the module name and version
The default value is ../Output which results in the build going to ../Output/ModuleName/1.2.3

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[String]`|false   |named   |false        |Destination|

#### **VersionedOutputDirectory**
DEPRECATED. Now defaults true, producing a OutputDirectory with a version number as the last folder

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **UnversionedOutputDirectory**
Overrides the VersionedOutputDirectory, producing an OutputDirectory without a version number as the last folder

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SemVer**
Semantic version, like 1.0.3-beta01+sha.22c35ffff166f34addc49a3b80e622b543199cc5
If the SemVer has metadata (after a +), then the full Semver will be added to the ReleaseNotes

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Version**
The module version (must be a valid System.Version such as PowerShell supports for modules)

|Type       |Required|Position|PipelineInput|Aliases      |
|-----------|--------|--------|-------------|-------------|
|`[Version]`|true    |named   |false        |ModuleVersion|

#### **Prerelease**
Setting pre-release forces the release to be a pre-release.
Must be valid pre-release tag like PowerShellGet supports

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **BuildMetadata**
Build metadata (like the commit sha or the date).
If a value is provided here, then the full Semantic version will be inserted to the release notes:
Like: ModuleName v(Version(-Prerelease?)+BuildMetadata)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **CopyPaths**
Folders which should be copied intact to the module output
Can be relative to the  module folder

|Type        |Required|Position|PipelineInput|Aliases        |
|------------|--------|--------|-------------|---------------|
|`[String[]]`|false   |named   |false        |CopyDirectories|

#### **SourceDirectories**
Folders which contain source .ps1 scripts to be concatenated into the module
Defaults to Enum, Classes, Private, Public

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **PublicFilter**
A Filter (relative to the module folder) for public functions
If non-empty, FunctionsToExport will be set with the file BaseNames of matching files
Defaults to Public/*.ps1

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **IgnoreAlias**
A switch that allows you to disable the update of the AliasesToExport
By default, (if PublicFilter is not empty, and this is not set)
Build-Module updates the module manifest FunctionsToExport and AliasesToExport
with the combination of all the values in [Alias()] attributes on public functions
and aliases created with `New-ALias` or `Set-Alias` at script level in the module

|Type      |Required|Position|PipelineInput|Aliases             |
|----------|--------|--------|-------------|--------------------|
|`[Switch]`|false   |named   |false        |IgnoreAliasAttribute|

#### **Encoding**
File encoding for output RootModule (defaults to UTF8)
Converted to System.Text.Encoding for PowerShell 6 (and something else for PowerShell 5)
Valid Values:

* UTF8
* UTF8Bom
* UTF8NoBom
* UTF7
* ASCII
* Unicode
* UTF32

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Prefix**
The prefix is either the path to a file (relative to the module folder) or text to put at the top of the file.
If the value of prefix resolves to a file, that file will be read in, otherwise, the value will be used.
The default is nothing. See examples for more details.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Suffix**
The Suffix is either the path to a file (relative to the module folder) or text to put at the bottom of the file.
If the value of Suffix resolves to a file, that file will be read in, otherwise, the value will be used.
The default is nothing. See examples for more details.

|Type      |Required|Position|PipelineInput|Aliases                       |
|----------|--------|--------|-------------|------------------------------|
|`[String]`|false   |named   |false        |ExportModuleMember<br/>Postfix|

#### **Target**
Controls whether we delete the output folder and whether we build the output
There are three options:
  - Clean deletes the build output folder
  - Build builds the module output
  - CleanBuild first deletes the build output folder and then builds the module back into it
Note that the folder to be deleted is the actual calculated output folder, with the version number
So for the default OutputDirectory with version 1.2.3, the path to clean is: ../Output/ModuleName/1.2.3
Valid Values:

* Clean
* Build
* CleanBuild

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Passthru**
Output the ModuleInfo of the "built" module

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Build-Module [[-SourcePath] <String>] [-OutputDirectory <String>] [-VersionedOutputDirectory] [-UnversionedOutputDirectory] [-SemVer <String>] [-CopyPaths <String[]>] [-SourceDirectories <String[]>] [-PublicFilter <String[]>] [-IgnoreAlias] [-Encoding <String>] [-Prefix <String>] [-Suffix <String>] [-Target <String>] [-Passthru] [<CommonParameters>]
```
```PowerShell
Build-Module [[-SourcePath] <String>] [-OutputDirectory <String>] [-VersionedOutputDirectory] [-UnversionedOutputDirectory] -Version <Version> [-Prerelease <String>] [-BuildMetadata <String>] [-CopyPaths <String[]>] [-SourceDirectories <String[]>] [-PublicFilter <String[]>] [-IgnoreAlias] [-Encoding <String>] [-Prefix <String>] [-Suffix <String>] [-Target <String>] [-Passthru] [<CommonParameters>]
```
