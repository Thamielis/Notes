New-HTMLTable
-------------

### Synopsis

New-HTMLTable [[-HTML] <scriptblock>] [[-PreContent] <scriptblock>] [[-PostContent] <scriptblock>] [-DataTable <array>] [-Title <string>] [-Buttons <string[]>] [-PagingStyle <string[]>] [-PagingOptions <int[]>] [-PagingLength <int>] [-DisablePaging] [-DisableOrdering] [-DisableInfo] [-HideFooter] [-HideButtons] [-DisableProcessing] [-DisableResponsiveTable] [-DisableSelect] [-DisableStateSave] [-DisableSearch] [-OrderMulti] [-Filtering] [-FilteringLocation <string>] [-Style <string[]>] [-Simplify] [-TextWhenNoData <string>] [-ScreenSizePercent <int>] [-DefaultSortColumn <string[]>] [-DefaultSortIndex <int[]>] [-DefaultSortOrder <string[]>] [-DateTimeSortingFormat <string[]>] [-Find <string>] [-InvokeHTMLTags] [-DisableNewLine] [-EnableKeys] [-EnableColumnReorder] [-EnableRowReorder] [-EnableAutoFill] [-EnableScroller] [-ScrollX] [-ScrollY] [-ScrollSizeY <int>] [-ScrollCollapse] [-FreezeColumnsLeft <int>] [-FreezeColumnsRight <int>] [-FixedHeader] [-FixedFooter] [-ResponsivePriorityOrder <string[]>] [-ResponsivePriorityOrderIndex <int[]>] [-PriorityProperties <string[]>] [-IncludeProperty <string[]>] [-ExcludeProperty <string[]>] [-ImmediatelyShowHiddenDetails] [-HideShowButton] [-AllProperties] [-SkipProperties] [-Compare] [-CompareNames <array>] [-HighlightDifferences] [-First <int>] [-Last <int>] [-CompareReplace <array>] [-SearchRegularExpression] [-WordBreak <string>] [-AutoSize] [-DisableAutoWidthOptimization] [-SearchPane] [-SearchPaneLocation <string>] [-SearchBuilder] [-SearchBuilderLocation <string>] [-DataStore <string>] [-DataTableID <string>] [-DataStoreID <string>] [-Transpose] [-OverwriteDOM <string>] [-SearchHighlight] [-AlphabetSearch] [-FuzzySearch] [-FuzzySearchSmartToggle] [-FlattenObject] [-FlattenDepth <int>] [<CommonParameters>]

---

### Description

---

### Parameters
#### **AllProperties**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **AlphabetSearch**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **AutoSize**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

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
* columnVisibility

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |Named   |false        |

#### **Compare**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **CompareNames**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[array]`|false   |Named   |false        |

#### **CompareReplace**

|Type     |Required|Position|PipelineInput|Aliases|
|---------|--------|--------|-------------|-------|
|`[array]`|false   |Named   |false        |Replace|

#### **DataStore**

Valid Values:

* HTML
* JavaScript
* AjaxJSON

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **DataStoreID**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **DataTable**

|Type     |Required|Position|PipelineInput|Aliases                            |
|---------|--------|--------|-------------|-----------------------------------|
|`[array]`|false   |Named   |false        |ArrayOfObjects<br/>Object<br/>Table|

#### **DataTableID**

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[string]`|false   |Named   |false        |DataTableName|

#### **DateTimeSortingFormat**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |Named   |false        |

#### **DefaultSortColumn**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |Named   |false        |

#### **DefaultSortIndex**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[int[]]`|false   |Named   |false        |

#### **DefaultSortOrder**

Valid Values:

* Ascending
* Descending

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |Named   |false        |

#### **DisableAutoWidthOptimization**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **DisableInfo**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **DisableNewLine**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **DisableOrdering**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **DisablePaging**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **DisableProcessing**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **DisableResponsiveTable**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **DisableSearch**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **DisableSelect**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **DisableStateSave**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **EnableAutoFill**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **EnableColumnReorder**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **EnableKeys**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **EnableRowReorder**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **EnableScroller**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **ExcludeProperty**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |Named   |false        |

#### **Filtering**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **FilteringLocation**

Valid Values:

* Top
* Bottom
* Both

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **Find**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[string]`|false   |Named   |false        |Search |

#### **First**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |Named   |false        |

#### **FixedFooter**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **FixedHeader**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **FlattenDepth**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |Named   |false        |

#### **FlattenObject**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **FreezeColumnsLeft**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |Named   |false        |

#### **FreezeColumnsRight**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |Named   |false        |

#### **FuzzySearch**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **FuzzySearchSmartToggle**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **HTML**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[scriptblock]`|false   |0       |false        |

#### **HideButtons**

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[switch]`|false   |Named   |false        |DisableButtons|

#### **HideFooter**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **HideShowButton**

|Type      |Required|Position|PipelineInput|Aliases         |
|----------|--------|--------|-------------|----------------|
|`[switch]`|false   |Named   |false        |RemoveShowButton|

#### **HighlightDifferences**

|Type      |Required|Position|PipelineInput|Aliases          |
|----------|--------|--------|-------------|-----------------|
|`[switch]`|false   |Named   |false        |CompareWithColors|

#### **ImmediatelyShowHiddenDetails**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **IncludeProperty**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |Named   |false        |

#### **InvokeHTMLTags**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Last**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |Named   |false        |

#### **OrderMulti**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **OverwriteDOM**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **PagingLength**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |Named   |false        |

#### **PagingOptions**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[int[]]`|false   |Named   |false        |

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
|`[string[]]`|false   |Named   |false        |

#### **PostContent**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[scriptblock]`|false   |2       |false        |

#### **PreContent**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[scriptblock]`|false   |1       |false        |

#### **PriorityProperties**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |Named   |false        |

#### **ResponsivePriorityOrder**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |Named   |false        |

#### **ResponsivePriorityOrderIndex**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[int[]]`|false   |Named   |false        |

#### **ScreenSizePercent**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |Named   |false        |

#### **ScrollCollapse**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **ScrollSizeY**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |Named   |false        |

#### **ScrollX**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **ScrollY**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **SearchBuilder**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **SearchBuilderLocation**

Valid Values:

* top
* bottom

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **SearchHighlight**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **SearchPane**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **SearchPaneLocation**

Valid Values:

* top
* bottom

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **SearchRegularExpression**

|Type      |Required|Position|PipelineInput|Aliases          |
|----------|--------|--------|-------------|-----------------|
|`[switch]`|false   |Named   |false        |RegularExpression|

#### **Simplify**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **SkipProperties**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

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
|`[string[]]`|false   |Named   |false        |

#### **TextWhenNoData**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **Title**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **Transpose**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **WordBreak**

Valid Values:

* normal
* break-all
* keep-all
* break-word

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Syntax
```PowerShell
syntaxItem
```
```PowerShell
----------
```
```PowerShell
{@{name=New-HTMLTable; CommonParameters=True; parameter=System.Object[]}}
```
