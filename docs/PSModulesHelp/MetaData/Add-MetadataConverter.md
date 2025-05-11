Add-MetadataConverter
---------------------

### Synopsis
Add a converter functions for serialization and deserialization to metadata

---

### Description

Add-MetadataConverter allows you to map:
* a type to a scriptblock which can serialize that type to metadata (psd1)
* define a name and scriptblock as a function which will be whitelisted in metadata (for ConvertFrom-Metadata and Import-Metadata)

The idea is to give you a way to extend the serialization capabilities if you really need to.

---

### Examples
> EXAMPLE 1

```PowerShell
Add-MetadataCOnverter @{ [bool] = { if($_) { '$True' } else { '$False' } } }
Shows a simple example of mapping bool to a scriptblock that serializes it in a way that's inherently parseable by PowerShell.  This exact converter is already built-in to the Metadata module, so you don't need to add it.
```
> EXAMPLE 2

```PowerShell
Add-MetadataConverter @{
   [Uri] = { "Uri '$_' " }
   "Uri" = {
      param([string]$Value)
      [Uri]$Value
   }
}
Shows how to map a function for serializing Uri objects as strings with a Uri function that just casts them. Normally you wouldn't need to do that for Uri, since they output strings natively, and it's perfectly logical to store Uris as strings and only cast them when you really need to.
```
> EXAMPLE 3

```PowerShell
Add-MetadataConverter @{
   [DateTimeOffset] = { "DateTimeOffset {0} {1}" -f $_.Ticks, $_.Offset }
   "DateTimeOffset" = {param($ticks,$offset) [DateTimeOffset]::new( $ticks, $offset )}
}
Shows how to change the DateTimeOffset serialization.

By default, DateTimeOffset values are (de)serialized using the 'o' RoundTrips formatting
e.g.: [DateTimeOffset]::Now.ToString('o')
```

---

### Parameters
#### **Converters**
A hashtable of types to serializer scriptblocks, or function names to scriptblock definitions

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|true    |1       |false        |

---

### Syntax
```PowerShell
Add-MetadataConverter [-Converters] <Hashtable> [<CommonParameters>]
```
