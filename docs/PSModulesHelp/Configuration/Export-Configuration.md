Export-Configuration
--------------------

### Synopsis
Exports a configuration object to a specified path.

---

### Description

Exports the configuration object to a file, by default, in the Roaming AppData location

NOTE: this exports the FULL configuration to this file, which will override both defaults and local machine configuration when Import-Configuration is used.

---

### Examples
> EXAMPLE 1

```PowerShell
@{UserName = $Env:UserName; LastUpdate = [DateTimeOffset]::Now } | Export-Configuration
This example shows how to use Export-Configuration in your module to cache some data.
```
> EXAMPLE 2

```PowerShell
Get-Module Configuration | Export-Configuration @{UserName = $Env:UserName; LastUpdate = [DateTimeOffset]::Now }
This example shows how to use Export-Configuration to export data for use in a specific module.

PSSCriptAnalyzer team refuses to listen to reason. See bugs:  #194 #283 #521 #608
```

---

### Parameters
#### **InputObject**
Specifies the objects to export as metadata structures.
Enter a variable that contains the objects or type a command or expression that gets the objects.
You can also pipe objects to Export-Metadata.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Object]`|true    |1       |true (ByValue)|

#### **AsHashtable**
Serialize objects as hashtables

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
DefaultPath is IGNORED.
The parameter was here to match Import-Configuration, but it is meaningless in Export-Configuration
The only reason I haven't removed it is that I don't want to break any code that might be using it.
TODO: If we release a breaking changes Configuration 2.0, remove this parameter

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|false   |named   |true (ByPropertyName)|ModuleBase|

#### **Scope**
The scope to save at, defaults to Enterprise (which returns a path in "RoamingData")
Valid Values:

* User
* Machine
* Enterprise

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Version**
The version for saved settings -- if set, will be used in the returned path
NOTE: this is *NOT* calculated from the CallStack

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Version]`|false   |named   |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---

### Syntax
```PowerShell
Export-Configuration [-InputObject] <Object> [-AsHashtable] [-Module <PSModuleInfo>] [-Version <Version>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Export-Configuration [-InputObject] <Object> [-AsHashtable] [-CallStack <CallStackFrame[]>] [-Version <Version>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Export-Configuration [-InputObject] <Object> [-AsHashtable] -CompanyName <String> -Name <String> [-DefaultPath <String>] [-Scope <String>] [-Version <Version>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
