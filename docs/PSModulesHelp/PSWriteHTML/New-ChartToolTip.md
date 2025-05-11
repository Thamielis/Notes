New-ChartToolTip
----------------

### Synopsis
Creates a new chart tooltip object with customizable options.

---

### Description

This function defines a chart tooltip object with various options such as names, title text, type, min and max values, X and Y axis format patterns. It allows customization of the tooltip appearance and behavior.

---

### Examples
> EXAMPLE 1

```PowerShell
New-ChartToolTip -Names @("Name1", "Name2") -TitleText "Tooltip Title" -Type 'datetime' -MinValue 0 -MaxValue 100 -XAxisFormatPattern "HH:mm:ss" -YAxisFormatPattern "function (seriesName) { return seriesName + ': ' + value; }"
Creates a new chart tooltip object with names "Name1" and "Name2", title "Tooltip Title", datetime type, min value of 0, max value of 100, X-axis format pattern "HH:mm:ss", and custom Y-axis format pattern.
```
> EXAMPLE 2

```PowerShell
New-ChartToolTip -Names @("Data1", "Data2", "Data3") -TitleText "Data Tooltip" -Type 'numeric' -MinValue 50 -MaxValue 200 -XAxisFormatPattern "MM/dd/yyyy" -YAxisFormatPattern "function (seriesName) { return seriesName + ': ' + value; }"
Creates a new chart tooltip object with names "Data1", "Data2", and "Data3", title "Data Tooltip", numeric type, min value of 50, max value of 200, X-axis format pattern "MM/dd/yyyy", and custom Y-axis format pattern.
```

---

### Parameters
#### **Names**
Specifies an array of names for the chart tooltip.

|Type     |Required|Position|PipelineInput|Aliases|
|---------|--------|--------|-------------|-------|
|`[Array]`|false   |1       |false        |Name   |

#### **TitleText**
Specifies the title text for the chart tooltip.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |2       |false        |Title  |

#### **Type**
Specifies the type of the chart tooltip. Valid values are 'datetime', 'category', or 'numeric'.
Valid Values:

* datetime
* category
* numeric

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **MinValue**
Specifies the minimum value for the chart tooltip.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

#### **MaxValue**
Specifies the maximum value for the chart tooltip.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |5       |false        |

#### **XAxisFormatPattern**
Specifies the format pattern for the X-axis in the chart tooltip.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **YAxisFormatPattern**
Specifies the format pattern for the Y-axis in the chart tooltip. Default is "function (seriesName) { return ''; }".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

---

### Syntax
```PowerShell
New-ChartToolTip [[-Names] <Array>] [[-TitleText] <String>] [[-Type] <String>] [[-MinValue] <Object>] [[-MaxValue] <Object>] [[-XAxisFormatPattern] <String>] [[-YAxisFormatPattern] <String>] [<CommonParameters>]
```
