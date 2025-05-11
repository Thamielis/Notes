New-ChartPie
------------

### Synopsis
Creates a new pie chart with customizable options.

---

### Description

This function creates a new pie chart with the specified name, value, and color. It allows customization of the pie chart appearance.

---

### Examples
> EXAMPLE 1

```PowerShell
New-ChartPie -Name "Slice 1" -Value 30 -Color "red"
Creates a new pie chart segment named "Slice 1" with a value of 30 and colored in red.
```
> EXAMPLE 2

```PowerShell
New-ChartPie -Name "Slice 2" -Value 20 -Color "blue"
Creates a new pie chart segment named "Slice 2" with a value of 20 and colored in blue.
```

---

### Parameters
#### **Name**
Specifies the name of the pie chart.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Value**
Specifies the value of the pie chart segment.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **Color**
Specifies the color of the pie chart segment.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

---

### Syntax
```PowerShell
New-ChartPie [[-Name] <String>] [[-Value] <Object>] [[-Color] <String>] [<CommonParameters>]
```
