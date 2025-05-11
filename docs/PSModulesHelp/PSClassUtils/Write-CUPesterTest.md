Write-CUPesterTest
------------------

### Synopsis
Generates Pester tests automatically for PowerShell Classes

---

### Description

Creates a Describe block for the class constructors, and for the Class Methods.
Each of the describe block will contain child 'it' blocks which contains the corresponding tests.

For each Method and Constructor the following tests will be created:
1) test to ensure that the command doesn't throw
2) for methods, it will first create an instance (using a parameterless constructor by default), then check if the return type is of the right type (for voided methods, it will check that nothing is returned.)
3) For Static Methods, it will check it will Check that when it is called, it doens't throws an error, and validated the return type is correct. (For voided methods it will check that nothing is returned.)

---

### Related Links
* [https://github.com/Stephanevg/PsClassUtils](https://github.com/Stephanevg/PsClassUtils)

---

### Examples
The File C:\plop.ps1 MUST contain at least one class.

```PowerShell
write-CupesterTest -Path C:\plop.ps1
#Generates a C:\plop.Tests.Ps1 file with pester tests in it.
```
> EXAMPLE 2

write-CupesterTest -Path C:\plop.ps1 -Verbose
VERBOSE: [PSClassUtils][write-CupesterTest] Generating tests for C:\Plop.ps1
VERBOSE: [PSClassUtils][write-CupesterTest][Woop] Starting tests Generating process for class --> [Woop]
VERBOSE: [PSClassUtils][write-CupesterTest]--> [Woop][Constructors] Generating 'Describe' block for Constructors
VERBOSE: [PSClassUtils][write-CupesterTest]--> [Woop][Constructors] Generating 'IT' blocks
VERBOSE: [PSClassUtils][write-CupesterTest]--> [Woop] --> [Woop]::new()
VERBOSE: [PSClassUtils][write-CupesterTest]--> [Woop] --> [Woop]::new([String]String,[int]Number)
VERBOSE: [PSClassUtils][write-CupesterTest]--> [Woop][Methods]
VERBOSE: [PSClassUtils][write-CupesterTest]--> [Woop] --> DoSomething()
VERBOSE: [PSClassUtils][write-CupesterTest]--> [Woop] --> TrickyMethod($Salutations,$IsthatTrue)
VERBOSE: [PSClassUtils][write-CupesterTest]--> [Woop] --> VoidedMethod()
VERBOSE: [PSClassUtils][write-CupesterTest]--> [Woop] --> MyStaticMethod()
VERBOSE: [PSClassUtils][write-CupesterTest]--> [Export] -->Exporting tests file to: Microsoft.PowerShell.Core\FileSystem::C:\Plop.Tests.Ps1
> EXAMPLE 3

```PowerShell
write-CupesterTest -Path C:\plop.ps1 -IgnoreParameterLessConstructor
#This example will return create all the tests, except for the parameterLess constructor (which can be usefull for inheritence / 'interface' situations.)
```
> EXAMPLE 4

```PowerShell
write-CupesterTest -ModuleFolderPath "C:\Program files\WindowsPowershell\Modules\plop\"
```

---

### Parameters
#### **Path**
The Path parameter is mandatory.
Must point to *.ps1 or *.psm1 file.
The files must contain powershell classes.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ExportFolderPath**
= (Throw "Path is mandatory. Please specifiy a Path to a .ps1 a .psm1 file or a folder containing one or more of these file types."),

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[DirectoryInfo]`|false   |named   |false        |

#### **ModuleFolderPath**
Use this parameter to generate tests for a complete module.
Specifiy the Root of a module folder.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[DirectoryInfo]`|false   |named   |false        |

#### **IgnoreParameterLessConstructor**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Combine**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Passthru**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AddInModuleScope**
If you have a case, where you want to write pester tests for a individual file that contains classes, but you know that it is actually part of a module.
And if using -ModuleFolderPath is not an option for you, then AddinModuleScope is what you need.
This parameter will add a 'using module' and the InModuleScope to your tests. see example
Write-CUPesterTest -Path C:\plop.ps1 -AddInModuleScope "Woop"
Will generate
Using Module Woop
InModuleScope -ModuleName "Woop" -Scriptblock {
    #Pester tests for specific classes
}

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Inputs
File containing Classes. Or folder containing files that contain classes.

---

### Outputs
* Void
Or
When Passthru is specified
    [Directory.IO.FileInfo]

---

### Notes
Author: StÃ©phane van Gulick
Version: 1.0.0

---

### Syntax
```PowerShell
Write-CUPesterTest [-Path <String>] [-ExportFolderPath <DirectoryInfo>] [-IgnoreParameterLessConstructor] [-Combine] [-Passthru] [-AddInModuleScope <String>] [<CommonParameters>]
```
```PowerShell
Write-CUPesterTest [-ExportFolderPath <DirectoryInfo>] [-ModuleFolderPath <DirectoryInfo>] [-IgnoreParameterLessConstructor] [-Combine] [-Passthru] [<CommonParameters>]
```
