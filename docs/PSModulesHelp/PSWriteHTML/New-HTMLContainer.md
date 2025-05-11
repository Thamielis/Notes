New-HTMLContainer
-----------------

### Synopsis
Creates a new HTML container element with customizable options.

---

### Description

This function creates a new HTML container element with the specified options such as content, width, margin, and anchor name.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLContainer -HTML {
    // HTML content here
} -Width '50%' -Margin '10px' -AnchorName 'myAnchor'
Creates a new HTML container with custom HTML content, width of 50%, margin of 10px, and anchor name 'myAnchor'.
```
> EXAMPLE 2

```PowerShell
New-HTMLContainer -HTML {
    // More HTML content
}
Creates a new HTML container with additional HTML content and default width and margin.
```

---

### Parameters
#### **HTML**
Specifies the content to be placed inside the container as a ScriptBlock.

|Type           |Required|Position|PipelineInput|Aliases|
|---------------|--------|--------|-------------|-------|
|`[ScriptBlock]`|false   |1       |false        |Content|

#### **Width**
Specifies the width of the container. Default is '100%'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

#### **Margin**
Specifies the margin of the container.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AnchorName**
Specifies the anchor name for the container. If not provided, a random anchor name will be generated.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Syntax
```PowerShell
New-HTMLContainer [[-HTML] <ScriptBlock>] [-Width <Object>] [-Margin <String>] [-AnchorName <String>] [<CommonParameters>]
```
