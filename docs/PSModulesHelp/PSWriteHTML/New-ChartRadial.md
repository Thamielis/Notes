New-ChartRadial
---------------

### Synopsis
Creates a new radial chart object.

---

### Description

This function creates a new radial chart object with the specified Name, Value, and Color.

---

### Examples
> EXAMPLE 1

```PowerShell
New-ChartRadial -Name "Chart1" -Value 75 -Color "Blue"
Creates a new radial chart object named "Chart1" with a value of 75 and a blue color.
```
> EXAMPLE 2

```PowerShell
New-ChartRadial -Name "Chart2" -Value 50
Creates a new radial chart object named "Chart2" with a value of 50 using the default color.
```

---

### Parameters
#### **Name**
Specifies the name of the radial chart.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Value**
Specifies the value of the radial chart.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **Color**
Specifies the color of the radial chart. If not provided, the default color is used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

---

### Syntax
```PowerShell
New-ChartRadial [[-Name] <String>] [[-Value] <Object>] [[-Color] <String>] [<CommonParameters>]
```
