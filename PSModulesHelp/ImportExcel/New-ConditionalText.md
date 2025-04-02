New-ConditionalText
-------------------

### Synopsis
Creates an object which describes a conditional formatting rule for single valued rules.

---

### Description

Some Conditional formatting rules don't apply styles to a cell (IconSets and Databars); some take two parameters (Between); some take none (ThisWeek, ContainsErrors, AboveAverage etc).The others take a single parameter (Top, BottomPercent, GreaterThan, Contains etc).

This command creates an object to describe the last two categories, which can then be passed to Export-Excel.

---

### Related Links
* [Online Version:](Online Version:)

* [Add-ConditionalFormatting](Add-ConditionalFormatting)

---

### Examples
> EXAMPLE 1

```PowerShell
PS\> $ct = New-ConditionalText -Text  'Ferrari'
PS\> Export-Excel -ExcelPackage $excel -ConditionalTest $ct -show
The first line creates a definition object which will highlight the word "Ferrari" in any cell. and the second uses Export-Excel with an open package to apply the format and save and open the file.
```
> EXAMPLE 2

```PowerShell
PS\> $ct  = New-ConditionalText -Text "Ferrari"
PS\> $ct2 = New-ConditionalText -Range $worksheet.Names\["FinishPosition"\].Address -ConditionalType LessThanOrEqual -Text 3 -ConditionalTextColor Red -BackgroundColor White
PS\> Export-Excel -ExcelPackage $excel -ConditionalText $ct,$ct2 -show
This builds on the previous example, and specifies a condition of \&lt;=3 with a format of red text on a white background; this applies to a named range "Finish Position".

The range could be written -Range "C:C" to specify a named column, or -Range "C2:C102" to specify certain cells in the column.
```

---

### Parameters
#### **Text**
The text (or other value) to use in the rule. Note that Equals, GreaterThan/LessThan rules require text to wrapped in double quotes.

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[Object]`|false   |1       |False        |ConditionValue|

#### **ConditionalTextColor**
The font color for the cell - by default: "DarkRed".

|Type      |Required|Position|PipelineInput|Aliases        |
|----------|--------|--------|-------------|---------------|
|`[Object]`|false   |2       |False        |ForeGroundColor|

#### **BackgroundColor**
The fill color for the cell - by default: "LightPink".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |False        |

#### **Range**
The range of cells that the conditional format applies to; if none is specified the range will be apply to all the data in the sheet.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |False        |

#### **PatternType**
The background pattern for the cell - by default: "Solid"
Valid Values:

* None
* Solid
* DarkGray
* MediumGray
* LightGray
* Gray125
* Gray0625
* DarkVertical
* DarkHorizontal
* DarkDown
* DarkUp
* DarkGrid
* DarkTrellis
* LightVertical
* LightHorizontal
* LightDown
* LightUp
* LightGrid
* LightTrellis

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[ExcelFillStyle]`|false   |5       |False        |

#### **ConditionalType**
One of the supported rules; by default "ContainsText" is selected.
Valid Values:

* LessThan
* LessThanOrEqual
* GreaterThan
* GreaterThanOrEqual
* Equal
* NotEqual
* Top
* TopPercent
* Bottom
* BottomPercent
* ContainsText
* NotContainsText
* BeginsWith
* EndsWith
* ContainsBlanks
* NotContainsBlanks
* ContainsErrors
* NotContainsErrors
* DuplicateValues
* UniqueValues
* Tomorrow
* Today
* Yesterday
* Last7Days
* NextWeek
* ThisWeek
* LastWeek
* NextMonth
* ThisMonth
* LastMonth
* AboveAverage
* AboveOrEqualAverage
* BelowAverage
* BelowOrEqualAverage
* Expression

|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[Object]`|false   |6       |False        |RuleType|

---

### Notes

---

### Syntax
```PowerShell
New-ConditionalText [[-Text] <Object>] [[-ConditionalTextColor] <Object>] [[-BackgroundColor] <Object>] [[-Range] <String>] [[-PatternType] {None | Solid | DarkGray | MediumGray | LightGray | Gray125 | Gray0625 | DarkVertical | DarkHorizontal | DarkDown | DarkUp | DarkGrid | DarkTrellis | LightVertical | LightHorizontal | LightDown | LightUp | LightGrid | LightTrellis}] [[-ConditionalType] <Object>] [<CommonParameters>]
```
