Out-HTML
--------

### Synopsis
Produces HTML output from the PowerShell pipeline.

---

### Description

Produces HTML output from the PowerShell pipeline, doing the best possible to obey the formatting rules in PowerShell.

---

### Related Links
* [New-Webpage](New-Webpage)

* [Write-Link](Write-Link)

* [New-Region](New-Region)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-Process | Out-HTML
```

---

### Parameters
#### **InputObject**
The input object

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[PSObject]`|false   |named   |true (ByValue)|

#### **WriteResponse**
If set, writes the response directly

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Escape**
If set, escapes the output

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Id**
The id of the table that will be created

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **VerticalAlignment**
The vertical alignment of rows within the generated table.  By default, aligns to top
Valid Values:

* Baseline
* Top
* Bottom
* Middle

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

#### **TableWidth**
The table width, as a percentage

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **CssClass**
The CSS class to apply to the table.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Style**
A CSS Style

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |named   |false        |

#### **ItemType**
If set, will enclose the output in a div with an itemscope and itemtype attribute

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **ViewName**
If more than one view is available, this view will be used

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **UseTableSorter**
If set, will use the table sorter plugin

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **UseDataTable**
If set, will use the datatable plugin

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsPieGraph**
If set, will show the output as a pie graph

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **AsBarGraph**
If set, will show the output as a bar graph

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Horizontal**
If set, the bar graph will be horizontal, not vertical

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ColorList**
The list of colors in the graph

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **GraphWidth**
The width of the canvas for a graph

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |named   |false        |

#### **GraphHeight**
The height of the canvas for a graph

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |named   |false        |

#### **Header**
The header of a graph

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **HeaderAlignment**
The text alignment of the header.  By default, center
Valid Values:

* Left
* Center
* Right

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **HeaderSize**
The size of the header

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **HideLegend**
If set, no legend will be displayed

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Syntax
```PowerShell
Out-HTML [-InputObject <PSObject>] [-WriteResponse] [-Escape] [-Id <String>] [-VerticalAlignment <Object>] [-TableWidth <UInt32>] [-CssClass <String>] [-Style <Hashtable>] [-ItemType <String[]>] [-ViewName <String>] [-UseTableSorter] [-UseDataTable] [<CommonParameters>]
```
```PowerShell
Out-HTML [-InputObject <PSObject>] [-WriteResponse] [-Escape] [-Id <String>] [-VerticalAlignment <Object>] [-TableWidth <UInt32>] [-CssClass <String>] [-Style <Hashtable>] [-ItemType <String[]>] [-ViewName <String>] [-UseTableSorter] [-UseDataTable] -AsPieGraph [-ColorList <String[]>] [-GraphWidth <Double>] [-GraphHeight <Double>] [-Header <String>] [-HeaderAlignment <String>] [-HeaderSize <UInt32>] [-HideLegend] [<CommonParameters>]
```
```PowerShell
Out-HTML [-InputObject <PSObject>] [-WriteResponse] [-Escape] [-Id <String>] [-VerticalAlignment <Object>] [-TableWidth <UInt32>] [-CssClass <String>] [-Style <Hashtable>] [-ItemType <String[]>] [-ViewName <String>] [-UseTableSorter] [-UseDataTable] -AsBarGraph [-Horizontal] [-ColorList <String[]>] [-GraphWidth <Double>] [-GraphHeight <Double>] [-Header <String>] [-HeaderAlignment <String>] [-HeaderSize <UInt32>] [-HideLegend] [<CommonParameters>]
```
