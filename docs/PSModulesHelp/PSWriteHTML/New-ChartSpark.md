New-ChartSpark
--------------

### Synopsis
Creates a new spark chart object.

---

### Description

This function creates a new spark chart object with the specified Name, Value, and Color.

---

### Examples
> EXAMPLE 1

```PowerShell
New-ChartSpark -Name "Spark1" -Value 100 -Color "Green"
Creates a new spark chart object named "Spark1" with a value of 100 and a green color.
```
> EXAMPLE 2

```PowerShell
New-ChartSpark -Name "Spark2" -Value 50
Creates a new spark chart object named "Spark2" with a value of 50 using the default color.
```

---

### Parameters
#### **Name**
Specifies the name of the spark chart.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Value**
Specifies the value of the spark chart.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **Color**
Specifies the color of the spark chart.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

---

### Syntax
```PowerShell
New-ChartSpark [[-Name] <String>] [[-Value] <Object>] [[-Color] <String>] [<CommonParameters>]
```
