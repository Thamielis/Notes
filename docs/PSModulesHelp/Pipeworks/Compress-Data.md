Compress-Data
-------------

### Synopsis
Compresses data

---

### Description

Compresses data into a GZipStream

---

### Related Links
* [Expand-Data](Expand-Data)

* [http://msdn.microsoft.com/en-us/library/system.io.compression.gzipstream.aspx](http://msdn.microsoft.com/en-us/library/system.io.compression.gzipstream.aspx)

---

### Examples
> EXAMPLE 1

```PowerShell
$rawData = (Get-Command | Select-Object -ExpandProperty Name | Out-String)
$originalSize = $rawData.Length
$compressed = Compress-Data $rawData -As Byte
"$($compressed.Length / $originalSize)% Smaller [ Compressed size $($compressed.Length / 1kb)kb : Original Size $($originalSize /1kb)kb] "
Expand-Data -BinaryData $compressed
```

---

### Parameters
#### **String**
A string to compress

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Data**
A byte array to compress.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Byte[]]`|true    |1       |true (ByPropertyName)|

#### **As**
Determine how the data is returned.  
If set to byte, the data will be returned as a byte array.  If set to string, it will be returned as a string.
Valid Values:

* String
* Byte

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

* [Byte](https://learn.microsoft.com/en-us/dotnet/api/System.Byte)

---

### Syntax
```PowerShell
Compress-Data [-String] <String> [-As <String>] [<CommonParameters>]
```
```PowerShell
Compress-Data [-Data] <Byte[]> [-As <String>] [<CommonParameters>]
```
