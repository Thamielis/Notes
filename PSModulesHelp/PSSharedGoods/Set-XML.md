Set-XML
-------

### Synopsis
Sets a specific node value in an XML file.

---

### Description

This function sets the value of a specified node in an XML file at the given path.

---

### Examples
> EXAMPLE 1

```PowerShell
Set-XML -FilePath "C:\example.xml" -Paths "Root", "Child" -Node "Value" -Value "NewValue"
Sets the value of the "Value" node under "Root/Child" path in the XML file to "NewValue".
```

---

### Parameters
#### **FilePath**
The path to the XML file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Paths**
An array of paths to navigate through the XML structure.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **Node**
The name of the node to set the value for.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Value**
The value to set for the specified node.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

---

### Notes
File encoding is assumed to be UTF-8.

---

### Syntax
```PowerShell
Set-XML [[-FilePath] <String>] [[-Paths] <String[]>] [[-Node] <String>] [[-Value] <String>] [<CommonParameters>]
```
