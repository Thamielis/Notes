Invoke-Plaster
--------------

### Synopsis
Invokes the specified Plaster template which will scaffold out a file or a set of files and directories.

---

### Description

Invokes the specified Plaster template which will scaffold out a file or a set of files and directories.

---

### Related Links
* [Online Version:](https://github.com/PowerShell/Plaster/blob/master/docs/en-US/Invoke-Plaster.md)

* [New-PlasterManifest](https://github.com/PowerShell/Plaster/blob/master/docs/en-US/New-PlasterManifest.md)

* [Test-PlasterManifest](https://github.com/PowerShell/Plaster/blob/master/docs/en-US/Test-PlasterManifest.md)

---

### Examples
> EXAMPLE 1

```PowerShell
Invoke-Plaster -TemplatePath . -Destination ~\GitHub\NewModule
This will invoke the Plaster template in the current directory. The template will generate any files and directories in the ~\GitHub\NewModule directory.
```
> EXAMPLE 2

```PowerShell
Invoke-Plaster -TemplatePath . -Destination ~\GitHub\NewModule -ModuleName Foo -Version 1.0.0
This will invoke the Plaster template in the current directory using dynamic parameters ModuleName and Version extracted from the parameters section of the manifest file. The template will generate any files and directories in the ~\GitHub\NewModule directory.

Note: The parameters -ModuleName and -Version are dynamically added from the plaster manifest file in the current directory. If you run this command it may fail if the manifest file you are testing with does not contain these parameters.
```

---

### Parameters
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **DestinationPath**
Specifies the path to directory in which the template will use as a root directory when generating files. If the directory does not exist, it will be created.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |False        |

#### **Force**
Specify Force to override user prompts for conflicting handling. This will override the confirmation prompt and allow the template to overwrite existing files.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NoLogo**
Suppresses the display of the Plaster logo.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PassThru**
Returns an InvokePlasterInfo object with the following fields:
* TemplatePath
* DestinationPath
* Success
* CreatedFiles
* UpdatedFiles
* MissingModules

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **TemplatePath**
Specifies the path to the template directory.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |0       |False        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

---

### Notes

---

### Syntax
```PowerShell
Invoke-Plaster [-TemplatePath] <String> [-DestinationPath] <String> [-Confirm] [-Force] [-NoLogo] [-PassThru] [-WhatIf] [<CommonParameters>]
```
