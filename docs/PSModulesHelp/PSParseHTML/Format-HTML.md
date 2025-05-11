Format-HTML
-----------

### Synopsis

Format-HTML [[-File] <string>] [[-OutputFile] <string>] [[-Content] <string>] [[-Indent] <string>] [[-BlockStartLine] <BlockStart>] [-RemoveHTMLComments] [-RemoveOptionalTags] [-OutputTextNodesOnNewLine] [-RemoveEmptyAttributes] [-AlphabeticallyOrderAttributes] [-RemoveEmptyBlocks] [<CommonParameters>]

---

### Description

---

### Parameters
#### **AlphabeticallyOrderAttributes**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **BlockStartLine**

Valid Values:

* NewLine
* SameLine
* UseSource

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[BlockStart]`|false   |4       |false        |

#### **Content**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |2       |false        |

#### **File**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |0       |false        |

#### **Indent**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |3       |false        |

#### **OutputFile**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |1       |false        |

#### **OutputTextNodesOnNewLine**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **RemoveEmptyAttributes**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **RemoveEmptyBlocks**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **RemoveHTMLComments**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **RemoveOptionalTags**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Syntax
```PowerShell
syntaxItem
```
```PowerShell
----------
```
```PowerShell
{@{name=Format-HTML; CommonParameters=True; parameter=System.Object[]}}
```
