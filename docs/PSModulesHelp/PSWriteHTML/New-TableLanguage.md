New-TableLanguage
-----------------

### Synopsis
Provides ability to overwrite texts available in the table.

---

### Description

Provides ability to overwrite texts available in the table. This is useful for translating to different languages or choosing different naming.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTML -TitleText "Example41 - Table" -FilePath "$PSScriptRoot\Example41.html" {
    New-HTMLSection -HeaderText "Testing" -HeaderTextAlignment center -Content {
        New-HTMLTable -DataTable $Values {
            New-TableLanguage -Search 'Find' -PaginateFirst 'First Option' -EmptyTable 'No data in the table'
            New-HTMLTableConditionGroup {
                New-HTMLTableCondition -Name 'Test1' -Value 1 -ComparisonType number
                New-HTMLTableCondition -Name 'Test2' -Value 2 -ComparisonType number
            } -BackgroundColor Salmon -FailBackgroundColor Goldenrod -Logic OR -HighlightHeaders 'Test1', 'Test2', 'DisplayName', 'DomainName'
        } -DataStore JavaScript
    }
} -ShowHTML -Online
```

---

### Parameters
#### **Info**
Overwrites information about the table. Default value is: "Showing _START_ to _END_ of _TOTAL_ entries"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **InfoFiltered**
Overwrites information about the table when filtered. Default value is: "(filtered from _MAX_ total entries)"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Search**
Overwrites the search text. Default value is: "Search:"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **EmptyTable**
Overwrites the text when the table is empty. Default value is: "No data available in table"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **ZeroRecords**
Overwrites the text when no records match the search. Default value is: "No matching records found"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **PaginateFirst**
Overwrites the text for the first page button. Default value is: "First"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **PaginateLast**
Overwrites the text for the last page button. Default value is: "Last"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **PaginateNext**
Overwrites the text for the next page button. Default value is: "Next"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |

#### **PaginatePrevious**
Overwrites the text for the previous page button. Default value is: "Previous"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |9       |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
New-TableLanguage [[-Info] <String>] [[-InfoFiltered] <String>] [[-Search] <String>] [[-EmptyTable] <String>] [[-ZeroRecords] <String>] [[-PaginateFirst] <String>] [[-PaginateLast] <String>] [[-PaginateNext] <String>] [[-PaginatePrevious] <String>] [<CommonParameters>]
```
