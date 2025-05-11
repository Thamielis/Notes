New-TablePercentageBar
----------------------

### Synopsis
Creates a new table percentage bar object with specified attributes.

---

### Description

This function creates a new table percentage bar object with the provided attributes. It allows customization of the appearance of the percentage bar within a table.

---

### Examples
> EXAMPLE 1

```PowerShell
New-TablePercentageBar -ColumnID 1 -ColumnName "Progress" -Type 'round' -TextColor "#ffffff" -BorderColor "#000000" -BorderStyle 'solid' -BarColor "#00ff00" -BackgroundColor "#ffffff" -RoundValue 2
Description:
Creates a new table percentage bar object for the column "Progress" with specified attributes.
```

---

### Parameters
#### **ConditionalFormatting**
Specifies any conditional formatting rules for the percentage bar.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **ColumnID**
Specifies the ID of the column where the percentage bar will be displayed.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |false        |

#### **ColumnName**
Specifies the name of the column where the percentage bar will be displayed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Type**
Specifies the shape of the percentage bar. Valid values are 'square' or 'round'.
Valid Values:

* square
* round

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **TextColor**
Specifies the color of the text within the percentage bar.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **BorderColor**
Specifies the color of the border of the percentage bar.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **BorderStyle**
Specifies the style of the border of the percentage bar. Valid values are 'solid', 'outset', 'groove', or 'ridge'.
Valid Values:

* solid
* outset
* groove
* ridge

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **BarColor**
Specifies the color of the percentage bar itself.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |

#### **BackgroundColor**
Specifies the background color of the percentage bar.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |9       |false        |

#### **RoundValue**
Specifies the decimal places to round the percentage value to.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |10      |false        |

---

### Notes
Additional notes about the function.

---

### Syntax
```PowerShell
New-TablePercentageBar [[-ConditionalFormatting] <ScriptBlock>] [[-ColumnID] <Int32>] [[-ColumnName] <String>] [[-Type] <String>] [[-TextColor] <String>] [[-BorderColor] <String>] [[-BorderStyle] <String>] [[-BarColor] <String>] [[-BackgroundColor] <String>] [[-RoundValue] <Int32>] [<CommonParameters>]
```
