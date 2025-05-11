Add-Sample
----------

### Synopsis
Adding code elements (function, enum, class, DSC Resource, tests...) to a module's source.

---

### Description

Add-Sample is an helper function to invoke a plaster template built-in the Sampler module.
With this function you can bootstrap your module project by adding classes, functions and
associated tests, examples and configuration elements.

---

### Examples
> EXAMPLE 1

```PowerShell
Add-Sample -Sample PublicFunction -PublicFunctionName Get-MyStuff
```

---

### Parameters
#### **Sample**
Specifies a sample component based on the Plaster templates embedded with this module.
The available types of module elements are:
    - Classes: A sample of 4 classes with inheritence and how to manage the orders to avoid parsing errors.
    - ClassResource: A Class-Based DSC Resources showing some best practices including tests, Reasons, localized strings.
    - Composite: A DSC Composite Resource (a configuration block) packaged the right way to make sure it's visible by Get-DscResource.
    - Enum: An example of a simple Enum.
    - MofResource: A sample of a MOF-Based DSC Resource following the DSC Community practices.
    - PrivateFunction: A sample of a Private function (not exported from the module) and its test.
    - PublicCallPrivateFunctions: A sample of 2 functions where the exported one (public) calls the private one, with the tests.
    - PublicFunction: A sample public function and its test.
Valid Values:

* Classes
* ClassFolderResource
* ClassResource
* Composite
* Enum
* Examples
* GithubConfig
* GCPackage
* HelperSubModules
* MofResource
* PrivateFunction
* PublicCallPrivateFunctions
* PublicFunction
* VscodeConfig
* ChocolateyPackage

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **DestinationPath**
Destination of your module source root folder, defaults to the current directory ".".
We assume that your current location is the module folder, and within this folder we
will find the source folder, the tests folder and other supporting files.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

---

### Notes
This module requires and uses Plaster.

---

### Syntax
```PowerShell
Add-Sample [[-Sample] <String>] [[-DestinationPath] <String>] [<CommonParameters>]
```
