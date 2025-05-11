Expand-Data
-----------

### Synopsis
Expands Compressed Data

---

### Description

Expands Compressed Data using the .NET GZipStream class

---

### Related Links
* [Compress-Data](Compress-Data)

* [http://msdn.microsoft.com/en-us/library/system.io.compression.gzipstream.aspx](http://msdn.microsoft.com/en-us/library/system.io.compression.gzipstream.aspx)

---

### Examples
> EXAMPLE 1

```PowerShell
Compress-Data -String ("abc" * 1kb) | 
    Expand-Data
```

---

### Parameters
#### **CompressedData**
The compressed data, as a Base64 string

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|false   |1       |true (ByValue, ByPropertyName)|

#### **BinaryData**
The compressed data, as a byte array

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Byte[]]`|false   |1       |true (ByValue, ByPropertyName)|

#### **As**
The type of data the decompressed object will be (a string or a byte array)
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
Expand-Data [[-BinaryData] <Byte[]>] [-As <String>] [<CommonParameters>]
```
```PowerShell
Expand-Data [[-CompressedData] <String>] [-As <String>] [<CommonParameters>]
```
