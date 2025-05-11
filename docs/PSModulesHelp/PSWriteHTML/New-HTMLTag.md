New-HTMLTag
-----------

### Synopsis
Creates a new HTML tag with specified attributes and content.

---

### Description

The New-HTMLTag function creates a new HTML tag with the specified tag name, attributes, and content. It supports self-closing tags, custom attributes, and new line formatting.

---

### Examples
> EXAMPLE 1

New-HTMLTag -Tag "div" -Attributes @{ class = "container" } -Value { "Hello, World!" }
Creates a <div> tag with the class attribute set to "container" and the content "Hello, World!".
> EXAMPLE 2

New-HTMLTag -Tag "img" -Attributes @{ src = "image.jpg"; alt = "Image" } -SelfClosing
Creates an <img> tag with the src and alt attributes set and is self-closing.

---

### Parameters
#### **Value**
Specifies the content of the HTML tag as a script block.

|Type           |Required|Position|PipelineInput|Aliases|
|---------------|--------|--------|-------------|-------|
|`[ScriptBlock]`|false   |1       |false        |Content|

#### **Tag**
Specifies the name of the HTML tag to create.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **Attributes**
Specifies additional attributes for the HTML tag.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |named   |false        |

#### **SelfClosing**
Indicates whether the HTML tag is self-closing.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NoClosing**
Indicates whether the HTML tag should not have a closing tag.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NewLine**
Indicates whether a new line should be added after the HTML tag.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
New-HTMLTag [[-Value] <ScriptBlock>] [-Tag] <String> [-Attributes <IDictionary>] [-SelfClosing] [-NoClosing] [-NewLine] [<CommonParameters>]
```
