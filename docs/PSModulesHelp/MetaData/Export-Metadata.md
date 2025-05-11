Export-Metadata
---------------

### Synopsis
Creates a metadata file from a simple object

---

### Description

Serves as a wrapper for ConvertTo-Metadata to explicitly support exporting to files

Note that exportable data is limited by the rules of data sections (see about_Data_Sections) and the available MetadataSerializers (see Add-MetadataConverter)

The only things inherently importable in PowerShell metadata files are Strings, Booleans, and Numbers ... and Arrays or Hashtables where the values (and keys) are all strings, booleans, or numbers.

Note: this function and the matching Import-Metadata are extensible, and have included support for PSCustomObject, Guid, Version, etc.

---

### Examples
> EXAMPLE 1

$Configuration | Export-Metadata .\Configuration.psd1
Export a configuration object (or hashtable) to the default Configuration.psd1 file for a module
the metadata module uses Configuration.psd1 as it's default config file.

---

### Parameters
#### **Path**
Specifies the path to the PSD1 output file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

#### **CommentHeader**
comments to place on the top of the file (to explain settings or whatever for people who might edit it by hand)

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **InputObject**
Specifies the objects to export as metadata structures.
Enter a variable that contains the objects or type a command or expression that gets the objects.
You can also pipe objects to Export-Metadata.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Object]`|true    |named   |true (ByValue)|

#### **AsHashtable**
Serialize objects as hashtables

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Converters**

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |named   |false        |

#### **Passthru**
If set, output the nuspec file

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
Export-Metadata [-Path] <Object> [-CommentHeader <String[]>] -InputObject <Object> [-AsHashtable] [-Converters <Hashtable>] [-Passthru] [-WhatIf] [-Confirm] [<CommonParameters>]
```
