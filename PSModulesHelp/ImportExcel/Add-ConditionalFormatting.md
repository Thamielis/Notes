Add-ConditionalFormatting
-------------------------

### Synopsis
Adds conditional formatting to all or part of a worksheet.

---

### Description

Conditional formatting allows Excel to:

* Mark cells with icons depending on their value

* Show a databar whose length indicates the value or a two or three color scale where the color indicates the relative value

* Change the color, font, or number format of cells which meet given criteria

Add-ConditionalFormatting allows these parameters to be set; for fine tuning of the rules, the -PassThru switch will return the rule so that you can modify things which are specific to that type of rule, example, the values which correspond to each icon in an Icon-Set.

---

### Related Links
* [Online Version:](Online Version:)

---

### Examples
> EXAMPLE 1

```PowerShell
PS\> $excel = $avdata | Export-Excel -Path (Join-path $FilePath "\Machines.XLSX" ) -WorksheetName "Server Anti-Virus" -AutoSize -FreezeTopRow -AutoFilter -PassThru
     Add-ConditionalFormatting -WorkSheet $excel.Workbook.Worksheets[1] -Address "b2:b1048576" -ForeGroundColor "RED"     -RuleType ContainsText -ConditionValue "2003"
     Add-ConditionalFormatting -WorkSheet $excel.Workbook.Worksheets[1] -Address "i2:i1048576" -ForeGroundColor "RED"     -RuleType ContainsText -ConditionValue "Disabled"
     $excel.Workbook.Worksheets[1].Cells["D1:G1048576"].Style.Numberformat.Format = [cultureinfo]::CurrentCulture.DateTimeFormat.ShortDatePattern
     $excel.Workbook.Worksheets[1].Row(1).style.font.bold = $true
     $excel.Save() ; $excel.Dispose()
Here Export-Excel is called with the -PassThru parameter, so the ExcelPackage object representing Machines.XLSX is stored in $Excel.The desired worksheet is selected, and then columns" B" and "I" are conditionally formatted (excluding the top row) to show red text if they contain "2003" or "Disabled" respectively.

A fixed date format is then applied to columns D to G, and the top row is formatted.

Finally the workbook is saved and the Excel package object is closed.
```
> EXAMPLE 2

```PowerShell
PS\> $r = Add-ConditionalFormatting -WorkSheet $excel.Workbook.Worksheets[1] -Range "B1:B100" -ThreeIconsSet Flags -Passthru
     $r.Reverse = $true ;   $r.Icon1.Type = "Num"; $r.Icon2.Type = "Num" ; $r.Icon2.value = 100 ; $r.Icon3.type = "Num" ;$r.Icon3.value = 1000
Again Export-Excel has been called with -PassThru leaving a package object in $Excel.

This time B1:B100 has been conditionally formatted with 3 icons, using the "Flags" Icon-Set.

Add-ConditionalFormatting does not provide accessto every option in the formatting rule, so -PassThru has been used and the rule is modified to apply the flags in reverse order, and transitions between flags are set to 100 and 1000.
```
> EXAMPLE 3

```PowerShell
PS\> Add-ConditionalFormatting -WorkSheet $sheet -Range "D2:D1048576" -DataBarColor Red
This time $sheet holds an ExcelWorkshseet object and databars are added to column D, excluding the top row.
```
> EXAMPLE 4

PS\> Add-ConditionalFormatting -Address $worksheet.cells["FinishPosition"] -RuleType Equal -ConditionValue 1 -ForeGroundColor Purple -Bold -Priority 1 -StopIfTrue
In this example a named range is used to select the cells where the condition should apply, and instead of specifying a sheet and range within the sheet as separate parameters, the cells where the format should apply are specified directly.

If a cell in the "FinishPosition" range is 1, then the text is turned to Bold & Purple.

This rule is moved to first in the priority list, and where cells have a value of 1, no other rules will be processed.
> EXAMPLE 5

