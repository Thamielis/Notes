New-HTMLTable
-------------

### Synopsis
Creates a new HTML table with various customization options.

---

### Description

This function generates an HTML table based on the provided data and allows for extensive customization using a wide range of parameters.

---

### Examples
> EXAMPLE 1

```PowerShell
$data = @(
    [PSCustomObject]@{ Name = 'John'; Age = 30 },
    [PSCustomObject]@{ Name = 'Jane'; Age = 25 }
)
New-HTMLTable -DataTable $data -Title 'User Information' -Buttons @('copyHtml5', 'excelHtml5') -PagingStyle 'full_numbers' -PagingOptions @(10, 25, 50) -DefaultSortColumn @('Name') -DefaultSortOrder @('Ascending')
```

---

### Parameters
#### **HTML**
The HTML content to be included before the table.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **PreContent**
Additional content to be included before the table.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |2       |false        |

#### **PostContent**
Additional content to be included after the table.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |3       |false        |

#### **DataTable**
An array of objects containing the data to be displayed in the table.

|Type     |Required|Position|PipelineInput|Aliases                            |
|---------|--------|--------|-------------|-----------------------------------|
|`[Array]`|false   |named   |false        |ArrayOfObjects<br/>Object<br/>Table|

#### **Title**
The title of the HTML table.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Buttons**
An array of buttons to be displayed in the table for actions like copying, exporting, and printing.
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
|`[String[]]`|false   |named   |false        |

#### **PagingStyle**
The style of pagination to be used in the table.
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
An array of options for the number of items to display per page.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |named   |false        |

#### **PagingLength**
The default number of items to display per page.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **DisablePaging**
Disables pagination in the table.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableOrdering**
Disables column ordering in the table.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableInfo**
Disables information display at the bottom of the table.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **HideFooter**
Hides the footer of the table.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **HideButtons**
Hides all buttons in the table.

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[Switch]`|false   |named   |false        |DisableButtons|

#### **DisableProcessing**
Disables processing indicator in the table.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableResponsiveTable**
Disables responsiveness of the table.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableSelect**
Disables row selection in the table.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableStateSave**
Disables saving the state of the table.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableSearch**
Disables search functionality in the table.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **OrderMulti**
Allows multiple column ordering in the table.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Filtering**
Enables filtering in the table.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **FilteringLocation**
Specifies the location of the filter (Top, Bottom, Both).
Valid Values:

* Top
* Bottom
* Both

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Style**
An array of styles to apply to the table.
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
Simplifies the table layout.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **TextWhenNoData**
The text to display when no data is available.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ScreenSizePercent**
The percentage of the screen width to occupy.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **DefaultSortColumn**
An array of default columns to sort by.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **DefaultSortIndex**
An array of default column indexes to sort by.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |named   |false        |

#### **DefaultSortOrder**
The default sort order (Ascending, Descending).
Valid Values:

* Ascending
* Descending

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **DateTimeSortingFormat**
An array of date-time formats for sorting.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Find**
Search string to find in the table.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |Search |

#### **InvokeHTMLTags**
Enables HTML tags in the table.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableNewLine**
Disables new line characters in the table.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EnableKeys**
Enables keyboard navigation in the table.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EnableColumnReorder**
Enables column reordering in the table.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EnableRowReorder**
Enables row reordering in the table.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EnableAutoFill**
Enables auto-filling in the table.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EnableScroller**
Enables table scrolling.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ScrollX**
Enables horizontal scrolling.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ScrollY**
Enables vertical scrolling.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ScrollSizeY**
The height of the vertical scroll.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **ScrollCollapse**
Collapses the table when scrolling.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **FreezeColumnsLeft**
The number of columns to freeze on the left.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **FreezeColumnsRight**
The number of columns to freeze on the right.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **FixedHeader**
Fixes the header of the table.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **FixedFooter**
Fixes the footer of the table.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ResponsivePriorityOrder**
The priority order for responsiveness.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **ResponsivePriorityOrderIndex**
The index for responsive priority order.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |named   |false        |

#### **PriorityProperties**
Properties to prioritize in the table.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **IncludeProperty**
Properties to include in the table.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **ExcludeProperty**
Properties to exclude from the table.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **ImmediatelyShowHiddenDetails**
Shows hidden details immediately.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **HideShowButton**
Displays a button to show/hide details.

|Type      |Required|Position|PipelineInput|Aliases         |
|----------|--------|--------|-------------|----------------|
|`[Switch]`|false   |named   |false        |RemoveShowButton|

#### **AllProperties**
Displays all properties in the table.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SkipProperties**
Properties to skip in the table.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Compare**
Compares data in the table.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **CompareNames**
Names to compare in the table.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Array]`|false   |named   |false        |

#### **HighlightDifferences**
Highlights differences in the table.

|Type      |Required|Position|PipelineInput|Aliases          |
|----------|--------|--------|-------------|-----------------|
|`[Switch]`|false   |named   |false        |CompareWithColors|

#### **First**
Displays the first item in the table.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Last**
Displays the last item in the table.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **CompareReplace**
Replaces data for comparison.

