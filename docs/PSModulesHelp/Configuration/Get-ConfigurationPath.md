Get-ConfigurationPath
---------------------

### Synopsis
Gets an storage path for configuration files and data

---

### Description

Gets an AppData (or roaming profile) or ProgramData path for configuration and data storage. The folder returned is guaranteed to exist (which means calling this function actually creates folders).

Get-ConfigurationPath is designed to be called from inside a module function WITHOUT any parameters.

If you need to call Get-ConfigurationPath from outside a module, you should pipe the ModuleInfo to it, like:
Get-Module Powerline | Get-ConfigurationPath

As a general rule, there are three scopes which result in three different root folders
    User:       $Env:LocalAppData
    Machine:    $Env:ProgramData
    Enterprise: $Env:AppData (which is the "roaming" folder of AppData)

---

### Examples
> EXAMPLE 1

```PowerShell
$CacheFile = Join-Path (Get-ConfigurationPath) Data.clixml
$Data | Export-CliXML -Path $CacheFile
This example shows how to use Get-ConfigurationPath with Export-CliXML to cache data as clixml from inside a module.
```

---

### Parameters
#### **Scope**
The scope to save at, defaults to Enterprise (which returns a path in "RoamingData")
Valid Values:

* User
* Machine
* Enterprise

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **CallStack**
A callstack. You should not ever pass this.
It is used to calculate the defaults for all the other parameters.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[CallStackFrame[]]`|false   |named   |false        |

#### **Module**
The Module you're importing configuration for

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSModuleInfo]`|false   |named   |true (ByValue)|

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

#### **Version**
The version for saved settings -- if set, will be used in the returned path
NOTE: this is *NOT* calculated from the CallStack

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Version]`|false   |named   |false        |

#### **SkipCreatingFolder**
By default, Get-ConfigurationPath creates the folder if it doesn't already exist
This switch allows overriding that behavior: if set, does not create missing paths

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
1.  This command is primarily meant to be used in modules, to find a place where they can serialize data for storage.
2.  It's techincally possible for more than one module to exist with the same name.
    The command uses the Author or Company as a distinguishing name.

---

### Syntax
```PowerShell
Get-ConfigurationPath [-Scope <String>] [-Module <PSModuleInfo>] [-Version <Version>] [-SkipCreatingFolder] [<CommonParameters>]
```
```PowerShell
Get-ConfigurationPath [-Scope <String>] [-CallStack <CallStackFrame[]>] [-Version <Version>] [-SkipCreatingFolder] [<CommonParameters>]
```
```PowerShell
Get-ConfigurationPath [-Scope <String>] -CompanyName <String> -Name <String> [-Version <Version>] [-SkipCreatingFolder] [<CommonParameters>]
```
