Install-DotNetTool
------------------

### Synopsis
Simple wrapper to install a .NET global tool if it is not already installed.

---

### Description

Simple wrapper to install a .NET Global Tool if it is not already installed.  Any existing
installed version will be uninstalled before installing the required version.

---

### Examples
> EXAMPLE 1

```PowerShell
Install-DotNetTool -Global -Name dotnet-gitversion
Installs the latest version of the 'doitnet-gitversion' .NET tool into the global tool area (i.e. '~/.dotnet')
```
> EXAMPLE 2

```PowerShell
Install-DotNetTool -ToolPath ./tools -Name dotnet-gitversion -Version 5.6.6
Installs version 5.6.6 of the 'dotnet-gitversion' .NET tool into a store located in the specified directory.  The ToolPath directory must already exist, but can be empty.
```

---

### Parameters
#### **Name**
The name of the .NET global tool to install

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Version**
The version of the global tool to install.  When unspecified the latest version will attempted to used, however, this does not work for all scenarios (e.g. pre-release, when not using a fully-featured NuGet feed as a source).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AdditionalArgs**
An array of arbitrary command-line arguments supported by 'dotnet tool install'

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Global**
When specified, the tool is installed in the global scope (i.e. for the current user).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Local**
When specified, the tool is installed in the local scope (i.e. for the current project's .NET tool manifest).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ToolPath**
When specified, the tool is installed in the specified directory.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Syntax
```PowerShell
Install-DotNetTool [-Name] <String> [-Version <String>] [-AdditionalArgs <String[]>] [-Global] [<CommonParameters>]
```
```PowerShell
Install-DotNetTool [-Name] <String> [-Version <String>] [-AdditionalArgs <String[]>] [-Local] [<CommonParameters>]
```
```PowerShell
Install-DotNetTool [-Name] <String> [-Version <String>] [-AdditionalArgs <String[]>] [-ToolPath <String>] [<CommonParameters>]
```
