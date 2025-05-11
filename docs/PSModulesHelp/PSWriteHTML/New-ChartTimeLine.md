New-ChartTimeLine
-----------------

### Synopsis
Creates a new time series chart object.

---

### Description

This function creates a new time series chart object with the specified Name, DateFrom, DateTo, Color, TimeZoneOffset, and DateFormatPattern. It allows customization of the time series chart appearance.

---

### Examples
> EXAMPLE 1

```PowerShell
New-ChartTimeLine -Name "TimeSeries1" -DateFrom (Get-Date) -DateTo (Get-Date).AddDays(7) -Color "Blue" -TimeZoneOffset "+3" -DateFormatPattern "MM/dd/yyyy HH:mm:ss"
Creates a new time series chart object named "TimeSeries1" with a date range from the current date to 7 days ahead, colored in blue, with a time zone offset of +3, and using the date format pattern "MM/dd/yyyy HH:mm:ss".
```
> EXAMPLE 2

```PowerShell
New-ChartTimeLine -Name "TimeSeries2" -DateFrom (Get-Date) -DateTo (Get-Date).AddDays(14) -Color "Green" -TimeZoneOffset "-5"
Creates a new time series chart object named "TimeSeries2" with a date range from the current date to 14 days ahead, colored in green, with a time zone offset of -5, using the default date format pattern.
```

---

### Parameters
#### **Name**
Specifies the name of the time series chart.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **DateFrom**
Specifies the starting date for the time series chart.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |2       |false        |

#### **DateTo**
Specifies the ending date for the time series chart.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |3       |false        |

#### **Color**
Specifies the color of the time series chart.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **TimeZoneOffset**
Specifies the time zone offset for the time series chart.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **DateFormatPattern**
Specifies the date format pattern for the time series chart. Default is "yyyy-MM-dd HH:mm:ss".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

---

### Syntax
```PowerShell
New-ChartTimeLine [-Name] <String> [[-DateFrom] <DateTime>] [[-DateTo] <DateTime>] [[-Color] <String>] [[-TimeZoneOffset] <String>] [[-DateFormatPattern] <String>] [<CommonParameters>]
```
