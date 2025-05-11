New-MapArea
-----------

### Synopsis
Creates a new MapArea object with specified parameters.

---

### Description

This function creates a new MapArea object with the specified area, href, value, and optional tooltip content.

---

### Examples
> EXAMPLE 1

```PowerShell
New-MapArea -Area "North" -Href "north.html" -Value "North Region" -Tooltip { "This is the North region." }
Creates a new MapArea object for the North region with the specified href, value, and tooltip content.
```
> EXAMPLE 2

```PowerShell
New-MapArea -Area "South" -Href "south.html" -Value "South Region"
Creates a new MapArea object for the South region with the specified href and value.
```

---

### Parameters
#### **Area**
Specifies the area for the MapArea object. This parameter is mandatory.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Href**
Specifies the href attribute for the MapArea object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Value**
Specifies the value attribute for the MapArea object. This parameter is mandatory.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

#### **TooltipContent**

|Type           |Required|Position|PipelineInput|Aliases|
|---------------|--------|--------|-------------|-------|
|`[ScriptBlock]`|false   |4       |false        |Tooltip|

---

### Syntax
```PowerShell
New-MapArea [-Area] <String> [[-Href] <String>] [-Value] <String> [[-TooltipContent] <ScriptBlock>] [<CommonParameters>]
```
