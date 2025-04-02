Save-XML
--------

### Synopsis
Saves an XML document to a specified file path.

---

### Description

This function saves an XML document to a specified file path using UTF-8 encoding without BOM.

---

### Examples
> EXAMPLE 1

```PowerShell
Save-XML -FilePath "C:\Documents\example.xml" -xml $xmlDocument
Saves the XML document $xmlDocument to the file "example.xml" located in the "C:\Documents" directory.
```

---

### Parameters
#### **FilePath**
Specifies the path where the XML document will be saved.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **xml**
Specifies the XML document to be saved.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[XmlNode]`|false   |2       |false        |

---

### Syntax
```PowerShell
Save-XML [[-FilePath] <String>] [[-xml] <XmlNode>] [<CommonParameters>]
```
