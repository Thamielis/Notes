New-HTMLSummary
---------------

### Synopsis
Creates a new HTML summary section with customizable content.

---

### Description

The New-HTMLSummary function creates an HTML summary section with customizable content. It allows you to display a summary with a title, additional information, and summary items.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLSummary -SummaryItems {
    "Summary Item 1"
    "Summary Item 2"
} -Title "Summary Title" -TitleRight "Additional Info"
Creates a new HTML summary section with the title "Summary Title", displaying "Summary Item 1" and "Summary Item 2" as summary items, and additional information "Additional Info" on the right side of the title.
```

---

### Parameters
#### **SummaryItems**
Specifies the script block containing the summary items to be displayed within the summary section.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Title**
Specifies the title of the summary section.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **TitleRight**
Specifies the additional information to be displayed on the right side of the title.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

---

### Notes
Based on https://codepen.io/banik/pen/exjLzB by Tony Banik

---

### Syntax
```PowerShell
New-HTMLSummary [[-SummaryItems] <ScriptBlock>] [[-Title] <String>] [[-TitleRight] <String>] [<CommonParameters>]
```
