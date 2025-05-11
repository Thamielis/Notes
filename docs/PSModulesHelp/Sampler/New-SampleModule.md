New-SampleModule
----------------

### Synopsis
Create a module scaffolding and add samples & build pipeline.

---

### Description

New-SampleModule helps you bootstrap your PowerShell module project by
creating a the folder structure of your module, and optionally add the
pipeline files to help with compiling the module, publishing to PSGallery
and GitHub and testing quality and style such as per the DSC Community
guildelines.

---

### Examples
> EXAMPLE 1

```PowerShell
New-SampleModule -DestinationPath . -ModuleType CompleteSample -ModuleAuthor "Gael Colas" -ModuleName MyModule -ModuleVersion 0.0.1 -ModuleDescription "a sample module" -LicenseType MIT -SourceDirectory Source
```

---

### Parameters
#### **DestinationPath**
Destination of your module source root folder, defaults to the current directory ".".
We assume that your current location is the module folder, and within this folder we
will find the source folder, the tests folder and other supporting files.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |named   |false        |Path   |

#### **ModuleType**
Specifies the type of module to create. The default value is 'SimpleModule'.
Preset of module you would like to create:
    - CompleteSample
    - SimpleModule
    - SimpleModule_NoBuild
    - dsccommunity
Valid Values:

* SimpleModule
* CompleteSample
* SimpleModule_NoBuild
* dsccommunity

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ModuleAuthor**
The author of module that will be populated in the Module Manifest and will show in the Gallery.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ModuleName**
The Name of your Module.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **ModuleDescription**
The Description of your Module, to be used in your Module manifest.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **CustomRepo**
The Custom PS repository if you want to use an internal (private) feed to pull for dependencies.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ModuleVersion**
Version you want to set in your Module Manifest. If you follow our approach, this will be updated during compilation anyway.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **LicenseType**
Type of license you would like to add to your repository. We recommend MIT for Open Source projects.
Valid Values:

* MIT
* Apache
* None

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **SourceDirectory**
How you would like to call your Source repository to differentiate from the output and the tests folder. We recommend to call it 'source',
and the default value is 'source'.
Valid Values:

* source
* src

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Features**
If you'd rather select specific features from this template to build your module, use this parameter instead.
Valid Values:

* All
* Enum
* Classes
* DSCResources
* ClassDSCResource
* SampleScripts
* git
* Gherkin
* UnitTests
* ModuleQuality
* Build
* AppVeyor
* TestKitchen

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

---

### Outputs
* [Void](https://learn.microsoft.com/en-us/dotnet/api/System.Void)

---

### Notes
See Add-Sample to add elements such as functions (private or public), tests, DSC Resources to your project.

---

### Syntax
```PowerShell
New-SampleModule -DestinationPath <String> [-ModuleType <String>] [-ModuleAuthor <String>] -ModuleName <String> [-ModuleDescription <String>] [-CustomRepo <String>] [-ModuleVersion <String>] [-LicenseType <String>] [-SourceDirectory <String>] [<CommonParameters>]
```
```PowerShell
New-SampleModule -DestinationPath <String> [-ModuleAuthor <String>] -ModuleName <String> [-ModuleDescription <String>] [-CustomRepo <String>] [-ModuleVersion <String>] [-LicenseType <String>] [-SourceDirectory <String>] [-Features <String[]>] [<CommonParameters>]
```
