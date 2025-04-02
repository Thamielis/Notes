Initialize-ModulePortable
-------------------------

### Synopsis
Initializes a portable module by downloading or importing it along with its required modules.

---

### Description

This function initializes a portable module by either downloading it from the PowerShell Gallery or importing it from a specified path. It also recursively loads any required modules for the primary module.

---

### Examples
> EXAMPLE 1

```PowerShell
Initialize-ModulePortable -Name "MyModule" -Download
Downloads the module named "MyModule" from the PowerShell Gallery.
```
> EXAMPLE 2

```PowerShell
Initialize-ModulePortable -Name "MyModule" -Path "C:\Modules" -Import
Imports the module named "MyModule" from the specified path "C:\Modules".
```

---

### Parameters
#### **Name**
Specifies the name of the module to initialize.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |1       |false        |ModuleName|

#### **Path**
Specifies the path where the module will be downloaded or imported. Defaults to the current script root.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Download**
Switch to indicate whether to download the module from the PowerShell Gallery.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Import**
Switch to indicate whether to import the module from the specified path.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Initialize-ModulePortable [[-Name] <String>] [[-Path] <String>] [-Download] [-Import] [<CommonParameters>]
```
