New-TableRowGrouping
--------------------

### Synopsis
Creates a new table row grouping object with specified attributes.

---

### Description

This function creates a new table row grouping object with the provided attributes. It enables the feature for DataTablesRowGrouping in the HTML schema.

---

### Examples
> EXAMPLE 1

```PowerShell
New-TableRowGrouping -Name "Group A" -ColumnID 1 -SortOrder 'Ascending' -Color 'Red' -BackgroundColor 'LightGray'
Creates a new table row grouping object for Group A, grouping by column ID 1 in ascending order with red text and light gray background.
```
> EXAMPLE 2

```PowerShell
New-TableRowGrouping -Name "Group B" -ColumnID 2 -SortOrder 'Descending' -Color 'Blue' -BackgroundColor 'White'
Creates a new table row grouping object for Group B, grouping by column ID 2 in descending order with blue text and white background.
```

---

### Parameters
#### **Name**
Specifies the name of the row grouping.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |1       |false        |ColumnName|

#### **ColumnID**
Specifies the ID of the column to group rows by. Default value is -1.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |false        |

#### **SortOrder**
Specifies the sort order for the grouped rows. Valid values are 'Ascending' or 'Descending'. Default is 'Ascending'.
Valid Values:

* Ascending
* Descending

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Color**
Specifies the color for the row grouping.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **BackgroundColor**
Specifies the background color for the row grouping.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

---

### Syntax
```PowerShell
New-TableRowGrouping [[-Name] <String>] [[-ColumnID] <Int32>] [[-SortOrder] <String>] [[-Color] <String>] [[-BackgroundColor] <String>] [<CommonParameters>]
```