PS\> $excel = Get-ChildItem | Select-Object -Property Name,Length,LastWriteTime,CreationTime | Export-Excel "$env:temp\test43.xlsx" -PassThru -AutoSize
     $ws = $excel.Workbook.Worksheets["Sheet1"]
     $ws.Cells["E1"].Value = "SavedAt"
     $ws.Cells["F1"].Value = [datetime]::Now
     $ws.Cells["F1"].Style.Numberformat.Format = (Expand-NumberFormat -NumberFormat 'Date-Time')
     $lastRow = $ws.Dimension.End.Row
     Add-ConditionalFormatting -WorkSheet $ws -address "A2:A$Lastrow" -RuleType LessThan    -ConditionValue "A"  -ForeGroundColor Gray
     Add-ConditionalFormatting -WorkSheet $ws -address "B2:B$Lastrow" -RuleType GreaterThan -ConditionValue  1000000         -NumberFormat '#,###,,.00"M"'
     Add-ConditionalFormatting -WorkSheet $ws -address "C2:C$Lastrow" -RuleType GreaterThan -ConditionValue "=INT($F$1-7)"  -ForeGroundColor Green  -StopIfTrue
     Add-ConditionalFormatting -WorkSheet $ws -address "D2:D$Lastrow" -RuleType Equal       -ConditionValue "=C2"           -ForeGroundColor Blue   -StopIfTrue
     Close-ExcelPackage -Show $excel
The first few lines of code export a list of file and directory names, sizes and dates to a spreadsheet.

It puts the date of the export in cell F1.

The first Conditional format changes the color of files and folders that begin with a ".", "_" or anything else which sorts before "A".

The second Conditional format changes the Number format of numbers bigger than 1 million, for example 1,234,567,890 will dispay as "1,234.57M"

The third highlights datestamps of files less than a week old when the export was run; the = is necessary in the condition value otherwise the rule will look for the the text INT($F$1-7), and the cell address for the date is fixed using the standard Excel $ notation.

The final Conditional format looks for files which have not changed since they were created. Here the condition value is "=C2". The = sign means C2 is treated as a formula, not literal text. Unlike the file age, we want the cell used to change for each cell where the conditional format applies.

The first cell in the conditional format range is D2, which is compared against C2, then D3 is compared against C3 and so on. A common mistake is to include the title row in the range and accidentally apply conditional formatting to it, or to begin the range at row 2 but use row 1 as the starting point for comparisons.
> EXAMPLE 6

```PowerShell
PS\> Add-ConditionalFormatting  $ws.Cells["B:B"] GreaterThan 10000000 -Fore  Red -Stop -Pri 1
This version shows the shortest syntax - the Address, Ruletype, and Conditionvalue can be identified from their position, and ForegroundColor, StopIfTrue and Priority can all be shortend.
```

---

### Parameters
#### **Address**
A block of cells to format - you can use a named range with -Address $ws.names[1] or $ws.cells["RangeName"]

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Object]`|true    |1       |False        |Range  |

#### **WorkSheet**
The worksheet where the format is to be applied

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[ExcelWorksheet]`|false   |named   |False        |

#### **RuleType**
A standard named-rule - Top / Bottom / Less than / Greater than / Contains etc.
Valid Values:

* AboveAverage
* AboveOrEqualAverage
* BelowAverage
* BelowOrEqualAverage
* AboveStdDev
* BelowStdDev
* Bottom
* BottomPercent
* Top
* TopPercent
* Last7Days
* LastMonth
* LastWeek
* NextMonth
* NextWeek
* ThisMonth
* ThisWeek
* Today
* Tomorrow
* Yesterday
* BeginsWith
* Between
* ContainsBlanks
* ContainsErrors
* ContainsText
* DuplicateValues
* EndsWith
* Equal
* Expression
* GreaterThan
* GreaterThanOrEqual
* LessThan
* LessThanOrEqual
* NotBetween
* NotContains
* NotContainsBlanks
* NotContainsErrors
* NotContainsText
* NotEqual
* UniqueValues
* ThreeColorScale
* TwoColorScale
* ThreeIconSet
* FourIconSet
* FiveIconSet
* DataBar

|Type                                   |Required|Position|PipelineInput|
|---------------------------------------|--------|--------|-------------|
|`[eExcelConditionalFormattingRuleType]`|true    |2       |False        |

#### **ForegroundColor**
Text color for matching objects

|Type      |Required|Position|PipelineInput|Aliases                       |
|----------|--------|--------|-------------|------------------------------|
|`[Object]`|false   |named   |False        |ForegroundColour<br/>FontColor|

