New-HTMLTreeNode
----------------

### Synopsis

New-HTMLTreeNode [[-Children] <scriptblock>] [[-Title] <string>] [[-Id] <string>] [[-Tooltip] <string>] [[-Icon] <string>] [[-IconTooltip] <string>] [[-Checkbox] <string>] [[-HrefLink] <string>] [[-Target] <string>] [-Folder] [-IsSelected] [-IsExpanded] [-Unselectable] [<CommonParameters>]

---

### Description

---

### Parameters
#### **Checkbox**

Valid Values:

* none
* checkbox
* radio

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |6       |false        |

#### **Children**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[scriptblock]`|false   |0       |false        |

#### **Folder**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **HrefLink**

|Type      |Required|Position|PipelineInput|Aliases                          |
|----------|--------|--------|-------------|---------------------------------|
|`[string]`|false   |7       |false        |Url<br/>Link<br/>UrlLink<br/>Href|

#### **Icon**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |4       |false        |

#### **IconTooltip**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |5       |false        |

#### **Id**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |2       |false        |

#### **IsExpanded**

|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[switch]`|false   |Named   |false        |Expanded|

#### **IsSelected**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Target**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |8       |false        |

#### **Title**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |1       |false        |

#### **Tooltip**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |3       |false        |

#### **Unselectable**

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
{@{name=New-HTMLTreeNode; CommonParameters=True; parameter=System.Object[]}}
```
