New-HTMLMap
-----------

### Synopsis
Creates a new HTML map with specified settings.

---

### Description

This function creates a new HTML map with customizable settings such as map type, legend options, colors, and titles.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLMap -Map 'World_Countries' -AnchorName 'Map1' -ShowAreaLegend -AreaTitle 'Country Population' -PlotTitle 'Population Density' -FillColor 'blue' -StrokeColor 'black' -StrokeWidth 2
Creates a new HTML map displaying world countries with area legend showing country population and plot legend showing population density. The map areas are filled with blue color, have black borders, and a border width of 2.
```
> EXAMPLE 2

```PowerShell
$CustomSettings = {
    # Custom map settings here
}
New-HTMLMap -Map 'Usa_States' -AnchorName 'Map2' -ShowPlotLegend -PlotTitle 'Economic Data' -FillColor 'green' -StrokeColor 'gray' -StrokeWidth 1 -MapSettings $CustomSettings
Creates a new HTML map displaying USA states with plot legend showing economic data. The map areas are filled with green color, have gray borders, and a border width of 1. Custom map settings are applied using the script block $CustomSettings.
```

---

### Parameters
#### **MapSettings**
A script block containing custom map settings to be applied.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Map**
Specifies the type of map to be displayed. Valid values are 'Poland', 'Usa_States', 'World_Countries', or 'European_Union'.
Valid Values:

* Poland
* Usa_States
* World_Countries
* European_Union

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **AnchorName**
Specifies the name of the HTML anchor element where the map will be rendered.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **ShowAreaLegend**
Switch parameter to indicate whether to display the area legend on the map.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AreaTitle**
Specifies the title for the area legend.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **PlotTitle**
Specifies the title for the plot legend.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **ShowPlotLegend**
Switch parameter to indicate whether to display the plot legend on the map.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **FillColor**
Specifies the color to fill the map areas.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |6       |false        |SliceColor|

#### **StrokeColor**
Specifies the color of the map area borders.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **StrokeWidth**
Specifies the width of the map area borders.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |8       |false        |

---

### Syntax
```PowerShell
New-HTMLMap [[-MapSettings] <ScriptBlock>] [-Map] <String> [[-AnchorName] <String>] [-ShowAreaLegend] [[-AreaTitle] <String>] [[-PlotTitle] <String>] [-ShowPlotLegend] [[-FillColor] <String>] [[-StrokeColor] <String>] [[-StrokeWidth] <Nullable`1>] [<CommonParameters>]
```
