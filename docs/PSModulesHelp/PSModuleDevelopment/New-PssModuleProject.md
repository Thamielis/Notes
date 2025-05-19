New-PssModuleProject
--------------------

### Synopsis
Builds a Sapien PowerShell Studio Module Project from a regular module.

---

### Description

Builds a Sapien PowerShell Studio Module Project, either a clean one, or imports from a regular module.
Will ignore all hidden files and folders, will also ignore all files and folders in the root folder that start with a dot (".").

Importing from an existing module requires the module to have a valid manifest.

---

### Examples
> EXAMPLE 1

```PowerShell
New-PssModuleProject -Name 'Foo'
Creates a new module project named "Foo" in your default project folder.
```
> EXAMPLE 2

New-PssModuleProject -Name dbatools -SourcePath "C:\Github\dbatools"
Imports the dbatools github repo's local copy into a new PSS module project in your default project folder.
> EXAMPLE 3

```PowerShell
New-PssModuleProject -name 'Northwind' -SourcePath "C:\Github\Northwind" -Path "C:\Projects" -Force
Will create a new module project, importing from "C:\Github\Northwind" and storing it in "C:\Projects". It will overwrite any existing folder named "Northwind" in the destination folder.
```

---

### Parameters
#### **Name**
The name of the folder to create the project in.
Will also be used to name a blank module project. (When importing a module into a project, the name will be taken from the manifest file).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Path**
The path to create the new module-project folder in. Will default to the PowerShell Studio project folder.
The function will fail if PSS is not found on the system and no path was specified.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **SourcePath**
The path to the module to import from.
Specify the path the the root folder the actual module files are in.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Force**
Force causes the function to overwrite all stuff in the destination folder ($Path\$Name), if it already exists.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
Author:      Friedrich Weinmann
Editors:     -
Created on:  01.03.2017
Last Change: 01.03.2017
Version:     1.0

Release 1.0 (01.03.2017, Friedrich Weinmann)
- Initial Release

---

### Syntax
```PowerShell
New-PssModuleProject -Name <String> [-Path <String>] [-Force] [<CommonParameters>]
```
```PowerShell
New-PssModuleProject -Name <String> [-Path <String>] -SourcePath <String> [-Force] [<CommonParameters>]
```
