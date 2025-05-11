New-HTMLTreeNode
----------------

### Synopsis
Creates a new HTML tree node with specified properties.

---

### Description

This function creates a new HTML tree node with the specified properties. It allows for customization of various attributes such as title, ID, folder structure, tooltip, icon, selection status, expansion status, etc.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLTreeNode -Title "Folder 1" -Id "folder1" -Folder -Children {
    New-HTMLTreeNode -Title "Item 1" -Id "item1"
    New-HTMLTreeNode -Title "Item 2" -Id "item2"
}
```
> EXAMPLE 2

```PowerShell
New-HTMLTreeNode -Title "Document" -Id "doc1" -HrefLink "https://example.com" -Target "_blank"
```

---

### Parameters
#### **Children**
Specifies the script block that defines the children nodes of the tree node.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Title**
Specifies the title of the tree node.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Id**
Specifies the unique identifier of the tree node.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Folder**
Indicates whether the tree node represents a folder.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Tooltip**
Specifies the tooltip text for the tree node.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **Icon**
Specifies the icon for the tree node.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **IconTooltip**
Specifies the tooltip text for the icon.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **IsSelected**
Indicates whether the tree node is selected.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IsExpanded**
Indicates whether the tree node is expanded.

|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[Switch]`|false   |named   |false        |Expanded|

#### **Unselectable**
Indicates whether the tree node is unselectable.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Checkbox**
Specifies the type of checkbox for the tree node. Valid values are 'none', 'checkbox', or 'radio'.
Valid Values:

* none
* checkbox
* radio

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **HrefLink**
Specifies the URL link for the tree node.

|Type      |Required|Position|PipelineInput|Aliases                          |
|----------|--------|--------|-------------|---------------------------------|
|`[String]`|false   |8       |false        |Url<br/>Link<br/>UrlLink<br/>Href|

#### **Target**
Specifies the target window for the URL link. Valid values are "_blank", "_self", "_parent", "_top", or a frame name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |9       |false        |

---

### Syntax
```PowerShell
New-HTMLTreeNode [[-Children] <ScriptBlock>] [[-Title] <String>] [[-Id] <String>] [-Folder] [[-Tooltip] <String>] [[-Icon] <String>] [[-IconTooltip] <String>] [-IsSelected] [-IsExpanded] [-Unselectable] [[-Checkbox] <String>] [[-HrefLink] <String>] [[-Target] <String>] [<CommonParameters>]
```
