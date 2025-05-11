New-NavFloatWidget
------------------

### Synopsis
Creates a new navigation float widget with customizable options for different types of widgets.

---

### Description

The New-NavFloatWidget function creates a new navigation float widget with various customizable options such as Dots, SelectBox, List, Toggle, and Text. Each type of widget has specific styling and functionality.

---

### Examples
> EXAMPLE 1

```PowerShell
New-NavFloatWidget -Items { New-NavFloatWidgetItem -Name "Home" -Href "/home" -IconBrands "fab fa-home" -IconColor "blue" } -Type "Dots"
Creates a new navigation float widget with Dots type, displaying a single item named "Home" with a home icon in blue color.
```
> EXAMPLE 2

```PowerShell
New-NavFloatWidget -Items { New-NavFloatWidgetItem -Name "About" -Href "/about" -IconRegular "far fa-address-card" -IconColor "green" } -Type "List" -Title "About Us"
Creates a new navigation float widget with List type, displaying a single item named "About" with an address card icon in green color and a title "About Us".
```
> EXAMPLE 3

```PowerShell
New-NavFloatWidget -Items { New-NavFloatWidgetItem -Name "Toggle 1" -Href "/toggle1" } -Type "Toggle" -Title "Toggle Items"
Creates a new navigation float widget with Toggle type, displaying a single item named "Toggle 1" linking to "/toggle1" and a title "Toggle Items".
```

---

### Parameters
#### **Items**
Specifies the script block defining the items to be included in the widget.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Type**
Specifies the type of the widget. Valid values are: Dots, SelectBox, List, Toggle, Text.
Valid Values:

* Dots
* SelectBox
* List
* Toggle
* Text

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Title**
Specifies the title of the widget.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

---

### Syntax
```PowerShell
New-NavFloatWidget [[-Items] <ScriptBlock>] [[-Type] <String>] [[-Title] <String>] [<CommonParameters>]
```
