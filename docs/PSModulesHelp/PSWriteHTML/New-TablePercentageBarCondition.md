New-TablePercentageBarCondition
-------------------------------

### Synopsis
Creates a new table percentage bar condition object with specified attributes.

---

### Description

This function creates a new table percentage bar condition object with the provided attributes. It defines the minimum and maximum values for the percentage range, along with the colors for the background, text, and bar.

---

### Examples
> EXAMPLE 1

```PowerShell
New-TablePercentageBarCondition -Minimum 0 -Maximum 10 -BackgroundColor "#ff0000" -TextColor "#ffffff" -BarColor "#ff0000"
Creates a new table percentage bar condition object for the range 0-10 with specified colors.
```
> EXAMPLE 2

```PowerShell
New-TablePercentageBarCondition -Minimum 11 -Maximum 20 -BackgroundColor "#00ff00" -BarColor "#00ff00"
Creates a new table percentage bar condition object for the range 11-20 with specified colors.
```
> EXAMPLE 3

```PowerShell
New-TablePercentageBarCondition -Minimum 21 -Maximum 23 -BackgroundColor "#0000ff" -BarColor "#0000ff"
Creates a new table percentage bar condition object for the range 21-23 with specified colors.
```
> EXAMPLE 4

```PowerShell
New-TablePercentageBarCondition -Minimum 24 -Maximum 100 -BackgroundColor "#00FFFF" -BarColor "#00FFFF"
Creates a new table percentage bar condition object for the range 24-100 with specified colors.
```

---

### Parameters
#### **Minimum**
Specifies the minimum value for the percentage range.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |1       |false        |

#### **Maximum**
Specifies the maximum value for the percentage range.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |2       |false        |

#### **BackgroundColor**
Specifies the background color for the percentage bar.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **TextColor**
Specifies the text color for the percentage bar.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **BarColor**
Specifies the color of the percentage bar.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

---

### Syntax
```PowerShell
New-TablePercentageBarCondition [-Minimum] <Int32> [-Maximum] <Int32> [[-BackgroundColor] <String>] [[-TextColor] <String>] [[-BarColor] <String>] [<CommonParameters>]
```
