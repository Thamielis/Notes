New-HTMLAnchor
--------------

### Synopsis
Short description

---

### Description

Long description

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLAnchor -Target _parent
New-HTMLAnchor -Id "show_$RandomNumber" -Href '#' -OnClick "show('$RandomNumber');" -Style "color: #ffffff; display:none;" -Text 'Show'

Output:
<a target = "_parent" />
```

---

### Parameters
#### **Name**
Parameter description

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |1       |false        |AnchorName|

#### **Id**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Target**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Class**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **HrefLink**
Parameter description

|Type      |Required|Position|PipelineInput|Aliases                          |
|----------|--------|--------|-------------|---------------------------------|
|`[String]`|false   |5       |false        |Url<br/>Link<br/>UrlLink<br/>Href|

#### **OnClick**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **Style**
Parameter description

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |7       |false        |

#### **Text**
Parameter description

|Type      |Required|Position|PipelineInput|Aliases             |
|----------|--------|--------|-------------|--------------------|
|`[String]`|false   |8       |false        |AnchorText<br/>Value|

---

### Notes
General notes

---

### Syntax
```PowerShell
New-HTMLAnchor [[-Name] <String>] [[-Id] <String>] [[-Target] <String>] [[-Class] <String>] [[-HrefLink] <String>] [[-OnClick] <String>] [[-Style] <IDictionary>] [[-Text] <String>] [<CommonParameters>]
```
