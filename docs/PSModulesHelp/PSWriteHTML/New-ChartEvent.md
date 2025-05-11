New-ChartEvent
--------------

### Synopsis
Creates a new chart event for a specified DataTable.

---

### Description

This function creates a new chart event for a specified DataTable. It allows for defining events like click, data point selection, and marker click for the chart.

---

### Examples
> EXAMPLE 1

```PowerShell
New-ChartEvent -DataTableID "table1" -ColumnID 1 -EscapeRegex
Creates a new chart event for DataTable with ID "table1" on column 1 with regular expression escaping enabled.
```
> EXAMPLE 2

```PowerShell
New-ChartEvent -DataTableID "table2" -ColumnID 2
Creates a new chart event for DataTable with ID "table2" on column 2 without regular expression escaping.
```

---

### Parameters
#### **DataTableID**
Specifies the ID of the DataTable for which the chart event is being created.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **ColumnID**
Specifies the ID of the column in the DataTable for which the chart event is being created.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |2       |false        |

#### **EscapeRegex**
Indicates whether to escape regular expressions in the chart event.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
New-ChartEvent [-DataTableID] <String> [-ColumnID] <Int32> [-EscapeRegex] [<CommonParameters>]
```
