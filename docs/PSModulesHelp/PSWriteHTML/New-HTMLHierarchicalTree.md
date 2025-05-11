New-HTMLHierarchicalTree
------------------------

### Synopsis
Creates a hierarchical tree structure in HTML using D3.js.

---

### Description

This function generates an HTML hierarchical tree structure based on the provided tree view data using D3.js library.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLHierarchicalTree -TreeView {
    @{
        Type = 'TreeNode'
        Settings = @{
            id = 1
            parentId = 0
            name = 'Root'
            description = 'Root Node'
        }
    }
} -Autosize
# Generates a hierarchical tree with a root node.
```

---

### Parameters
#### **TreeView**
Specifies the tree view data to be used for generating the hierarchical tree structure.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Autosize**
Indicates whether the SVG should be sized based on the nodes or use configured height/width for the SVG.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
New-HTMLHierarchicalTree [[-TreeView] <ScriptBlock>] [-Autosize] [<CommonParameters>]
```
