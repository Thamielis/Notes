New-gyPSumModule
----------------

### Synopsis

New-gyPSumModule [[-DestinationPath] <string>] [[-TemplatePath] <string>] [-ModuleType <string>] [-ModuleAuthor <string>] [-ModuleName <string>] [-ModuleDescription <string>] [-ModuleVersion <string>] [-UseGit <string>] [-MainGitBranch <string>] [-UseGitVersion <string>] [-UseGitHub <string>] [-UseVSCode <string>] [-LicenseType <string>] [-SourceDirectory <string>] [-Features <string[]>] [<CommonParameters>]

---

### Description

---

### Parameters
#### **DestinationPath**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |0       |false        |

#### **Features**
What feature would you like to add to your project?
Valid Values:

* UnitTests
* Build

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |Named   |false        |

#### **LicenseType**
What license do you want?
Valid Values:

* MIT
* Apache
* None

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **MainGitBranch**
Name of your default branch

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **ModuleAuthor**
Author's name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **ModuleDescription**
Description of this module

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **ModuleName**
Name of your module

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **ModuleType**
Select the type of Module you would like to create:
Valid Values:

* FullModule
* MinimalModule
* CustomModule

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **ModuleVersion**
Module version

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **SourceDirectory**
What name do you give your source folder?
Valid Values:

* Source
* ${PLASTER_PARAM_ModuleName}
* src

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **TemplatePath**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |1       |false        |

#### **UseGit**
Create gitignore file and show parameters related to git
Valid Values:

* true
* false

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **UseGitHub**
Will you use GitHub.com as the collaboration platform for the project?
Valid Values:

* true
* false

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **UseGitVersion**
Do you want to add configuration for GitVersion to handle automatic versioning for your project?
Valid Values:

* true
* false

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **UseVSCode**
Will you use Visual Studio Code as the code editor for the project?
Valid Values:

* true
* false

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Syntax
```PowerShell
syntaxItem
```
```PowerShell
----------
```
```PowerShell
{@{name=New-gyPSumModule; CommonParameters=True; parameter=System.Object[]}}
```
