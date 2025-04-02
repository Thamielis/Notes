Add-HTMLScript
--------------

### Synopsis

Add-HTMLScript [[-Placement] <string>] [[-Resource] <IDictionary>] [[-ResourceComment] <string>] [[-Link] <string[]>] [[-Content] <string[]>] [[-FilePath] <string[]>] [[-ReplaceData] <IDictionary>] [-AddComments] [-SkipTags] [<CommonParameters>]

---

### Description

---

### Parameters
#### **AddComments**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Content**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |4       |false        |

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

#### **ReplaceData**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |6       |false        |

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
{@{name=Add-HTMLScript; CommonParameters=True; parameter=System.Object[]}}
```
