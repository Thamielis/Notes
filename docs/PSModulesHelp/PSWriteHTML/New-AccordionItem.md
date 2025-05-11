New-AccordionItem
-----------------

### Synopsis
Creates a new accordion item with specified header text and panel text.

---

### Description

This function creates a new accordion item with the provided header text and panel text. The header text is displayed as a clickable button to toggle the visibility of the panel text.

---

### Examples
> EXAMPLE 1

```PowerShell
New-AccordionItem -HeaderText "Header 1" -HeaderAlign "left" -PanelText "Panel 1 Text"
Creates a new accordion item with the header text "Header 1" aligned to the left and panel text "Panel 1 Text".
```
> EXAMPLE 2

```PowerShell
New-AccordionItem -HeaderText "Header 2" -HeaderAlign "center" -PanelText "Panel 2 Text"
Creates a new accordion item with the header text "Header 2" aligned to the center and panel text "Panel 2 Text".
```

---

### Parameters
#### **HeaderText**
The text to be displayed as the header of the accordion item.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **HeaderAlign**
The alignment of the header text. Accepted values are 'left', 'center', or 'right'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **PanelText**
The text to be displayed in the panel of the accordion item.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

---

### Syntax
```PowerShell
New-AccordionItem [[-HeaderText] <String>] [[-HeaderAlign] <String>] [[-PanelText] <String>] [<CommonParameters>]
```
