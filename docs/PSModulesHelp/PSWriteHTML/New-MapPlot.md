New-MapPlot
-----------

### Synopsis
Creates a new MapPlot object with specified latitude, longitude, and other optional parameters.

---

### Description

This function creates a new MapPlot object with the provided latitude, longitude, and other optional parameters like href, value, and tooltip content.

---

### Examples
> EXAMPLE 1

```PowerShell
New-MapPlot -Plot "Sample Plot" -Latitude 40.7128 -Longitude -74.0060 -Href "https://example.com" -Value "Sample Value" -TooltipContent { "This is a sample tooltip." }
Creates a new MapPlot object named "Sample Plot" with latitude 40.7128, longitude -74.0060, a hyperlink reference to "https://example.com", a value of "Sample Value", and a tooltip content of "This is a sample tooltip."
```

---

### Parameters
#### **Plot**
Specifies the name of the plot.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Latitude**
Specifies the latitude coordinate for the plot.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|true    |2       |false        |

#### **Longitude**
Specifies the longitude coordinate for the plot.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|true    |3       |false        |

#### **Href**
Specifies the hyperlink reference for the plot.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **Value**
Specifies the value associated with the plot.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |5       |false        |

#### **TooltipContent**
Specifies the content of the tooltip associated with the plot.

|Type           |Required|Position|PipelineInput|Aliases|
|---------------|--------|--------|-------------|-------|
|`[ScriptBlock]`|false   |6       |false        |Tooltip|

---

### Syntax
```PowerShell
New-MapPlot [-Plot] <String> [-Latitude] <Double> [-Longitude] <Double> [[-Href] <String>] [-Value] <String> [[-TooltipContent] <ScriptBlock>] [<CommonParameters>]
```
