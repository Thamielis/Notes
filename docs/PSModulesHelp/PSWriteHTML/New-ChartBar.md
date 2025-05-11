New-ChartBar
------------

### Synopsis
Creates a new bar chart object with specified name, value, and color.

---

### Description

This function creates a new bar chart object with the provided name, value, and color. The name is used as the identifier for the bar, the value represents the data to be displayed, and the color determines the color of the bar.

---

### Examples
> EXAMPLE 1

```PowerShell
New-ChartBar -Name 'Sales' -Value 1000 -Color 'blue'
Creates a new bar chart object named 'Sales' with a value of 1000 and a blue color.
```
> EXAMPLE 2

```PowerShell
New-ChartBar -Name 'Expenses' -Value 750 -Color 'red'
Creates a new bar chart object named 'Expenses' with a value of 750 and a red color.
```

---

### Parameters
#### **Name**
The name of the bar chart object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Value**
The value or data to be displayed in the bar chart.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |2       |false        |

#### **Color**
The color of the bar. If not specified, a default color will be used.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |false        |

---

### Syntax
```PowerShell
New-ChartBar [-Name] <String> [-Value] <Object> [[-Color] <String[]>] [<CommonParameters>]
```
