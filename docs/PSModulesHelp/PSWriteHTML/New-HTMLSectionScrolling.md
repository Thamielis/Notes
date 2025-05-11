New-HTMLSectionScrolling
------------------------

### Synopsis
Creates a new HTML section with scrolling functionality.

---

### Description

This function creates a new HTML section with scrolling functionality. It takes a script block as input, executes the script block, and generates HTML output for each SectionScrollingItem.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLSectionScrolling -Content {
    [PSCustomObject]@{
        Type = 'SectionScrollingItem'
        HTMLOutput = '<p>Section 1</p>'
        ListEntry = 'Section 1'
    }
    [PSCustomObject]@{
        Type = 'SectionScrollingItem'
        HTMLOutput = '<p>Section 2</p>'
        ListEntry = 'Section 2'
    }
}
```

---

### Parameters
#### **Content**
The script block containing the content to be displayed in the HTML section.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

---

### Notes
File Name      : New-HTMLSectionScrolling.ps1
Prerequisite   : This function requires Enable-HTMLFeature to be run with the SectionScrolling feature enabled.

---

### Syntax
```PowerShell
New-HTMLSectionScrolling [[-Content] <ScriptBlock>] [<CommonParameters>]
```
