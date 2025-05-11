ConvertFrom-Metadata
--------------------

### Synopsis
Deserializes objects from PowerShell Data language (PSD1)

---

### Description

Converts psd1 notation to actual objects, and supports passing in additional converters
in addition to using the built-in registered converters (see Add-MetadataConverter).

NOTE: Any Converters that are passed in are temporarily added as though passed Add-MetadataConverter

---

### Examples
> EXAMPLE 1

ConvertFrom-Metadata 'PSObject @{ Name = PSObject @{ First = "Joel"; Last = "Bennett" }; Id = 1; }'
Id Name
-- ----
1 @{Last=Bennett; First=Joel}

Convert the example string into a real PSObject using the built-in object serializer.
> EXAMPLE 2

```PowerShell
$data = ConvertFrom-Metadata .\Configuration.psd1 -Ordered
Convert a module manifest into a hashtable of properties for introspection, preserving the order in the file
```
> EXAMPLE 3

```PowerShell
ConvertFrom-Metadata ("DateTimeOffset 635968680686066846 -05:00:00") -Converters @{
"DateTimeOffset" = {
    param($ticks,$offset)
    [DateTimeOffset]::new( $ticks, $offset )
}
}
Shows how to temporarily add a "ValidCommand" called "DateTimeOffset" to support extra data types in the metadata.

See also the third example on ConvertTo-Metadata and Add-MetadataConverter
```

---

### Parameters
#### **InputObject**
The metadata text (or a path to a metadata file)

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Object]`|true    |1       |true (ByPropertyName)|PSPath |

#### **Type**
The Type that the InputObject represents

|Type    |Required|Position|PipelineInput|Aliases|
|--------|--------|--------|-------------|-------|
|`[Type]`|true    |2       |false        |As     |

#### **Converters**
A hashtable of MetadataConverters (same as with Add-MetadataConverter)

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |named   |false        |

#### **ScriptRoot**
The PSScriptRoot which the metadata should be evaluated from.
You do not normally need to pass this, and it has no effect unless
you're referencing $ScriptRoot in your metadata

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

#### **Ordered**
If set (and PowerShell version 4 or later) preserve the file order of configuration
This results in the output being an OrderedDictionary instead of Hashtable

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AllowedVariables**
Allows extending the valid variables which are allowed to be referenced in metadata
BEWARE: This exposes the value of these variables in your context to the caller
You are reponsible to only allow variables which you know are safe to share

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **PSVariable**
You should not pass this.
The PSVariable parameter is for preserving variable scope within the Metadata commands

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[PSVariableIntrinsics]`|false   |named   |false        |

---

### Syntax
```PowerShell
ConvertFrom-Metadata [-InputObject] <Object> [-Converters <Hashtable>] [-ScriptRoot <Object>] [-Ordered] [-AllowedVariables <String[]>] [-PSVariable <PSVariableIntrinsics>] [<CommonParameters>]
```
```PowerShell
ConvertFrom-Metadata [-InputObject] <Object> [-Type] <Type> [-Converters <Hashtable>] [-ScriptRoot <Object>] [-Ordered] [-AllowedVariables <String[]>] [-PSVariable <PSVariableIntrinsics>] [<CommonParameters>]
```
