Update-Metadata
---------------

### Synopsis
Update a single value in a PowerShell metadata file

---

### Description

By default Update-Metadata increments "ModuleVersion"
because my primary use of it is during builds,
but you can pass the PropertyName and Value for any key in a module Manifest, its PrivateData, or the PSData in PrivateData.

NOTE: This will not currently create new keys, or uncomment keys.

---

### Examples
> EXAMPLE 1

```PowerShell
Update-Metadata .\Configuration.psd1
Increments the Build part of the ModuleVersion in the Configuration.psd1 file
```
> EXAMPLE 2

```PowerShell
Update-Metadata .\Configuration.psd1 -Increment Major
Increments the Major version part of the ModuleVersion in the Configuration.psd1 file
```
> EXAMPLE 3

```PowerShell
Update-Metadata .\Configuration.psd1 -Value '0.4'
Sets the ModuleVersion in the Configuration.psd1 file to 0.4
```
> EXAMPLE 4

```PowerShell
Update-Metadata .\Configuration.psd1 -Property ReleaseNotes -Value 'Add the awesome Update-Metadata function!'
Sets the PrivateData.PSData.ReleaseNotes value in the Configuration.psd1 file!
```

---

### Parameters
#### **Path**
The path to the module manifest file -- must be a .psd1 file
As an easter egg, you can pass the CONTENT of a psd1 file instead, and the modified data will pass through

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |1       |true (ByPropertyName)|PSPath |

#### **PropertyName**
The property to be set in the manifest. It must already exist in the file (and not be commented out)
This searches the Manifest root properties, then the properties PrivateData, then the PSData

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Value**
A new value for the property

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |named   |false        |

#### **Increment**
By default Update-Metadata increments ModuleVersion; this controls which part of the version number is incremented
Valid Values:

* Major
* Minor
* Build
* Revision

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Passthru**
When set, and incrementing the ModuleVersion, output the new version number.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
Update-Metadata [[-Path] <String>] [-PropertyName <String>] -Value <Object> [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Update-Metadata [[-Path] <String>] [-Increment <String>] [-Passthru] [-WhatIf] [-Confirm] [<CommonParameters>]
```
