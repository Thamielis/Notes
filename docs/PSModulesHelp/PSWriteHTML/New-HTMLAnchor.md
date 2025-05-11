New-HTMLAnchor
--------------

### Synopsis
Creates a new HTML anchor element.

---

### Description

This function creates a new HTML anchor element (<a>) with specified attributes.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLAnchor -Target _parent
Creates an anchor element with the target attribute set to "_parent".
New-HTMLAnchor -Id "show_$RandomNumber" -Href '#' -OnClick "show('$RandomNumber');" -Style "color: #ffffff; display:none;" -Text 'Show'
Creates an anchor element with specified attributes and text.

Output:
<a id="show_$RandomNumber" class="" target="_parent" href="#" onclick="show('$RandomNumber');" style="color: #ffffff; display:none;">Show</a>
```

---

### Parameters
#### **Name**
The name of the anchor element.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |1       |false        |AnchorName|

#### **Id**
The ID of the anchor element.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Target**
Specifies where to open the linked document.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Class**
The CSS class of the anchor element.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **HrefLink**
The URL of the linked document.

|Type      |Required|Position|PipelineInput|Aliases                          |
|----------|--------|--------|-------------|---------------------------------|
|`[String]`|false   |5       |false        |Url<br/>Link<br/>UrlLink<br/>Href|

#### **OnClick**
JavaScript code to execute when the anchor element is clicked.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **Style**
The CSS styles to apply to the anchor element.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |7       |false        |

#### **Text**
The text to display within the anchor element.

|Type      |Required|Position|PipelineInput|Aliases             |
|----------|--------|--------|-------------|--------------------|
|`[String]`|false   |8       |false        |AnchorText<br/>Value|

---

### Notes
This function is part of a set of functions for generating HTML elements.

---

### Syntax
```PowerShell
New-HTMLAnchor [[-Name] <String>] [[-Id] <String>] [[-Target] <String>] [[-Class] <String>] [[-HrefLink] <String>] [[-OnClick] <String>] [[-Style] <IDictionary>] [[-Text] <String>] [<CommonParameters>]
```