#### **DataBarColor**
Color for databar type charts

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[Object]`|true    |named   |False        |DataBarColour|

#### **ThreeIconsSet**
One of the three-icon set types (e.g. Traffic Lights)
Valid Values:

* Arrows
* ArrowsGray
* Flags
* Signs
* Symbols
* Symbols2
* TrafficLights1
* TrafficLights2

|Type                                        |Required|Position|PipelineInput|
|--------------------------------------------|--------|--------|-------------|
|`[eExcelconditionalFormatting3IconsSetType]`|true    |named   |False        |

#### **FourIconsSet**
A four-icon set name
Valid Values:

* Arrows
* ArrowsGray
* Rating
* RedToBlack
* TrafficLights

|Type                                        |Required|Position|PipelineInput|
|--------------------------------------------|--------|--------|-------------|
|`[eExcelconditionalFormatting4IconsSetType]`|true    |named   |False        |

#### **FiveIconsSet**
A five-icon set name
Valid Values:

* Arrows
* ArrowsGray
* Quarters
* Rating

|Type                                        |Required|Position|PipelineInput|
|--------------------------------------------|--------|--------|-------------|
|`[eExcelconditionalFormatting5IconsSetType]`|true    |named   |False        |

#### **Reverse**
Use the Icon-Set in reverse order, or reverse the orders of Two- & Three-Color Scales

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ConditionValue**
A value for the condition (for example 2000 if the test is 'lessthan 2000'; Formulas should begin with "=" )

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |False        |

#### **ConditionValue2**
A second value for the conditions like "Between X and Y"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |False        |

#### **BackgroundColor**
Background color for matching items

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **BackgroundPattern**
Background pattern for matching items
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
|`[ExcelFillStyle]`|false   |named   |False        |

#### **PatternColor**
Secondary color when a background pattern requires it

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **NumberFormat**
Sets the numeric format for matching items

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **Bold**
Put matching items in bold face

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Italic**
Put matching items in italic

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Underline**
Underline matching items

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **StrikeThru**
Strikethrough text of matching items

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **StopIfTrue**
Prevent the processing of subsequent rules

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Priority**
Set the sequence for rule processing

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **PassThru**
If specified pass the rule back to the caller to allow additional customization.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Notes

---

### Syntax
```PowerShell
Add-ConditionalFormatting [-Address] <Object> [-RuleType] {AboveAverage | AboveOrEqualAverage | BelowAverage | BelowOrEqualAverage | AboveStdDev | BelowStdDev | Bottom | BottomPercent | Top | TopPercent | Last7Days | LastMonth | LastWeek | NextMonth | NextWeek | ThisMonth | ThisWeek | Today | Tomorrow | Yesterday | BeginsWith | Between | ContainsBlanks | ContainsErrors | ContainsText | DuplicateValues | EndsWith | Equal | Expression | GreaterThan | GreaterThanOrEqual | LessThan | LessThanOrEqual | NotBetween | NotContains | NotContainsBlanks | NotContainsErrors | NotContainsText | NotEqual | UniqueValues | ThreeColorScale | TwoColorScale | ThreeIconSet | FourIconSet | FiveIconSet | DataBar} [[-ConditionValue] <Object>] [[-ConditionValue2] <Object>] [-WorkSheet <ExcelWorksheet>] [-ForegroundColor <Object>] [-Reverse] [-BackgroundColor <Object>] [-BackgroundPattern {None | Solid | DarkGray | MediumGray | LightGray | Gray125 | Gray0625 | DarkVertical | DarkHorizontal | DarkDown | DarkUp | DarkGrid | DarkTrellis | LightVertical | LightHorizontal | LightDown | LightUp | LightGrid | LightTrellis}] [-PatternColor <Object>] [-NumberFormat <Object>] [-Bold] [-Italic] [-Underline] [-StrikeThru] [-StopIfTrue] [-Priority <Int32>] [-PassThru] [<CommonParameters>]
```
```PowerShell
Add-ConditionalFormatting [-Address] <Object> [-WorkSheet <ExcelWorksheet>] -DataBarColor <Object> [-Priority <Int32>] [-PassThru] [<CommonParameters>]
```
```PowerShell
Add-ConditionalFormatting [-Address] <Object> [-WorkSheet <ExcelWorksheet>] -ThreeIconsSet {Arrows | ArrowsGray | Flags | Signs | Symbols | Symbols2 | TrafficLights1 | TrafficLights2} [-Reverse] [-Priority <Int32>] [-PassThru] [<CommonParameters>]
```
```PowerShell
Add-ConditionalFormatting [-Address] <Object> [-WorkSheet <ExcelWorksheet>] -FourIconsSet {Arrows | ArrowsGray | Rating | RedToBlack | TrafficLights} [-Reverse] [-Priority <Int32>] [-PassThru] [<CommonParameters>]
```
```PowerShell
Add-ConditionalFormatting [-Address] <Object> [-WorkSheet <ExcelWorksheet>] -FiveIconsSet {Arrows | ArrowsGray | Quarters | Rating} [-Reverse] [-Priority <Int32>] [-PassThru] [<CommonParameters>]
```
