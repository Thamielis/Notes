New-ChartAxisX
--------------

### Synopsis
Creates a new X-axis for a chart with specified parameters.

---

### Description

This function creates a new X-axis for a chart with the provided parameters. It allows customization of the axis name, title, type, minimum and maximum values, and timezone offset.

---

### Examples
> EXAMPLE 1

```PowerShell
New-ChartAxisX -Names @('Jan', 'Feb', 'Mar') -TitleText 'Months' -Type 'category'
Creates a new X-axis with categories 'Jan', 'Feb', 'Mar' and title 'Months'.
```
> EXAMPLE 2

```PowerShell
New-ChartAxisX -Names @('2020-01-01', '2020-02-01', '2020-03-01') -TitleText 'Dates' -Type 'datetime' -MinValue (Get-Date '2020-01-01') -MaxValue (Get-Date '2020-03-01') -TimeZoneOffset '+02:00'
Creates a new X-axis with datetime values, title 'Dates', and timezone offset of +2 hours.
```

---

### Parameters
#### **Names**
An array of names for the X-axis categories.

|Type     |Required|Position|PipelineInput|Aliases|
|---------|--------|--------|-------------|-------|
|`[Array]`|false   |1       |false        |Name   |

#### **TitleText**
The title text to be displayed for the X-axis.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |2       |false        |Title  |

#### **Type**
The type of the X-axis data. Accepted values are 'datetime', 'category', or 'numeric'. Default is 'category'.
Valid Values:

* datetime
* category
* numeric

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **MinValue**
The minimum value of the X-axis.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

#### **MaxValue**
The maximum value of the X-axis.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |5       |false        |

#### **TimeZoneOffset**
The timezone offset to adjust the X-axis values.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

---

### Syntax
```PowerShell
New-ChartAxisX [[-Names] <Array>] [[-TitleText] <String>] [[-Type] <String>] [[-MinValue] <Object>] [[-MaxValue] <Object>] [[-TimeZoneOffset] <String>] [<CommonParameters>]
```
