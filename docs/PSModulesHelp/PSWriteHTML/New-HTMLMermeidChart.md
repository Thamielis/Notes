New-HTMLMermeidChart
--------------------

### Synopsis
Creates a new HTML Mermaid chart.

---

### Description

This function creates a new HTML Mermaid chart based on the provided Markdown scriptblock.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLMermeidChart -Markdown { @"
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
"@ }
This example creates a simple flowchart with nodes A, B, C, and D connected by arrows.
```

---

### Parameters
#### **Markdown**
The Markdown scriptblock containing the Mermaid chart definition.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

---

### Syntax
```PowerShell
New-HTMLMermeidChart [[-Markdown] <ScriptBlock>] [<CommonParameters>]
```
