New-ConditionalFormattingIconSet
--------------------------------

### Synopsis
Creates an object which describes a conditional formatting rule a for 3,4 or 5 icon set.

---

### Description

Export-Excel takes a -ConditionalFormat parameter which can hold one or more descriptions for conditional formats; this command builds the defintion of a Conditional formatting rule for an icon set.

---

### Related Links
* [Online Version:](Online Version:)

* [Add-Add-ConditionalFormatting](Add-Add-ConditionalFormatting)

---

### Examples
> EXAMPLE 1

```PowerShell
PS\> $cfRange = [OfficeOpenXml.ExcelAddress]::new($topRow, $column, $lastDataRow, $column)
PS\> $cfdef = New-ConditionalFormattingIconSet -Range $cfrange -ConditionalFormat ThreeIconSet -IconType Arrows
PS\> Export-Excel -ExcelPackage $excel -ConditionalFormat $cfdef -show
The first line creates a range - one column wide in the column $column, running from $topRow to $lastDataRow. The second line creates a definition object using this range and the third uses Export-Excel with an open package to apply the format and save and open the file.
```

---

### Parameters
#### **Range**
The range of cells that the conditional format applies to.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |False        |

#### **ConditionalFormat**
The type of rule: one of "ThreeIconSet","FourIconSet" or "FiveIconSet"
Valid Values:

* ThreeIconSet
* FourIconSet
* FiveIconSet

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |False        |

#### **Reverse**
Use the icons in the reverse order.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Notes

---

### Syntax
```PowerShell
New-ConditionalFormattingIconSet [-Range] <Object> [[-ConditionalFormat] <Object>] [-Reverse] [<CommonParameters>]
```