|Type     |Required|Position|PipelineInput|Aliases|
|---------|--------|--------|-------------|-------|
|`[Array]`|false   |named   |false        |Replace|

#### **SearchRegularExpression**
Enables regular expression search.

|Type      |Required|Position|PipelineInput|Aliases          |
|----------|--------|--------|-------------|-----------------|
|`[Switch]`|false   |named   |false        |RegularExpression|

#### **WordBreak**
Enables word breaking in the table.
Valid Values:

* normal
* break-all
* keep-all
* break-word

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AutoSize**
Automatically sizes the table.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableAutoWidthOptimization**
Disables auto width optimization.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SearchPane**
Enables search pane in the table.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SearchPaneLocation**
Specifies the location of the search pane.
Valid Values:

* top
* bottom

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **SearchBuilder**
Enables search builder in the table.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SearchBuilderLocation**
Specifies the location of the search builder.
Valid Values:

* top
* bottom

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DataStore**
Stores data for the table.
Valid Values:

* HTML
* JavaScript
* AjaxJSON

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DataTableID**
The ID of the data table.

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[String]`|false   |named   |false        |DataTableName|

#### **DataStoreID**
The ID of the data store.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Transpose**
Transpose table. This is useful when you have objects and you want to transpose them.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **TransposeProperty**
Transpose table based on property. By default it's "Object X". This makes sense if you have unique value per object that you want to transpose table based on.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TransposeName**
Name of the column that will be used per object to transpose table. By default it's "Object X", "Object Y", "Object Z" etc.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TransposeLegacy**
Use old method of transposing table. This is useful when you have objects and you want to transpose them, using legacy method.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **OverwriteDOM**
Overwrites the DOM structure.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **SearchHighlight**
Highlights search results.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AlphabetSearch**
Enables alphabet search.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **FuzzySearch**
Enables fuzzy search.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **FuzzySearchSmartToggle**
Toggles smart fuzzy search.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **FlattenObject**
Flattens the object for display.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PrettifyObject**
Forces object to be preprocessed before passing to HTML.
This is useful when converting object with arrays or when there is a need to display DateTime in different format.
This is mostly useful for email tables or when using DataStore HTML.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PrettifyObjectSeparator**
Define separator for prettified array object. Default is ", ".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **PrettifyObjectDateTimeFormat**
DateTime format for prettified object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FlattenDepth**
The depth to flatten the object.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Notes
This function is designed to create customizable HTML tables for various data representation needs.

---

### Syntax
```PowerShell
New-HTMLTable [[-HTML] <ScriptBlock>] [[-PreContent] <ScriptBlock>] [[-PostContent] <ScriptBlock>] [-DataTable <Array>] [-Title <String>] [-Buttons <String[]>] [-PagingStyle <String[]>] [-PagingOptions <Int32[]>] [-PagingLength <Int32>] [-DisablePaging] [-DisableOrdering] [-DisableInfo] [-HideFooter] [-HideButtons] [-DisableProcessing] [-DisableResponsiveTable] [-DisableSelect] [-DisableStateSave] [-DisableSearch] [-OrderMulti] [-Filtering] [-FilteringLocation <String>] [-Style <String[]>] [-Simplify] [-TextWhenNoData <String>] [-ScreenSizePercent <Int32>] [-DefaultSortColumn <String[]>] [-DefaultSortIndex <Int32[]>] [-DefaultSortOrder <String[]>] [-DateTimeSortingFormat <String[]>] [-Find <String>] [-InvokeHTMLTags] [-DisableNewLine] [-EnableKeys] [-EnableColumnReorder] [-EnableRowReorder] [-EnableAutoFill] [-EnableScroller] [-ScrollX] [-ScrollY] [-ScrollSizeY <Int32>] [-ScrollCollapse] [-FreezeColumnsLeft <Int32>] [-FreezeColumnsRight <Int32>] [-FixedHeader] [-FixedFooter] [-ResponsivePriorityOrder <String[]>] [-ResponsivePriorityOrderIndex <Int32[]>] [-PriorityProperties <String[]>] [-IncludeProperty <String[]>] [-ExcludeProperty <String[]>] [-ImmediatelyShowHiddenDetails] [-HideShowButton] [-AllProperties] [-SkipProperties] [-Compare] [-CompareNames <Array>] [-HighlightDifferences] [-First <Int32>] [-Last <Int32>] [-CompareReplace <Array>] [-SearchRegularExpression] [-WordBreak <String>] [-AutoSize] [-DisableAutoWidthOptimization] [-SearchPane] [-SearchPaneLocation <String>] [-SearchBuilder] [-SearchBuilderLocation <String>] [-DataStore <String>] [-DataTableID <String>] [-DataStoreID <String>] [-Transpose] [-TransposeProperty <String>] [-TransposeName <String>] [-TransposeLegacy] [-OverwriteDOM <String>] [-SearchHighlight] [-AlphabetSearch] [-FuzzySearch] [-FuzzySearchSmartToggle] [-FlattenObject] [-PrettifyObject] [-PrettifyObjectSeparator <String>] [-PrettifyObjectDateTimeFormat <String>] [-FlattenDepth <Int32>] [<CommonParameters>]
```
