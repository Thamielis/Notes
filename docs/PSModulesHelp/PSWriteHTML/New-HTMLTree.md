New-HTMLTree
------------

### Synopsis
Creates a new HTML tree using FancyTree with various customization options.

---

### Description

This function creates a new HTML tree using FancyTree with the ability to customize the tree's appearance and behavior. It supports features like checkboxes, radio buttons, selection modes, icons, keyboard navigation, quick search, child counters, and more.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLTree -Data {
    TreeNode -Node "Root" -Children {
        TreeNode -Node "Child 1"
        TreeNode -Node "Child 2"
    }
} -Checkbox 'checkbox' -SelectMode '3' -EnableChildCounter -WideSelection
Creates a new HTML tree with checkboxes, hierarchical selection mode, child counters, and wide selection enabled.
```

---

### Parameters
#### **Data**
The script block that contains the data to populate the tree.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Checkbox**
Specifies the type of checkboxes to be displayed in the tree. Valid values are 'none', 'checkbox', or 'radio'. Default is 'none'.
Valid Values:

* none
* checkbox
* radio

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **SelectMode**
Specifies the selection mode for the tree. Valid values are 'none', '1', '2', or '3'. Default is '2'.
Valid Values:

* none
* 1
* 2
* 3

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

#### **DisableIcons**
Disables icons in the tree if this switch is present.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableControl**
Disables control features in the tree if this switch is present.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableKeyboardNavigation**
Disables keyboard navigation in the tree if this switch is present.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AutoCollapseSibling**
Automatically collapses sibling nodes when a node is expanded.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AutoScroll**
Enables auto-scrolling when navigating the tree.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EnableQuickSearch**
Enables quick search functionality in the tree.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EnableChildCounter**
Enables child counter display in the tree.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **WideSelection**
Enables wide selection mode in the tree.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **MinimumExpandLevel**
Specifies the minimum level of nodes to expand in the tree.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |4       |false        |

---

### Syntax
```PowerShell
New-HTMLTree [[-Data] <ScriptBlock>] [[-Checkbox] <String>] [[-SelectMode] <Object>] [-DisableIcons] [-DisableControl] [-DisableKeyboardNavigation] [-AutoCollapseSibling] [-AutoScroll] [-EnableQuickSearch] [-EnableChildCounter] [-WideSelection] [[-MinimumExpandLevel] <Nullable`1>] [<CommonParameters>]
```
