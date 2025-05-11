New-ChartLine
-------------

### Synopsis
Add a line to a chart

---

### Description

Add a line to a chart

---

### Examples
> EXAMPLE 1

```PowerShell
An example
```

---

### Parameters
#### **Name**
Name of the line

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Value**
Values to display

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **Color**
Colors to fill the border for paths.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Curve**
Whether to draw smooth lines or straight lines
Valid Values:

* straight
* smooth
* stepline

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

#### **Width**
Sets the width of border for svg path

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |5       |false        |

#### **Cap**
For setting the starting and ending points of stroke
Valid Values:

* butt
* square
* round

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **Dash**
Creates dashes in borders of svg path. Higher number creates more space between dashes in the border.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |7       |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
New-ChartLine [[-Name] <String>] [[-Value] <Object>] [[-Color] <String>] [[-Curve] <Object>] [[-Width] <Nullable`1>] [[-Cap] <String>] [[-Dash] <Nullable`1>] [<CommonParameters>]
```
