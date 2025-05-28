Get-DotNetTool
--------------

### Synopsis
Simple wrapper to check whether a given .NET tool is already installed.

---

### Description

Simple wrapper to check whether a given .NET tool is already installed.

---

### Examples
> EXAMPLE 1

Get-DotNetTool -Global -Name gitversion.tool
name            version commands
----            ------- --------
gitversion.tool 5.8.0   dotnet-gitversion
Checks whether any version of the 'gitversion.tool' .NET tool is installed globally, returning an object with the installed tool's details.
> EXAMPLE 2

Get-DotNetTool -ToolPath ./tools -Name gitversion.tool -Version 5.6.6
Checks whether version 5.6.6 of the 'gitversion.tool' .NET tool is installed to a store at the specified directory, returning null if it isn't.

---

### Parameters
#### **Name**
The name of the .NET tool to check

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Version**
The version of the .NET tool to check for. When unspecified any version found will cause this function to return true.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Global**
When specified, the tool's installation status is checked in the global scope (i.e. for the current user).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Local**
When specified, the tool's installation status is checked in the local scope (i.e. for the current project's .NET tool manifest).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ToolPath**
When specified, the tool's installation status is checked in the specified directory.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Outputs
* An object containing the details of the installed tool, or null if the tool isn't installed.
@{
    name = "gitversion.tool"
    version = "5.6.6"
    commands = "dotnet-gitversion"
}

---

### Syntax
```PowerShell
Get-DotNetTool -Name <String> [-Version <String>] [-Global] [<CommonParameters>]
```
```PowerShell
Get-DotNetTool -Name <String> [-Version <String>] [-Local] [<CommonParameters>]
```
```PowerShell
Get-DotNetTool -Name <String> [-Version <String>] [-ToolPath <String>] [<CommonParameters>]
```
