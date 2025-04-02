Add-HTMLStyle
-------------

### Synopsis

Add-HTMLStyle [[-Placement] <string>] [[-Resource] <IDictionary>] [[-ResourceComment] <string>] [[-Link] <string[]>] [[-Content] <string[]>] [[-FilePath] <string[]>] [[-Css] <IDictionary>] [[-ReplaceData] <IDictionary>] [[-RelType] <string>] [-AddComment] [-SkipTags] [<CommonParameters>]

---

### Description

---

### Parameters
#### **AddComment**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Content**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |4       |false        |

#### **Css**

|Type           |Required|Position|PipelineInput|Aliases  |
|---------------|--------|--------|-------------|---------|
|`[IDictionary]`|false   |6       |false        |CssInline|

#### **FilePath**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |5       |false        |

#### **Link**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |3       |false        |

#### **Placement**

Valid Values:

* Inline
* Header
* Footer

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |0       |false        |

#### **RelType**

Valid Values:

* dns-prefetch
* preconnect
* preload

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |8       |false        |

#### **ReplaceData**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |7       |false        |

#### **Resource**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |1       |false        |

#### **ResourceComment**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |2       |false        |

#### **SkipTags**

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
{@{name=Add-HTMLStyle; CommonParameters=True; parameter=System.Object[]}}
```
