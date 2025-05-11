ConvertTo-Metadata
------------------

### Synopsis
Serializes objects to PowerShell Data language (PSD1)

---

### Description

Converts objects to a texual representation that is valid in PSD1,
using the built-in registered converters (see Add-MetadataConverter).

NOTE: Any Converters that are passed in are temporarily added as though passed Add-MetadataConverter

---

### Examples
> EXAMPLE 1

```PowerShell
$Name = @{ First = "Joel"; Last = "Bennett" }
@{ Name = $Name; Id = 1; } | ConvertTo-Metadata
@{
  Id = 1
  Name = @{
    Last = 'Bennett'
    First = 'Joel'
  }
}

Convert input objects into a formatted string suitable for storing in a psd1 file.
```
> EXAMPLE 2

```PowerShell
Get-ChildItem -File | Select-Object FullName, *Utc, Length | ConvertTo-Metadata
Convert complex custom types to dynamic PSObjects using Select-Object.

ConvertTo-Metadata understands PSObjects automatically, so this allows us to proceed
without a custom serializer for File objects, but the serialized data
will not be a FileInfo or a DirectoryInfo, just a custom PSObject
```
> EXAMPLE 3

```PowerShell
ConvertTo-Metadata ([DateTimeOffset]::Now) -Converters @{
   [DateTimeOffset] = { "DateTimeOffset {0} {1}" -f $_.Ticks, $_.Offset }
}
Shows how to temporarily add a MetadataConverter to convert a specific type while serializing the current DateTimeOffset.
Note that this serialization would require a "DateTimeOffset" function to exist in order to deserialize properly.

See also the third example on ConvertFrom-Metadata and Add-MetadataConverter.
```

---

### Parameters
#### **InputObject**
The object to convert to metadata

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Object]`|false   |1       |true (ByValue)|

#### **AsHashtable**
Serialize objects as hashtables

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Converters**
Additional converters

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |2       |false        |

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Syntax
```PowerShell
ConvertTo-Metadata [[-InputObject] <Object>] [-AsHashtable] [[-Converters] <Hashtable>] [<CommonParameters>]
```
