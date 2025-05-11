New-HTMLAccordion
-----------------

### Synopsis
Creates a new HTML accordion element with customizable options.

---

### Description

This function creates a new HTML accordion element with the specified accordion item content, duration of animation, and option to collapse on click.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLAccordion -AccordionItem { "Accordion Content Here" } -Duration 500 -CollapseOnClick
Creates a new HTML accordion with the specified content, animation duration of 500 milliseconds, and collapses on click.
```

---

### Parameters
#### **AccordionItem**
Specifies the content of the accordion item as a script block.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Duration**
Specifies the duration of the accordion animation in milliseconds.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |false        |

#### **CollapseOnClick**
Indicates whether the accordion should collapse when clicked.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
New-HTMLAccordion [[-AccordionItem] <ScriptBlock>] [[-Duration] <Int32>] [-CollapseOnClick] [<CommonParameters>]
```
