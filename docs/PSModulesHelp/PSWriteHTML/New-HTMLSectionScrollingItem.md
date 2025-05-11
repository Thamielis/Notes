New-HTMLSectionScrollingItem
----------------------------

### Synopsis
Creates a new HTML section with scrolling functionality.

---

### Description

This function creates a new HTML section with scrolling functionality. It allows you to define the content and title of the section.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLSectionScrollingItem -SectionTitle "Introduction" -Content {
    "This is the introduction section."
}
Creates a new HTML section with the title "Introduction" and the content "This is the introduction section."
```

---

### Parameters
#### **Content**
The script block containing the content to be displayed within the section.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **SectionTitle**
The title of the section.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

---

### Syntax
```PowerShell
New-HTMLSectionScrollingItem [[-Content] <ScriptBlock>] [[-SectionTitle] <String>] [<CommonParameters>]
```
