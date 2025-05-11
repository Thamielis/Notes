Import-Configuration
--------------------

### Synopsis
Import the full, layered configuration for the module.

---

### Description

Imports the DefaultPath Configuration file, and then imports the Machine, Roaming (enterprise), and local config files, if they exist.
Each configuration file is layered on top of the one before (so only needs to set values which are different)

---

### Examples
> EXAMPLE 1

```PowerShell
$Configuration = Import-Configuration
This example shows how to use Import-Configuration in your module to load the cached data
```
> EXAMPLE 2

```PowerShell
$Configuration = Get-Module Configuration | Import-Configuration
This example shows how to use Import-Configuration in your module to load data cached for another module
```

---

### Parameters
#### **CallStack**
A callstack. You should not ever pass this.
It is used to calculate the defaults for all the other parameters.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[CallStackFrame[]]`|false   |named   |false        |

#### **Module**
The Module you're importing configuration for

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[PSModuleInfo]`|false   |named   |true (ByValue, ByPropertyName)|

#### **CompanyName**
An optional module qualifier (by default, this is blank)

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |named   |true (ByPropertyName)|Author |

#### **Name**
The name of the module or script
Will be used in the returned storage path

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **DefaultPath**
The full path (including file name) of a default Configuration.psd1 file
By default, this is expected to be in the same folder as your module manifest, or adjacent to your script file

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|false   |named   |true (ByPropertyName)|ModuleBase|

#### **Version**
The version for saved settings -- if set, will be used in the returned path
NOTE: this is *never* calculated, if you use version numbers, you must manage them on your own

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Version]`|false   |named   |false        |

#### **Ordered**
If set (and PowerShell version 4 or later) preserve the file order of configuration
This results in the output being an OrderedDictionary instead of Hashtable

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AllowedVariables**
Allows extending the valid variables which are allowed to be referenced in configuration
BEWARE: This exposes the value of these variables in the calling context to the configuration file
You are reponsible to only allow variables which you know are safe to share

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

---

### Syntax
```PowerShell
Import-Configuration [-CallStack <CallStackFrame[]>] [-Version <Version>] [-Ordered] [-AllowedVariables <String[]>] [<CommonParameters>]
```
```PowerShell
Import-Configuration [-Module <PSModuleInfo>] [-Version <Version>] [-Ordered] [-AllowedVariables <String[]>] [<CommonParameters>]
```
```PowerShell
Import-Configuration -CompanyName <String> -Name <String> [-DefaultPath <String>] [-Version <Version>] [-Ordered] [-AllowedVariables <String[]>] [<CommonParameters>]
```
