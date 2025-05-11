Out-HtmlView
------------

### Synopsis
Small function that allows to send output to HTML

---

### Description

Small function that allows to send output to HTML. When displaying in HTML it allows data to output to EXCEL, CSV and PDF. It allows sorting, searching and so on.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-Process | Select-Object -First 5 | Out-HtmlView
```

---

### Parameters
#### **HTML**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **PreContent**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |2       |false        |

#### **PostContent**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |3       |false        |

#### **Table**
Data you want to display

|Type      |Required|Position|PipelineInput |Aliases                                |
|----------|--------|--------|--------------|---------------------------------------|
|`[Object]`|false   |named   |true (ByValue)|ArrayOfObjects<br/>Object<br/>DataTable|

#### **FilePath**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Title**
Title of HTML Window

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **PassThru**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Buttons**

Valid Values:

* copyHtml5
* excelHtml5
* csvHtml5
* pdfHtml5
* pageLength
* print
* searchPanes
* searchBuilder

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **PagingStyle**

Valid Values:

* numbers
* simple
* simple_numbers
* full
* full_numbers
* first_last_numbers

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **PagingOptions**

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |named   |false        |

#### **PagingLength**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **DisablePaging**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableOrdering**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableInfo**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **HideFooter**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **HideButtons**

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[Switch]`|false   |named   |false        |DisableButtons|

#### **DisableProcessing**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableResponsiveTable**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableSelect**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableStateSave**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableSearch**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **OrderMulti**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Filtering**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **FilteringLocation**

Valid Values:

* Top
* Bottom
* Both

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Style**

Valid Values:

* display
* cell-border
* compact
* hover
* nowrap
* order-column
* row-border
* stripe

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Simplify**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **TextWhenNoData**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ScreenSizePercent**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **DefaultSortColumn**
Sort by Column Name

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **DefaultSortIndex**
Sort by Column Index

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |named   |false        |

#### **DefaultSortOrder**

Valid Values:

* Ascending
* Descending

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DateTimeSortingFormat**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Find**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |Search |

#### **InvokeHTMLTags**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableNewLine**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EnableKeys**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EnableColumnReorder**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EnableRowReorder**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EnableAutoFill**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EnableScroller**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ScrollX**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ScrollY**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ScrollSizeY**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **ScrollCollapse**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **FreezeColumnsLeft**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **FreezeColumnsRight**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **FixedHeader**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **FixedFooter**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ResponsivePriorityOrder**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **ResponsivePriorityOrderIndex**

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |named   |false        |

#### **PriorityProperties**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **IncludeProperty**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **ExcludeProperty**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **ImmediatelyShowHiddenDetails**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **HideShowButton**

|Type      |Required|Position|PipelineInput|Aliases         |
|----------|--------|--------|-------------|----------------|
|`[Switch]`|false   |named   |false        |RemoveShowButton|

#### **AllProperties**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SkipProperties**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Compare**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **HighlightDifferences**

|Type      |Required|Position|PipelineInput|Aliases          |
|----------|--------|--------|-------------|-----------------|
|`[Switch]`|false   |named   |false        |CompareWithColors|

#### **CompareNames**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Array]`|false   |named   |false        |

#### **First**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Last**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **CompareReplace**

|Type     |Required|Position|PipelineInput|Aliases|
|---------|--------|--------|-------------|-------|
|`[Array]`|false   |named   |false        |Replace|

#### **SearchRegularExpression**

|Type      |Required|Position|PipelineInput|Aliases          |
|----------|--------|--------|-------------|-----------------|
|`[Switch]`|false   |named   |false        |RegularExpression|

#### **WordBreak**

Valid Values:

* normal
* break-all
* keep-all
* break-word

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AutoSize**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableAutoWidthOptimization**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SearchPane**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SearchPaneLocation**

Valid Values:

* top
* bottom

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **SearchBuilder**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SearchBuilderLocation**

Valid Values:

* top
* bottom

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DataStore**

Valid Values:

* HTML
* JavaScript
* AjaxJSON

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Transpose**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **TransposeProperty**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TransposeName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TransposeLegacy**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PreventShowHTML**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Online**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **OverwriteDOM**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **SearchHighlight**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AlphabetSearch**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **FuzzySearch**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **FuzzySearchSmartToggle**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **FlattenObject**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PrettifyObject**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PrettifyObjectSeparator**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **PrettifyObjectDateTimeFormat**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Out-HtmlView [[-HTML] <ScriptBlock>] [[-PreContent] <ScriptBlock>] [[-PostContent] <ScriptBlock>] [-Table <Object>] [-FilePath <String>] [-Title <String>] [-PassThru] [-Buttons <String[]>] [-PagingStyle <String[]>] [-PagingOptions <Int32[]>] [-PagingLength <Int32>] [-DisablePaging] [-DisableOrdering] [-DisableInfo] [-HideFooter] [-HideButtons] [-DisableProcessing] [-DisableResponsiveTable] [-DisableSelect] [-DisableStateSave] [-DisableSearch] [-OrderMulti] [-Filtering] [-FilteringLocation <String>] [-Style <String[]>] [-Simplify] [-TextWhenNoData <String>] [-ScreenSizePercent <Int32>] [-DefaultSortColumn <String[]>] [-DefaultSortIndex <Int32[]>] [-DefaultSortOrder <String>] [-DateTimeSortingFormat <String[]>] [-Find <String>] [-InvokeHTMLTags] [-DisableNewLine] [-EnableKeys] [-EnableColumnReorder] [-EnableRowReorder] [-EnableAutoFill] [-EnableScroller] [-ScrollX] [-ScrollY] [-ScrollSizeY <Int32>] [-ScrollCollapse] [-FreezeColumnsLeft <Int32>] [-FreezeColumnsRight <Int32>] [-FixedHeader] [-FixedFooter] [-ResponsivePriorityOrder <String[]>] [-ResponsivePriorityOrderIndex <Int32[]>] [-PriorityProperties <String[]>] [-IncludeProperty <String[]>] [-ExcludeProperty <String[]>] [-ImmediatelyShowHiddenDetails] [-HideShowButton] [-AllProperties] [-SkipProperties] [-Compare] [-HighlightDifferences] [-CompareNames <Array>] [-First <Int32>] [-Last <Int32>] [-CompareReplace <Array>] [-SearchRegularExpression] [-WordBreak <String>] [-AutoSize] [-DisableAutoWidthOptimization] [-SearchPane] [-SearchPaneLocation <String>] [-SearchBuilder] [-SearchBuilderLocation <String>] [-DataStore <String>] [-Transpose] [-TransposeProperty <String>] [-TransposeName <String>] [-TransposeLegacy] [-PreventShowHTML] [-Online] [-OverwriteDOM <String>] [-SearchHighlight] [-AlphabetSearch] [-FuzzySearch] [-FuzzySearchSmartToggle] [-FlattenObject] [-PrettifyObject] [-PrettifyObjectSeparator <String>] [-PrettifyObjectDateTimeFormat <String>] [<CommonParameters>]
```
