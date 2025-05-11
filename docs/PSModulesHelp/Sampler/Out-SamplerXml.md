Out-SamplerXml
--------------

### Synopsis
Outputs an XML document to a file.

---

### Description

Outputs an XML document to the file specified in the parameter Path.

---

### Examples
> EXAMPLE 1

<a><b /></a>' -Encoding 'UTF8'

---

### Parameters
#### **XmlDocument**
The XML document to format.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[XmlDocument]`|true    |1       |false        |

#### **Path**
The path to the file name to write to.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **Encoding**
Specifies the encoding for the file.
Valid Values:

* ASCII
* BigEndianUnicode
* Default
* Latin1
* Unicode
* UTF32
* UTF7
* UTF8

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

---

### Syntax
```PowerShell
Out-SamplerXml [-XmlDocument] <XmlDocument> [-Path] <String> [[-Encoding] <String>] [<CommonParameters>]
```
