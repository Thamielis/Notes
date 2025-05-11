New-ChartDonut
--------------

### Synopsis
Creates a new donut chart object with specified name, value, and color.

---

### Description

This function creates a new donut chart object with the provided name, value, and color. The name is used as the identifier for the donut, the value represents the data to be displayed, and the color determines the color of the donut.

---

### Examples
> EXAMPLE 1

```PowerShell
New-ChartDonut -Name 'Sales' -Value 1000 -Color 'blue'
Creates a new donut chart object named 'Sales' with a value of 1000 and a blue color.
```
> EXAMPLE 2

```PowerShell
New-ChartDonut -Name 'Expenses' -Value 750 -Color 'red'
Creates a new donut chart object named 'Expenses' with a value of 750 and a red color.
```

---

### Parameters
#### **Name**
The name of the donut chart object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Value**
The value or data to be displayed in the donut chart.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **Color**
The color of the donut. If not specified, a default color will be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

---

### Syntax
```PowerShell
New-ChartDonut [[-Name] <String>] [[-Value] <Object>] [[-Color] <String>] [<CommonParameters>]
```
