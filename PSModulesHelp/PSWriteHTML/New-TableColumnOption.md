New-TableColumnOption
---------------------

### Synopsis
Allows for certain modification of options within DataTable's columnDefs parameter. You can set visibility, searchability, sortability, and width for specific columns

---

### Description

Allows for certain modification of options within DataTable's columnDefs parameter.
See: https://datatables.net/reference/option/columnDefs

New-HTMLTable has parameters for -ResponsivePriorityOrder and -ResponsivePriorityOrderIndex and these are set at a higher precedent than options specified here.
See the DataTable reference section for conflict resolution.

The New-TableColumnOption cmdlet will add entries to the columnDefs parameter in the order in which the cmdlets are ordered.
If you use 2 or more New-TableColumnOption, the first cmdlet takes priority over the second cmdlet if they specify the same targets or overriding property values
With this in mind, you should almost always specify -AllColumns last, since that will take priority over any commands issued later

---

### Examples
> EXAMPLE 1

```PowerShell
New-TableColumnOption -ColumnIndex (0..4) -Width 50
The first 5 columns with have a width defined as 50, this may not be exact.
See: https://datatables.net/reference/option/columns.width
```
> EXAMPLE 2

New-TableColumnOption -ColumnIndex 0,1,2 -Hidden $false
New-TableColumnOption -ColumnIndex 1 -Sortable $true
New-TableColumnOption -AllColumns -Hidden $true -Searchable $false -Sortable $false
All columns will be hidden, not searchable, and not sortable
However, since there is a option specified higher up, the first 3 columns will be visible
Additionally the 2nd column will be sortable

---

### Parameters
#### **ColumnIndex**
Identifies specific columns that the properties should apply to

|Type       |Required|Position|PipelineInput|Aliases|
|-----------|--------|--------|-------------|-------|
|`[Int32[]]`|true    |named   |false        |Targets|

#### **AllColumns**
Uses the columnDef Target "_ALL" to indicate all columns / remaining columns

|Type      |Required|Position|PipelineInput|Aliases                 |
|----------|--------|--------|-------------|------------------------|
|`[Switch]`|true    |named   |false        |AllTargets<br/>TargetAll|

#### **Width**
Width for the column as a string

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Hidden**
Defines if a column is hidden. A hidden column can still be used by Conditional Formatting and can still be searchable

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **Searchable**
Defines if a column is able to be searched

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **Sortable**
Defines if a column can be sorted

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

---

### Inputs
None. You cannot pipe objects to New-TableColumnOption

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Notes
The New-HTMLTable cmdlet has -ResponsivePriorityOrder and -ResponsivePriorityOrderIndex that also modifes the columnDefs option in DataTable

---

### Syntax
```PowerShell
New-TableColumnOption -ColumnIndex <Int32[]> [-Width <String>] [-Hidden <Boolean>] [-Searchable <Boolean>] [-Sortable <Boolean>] [<CommonParameters>]
```
```PowerShell
New-TableColumnOption -AllColumns [-Width <String>] [-Hidden <Boolean>] [-Searchable <Boolean>] [-Sortable <Boolean>] [<CommonParameters>]
```
