New-HTMLSummaryItem
-------------------

### Synopsis
Creates a new HTML summary item with specified parameters.

---

### Description

This function creates a new HTML summary item with customizable text, icons, and other visual properties.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLSummaryItem -Text "Summary Item 1" -IconBrands "fa-windows" -IconSize 2 -IconColor "blue" -Open
Creates a new HTML summary item with the text "Summary Item 1", using the Windows icon brand, a size of 2, blue color, and initially open.
```
> EXAMPLE 2

```PowerShell
New-HTMLSummaryItem -Text "Summary Item 2" -IconRegular "fa-address-book" -IconSize 3 -IconColor "green"
Creates a new HTML summary item with the text "Summary Item 2", using the address book regular icon, a size of 3, and green color.
```

---

### Parameters
#### **NestedItems**
Specifies the nested items to include within the summary item.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Text**
Specifies the text content of the summary item.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Open**
Indicates whether the summary item should be initially open or closed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IconSize**
Specifies the size of the icon in the summary item.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **IconColor**
Specifies the color of the icon in the summary item.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **IconBrands**
Specifies the icon brand to use for the summary item. Valid values are retrieved from the available FontAwesome brands.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **IconRegular**
Specifies the regular icon to use for the summary item. Valid values are retrieved from the available FontAwesome regular icons.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **IconSolid**
ICON SOLID

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Syntax
```PowerShell
New-HTMLSummaryItem [-NestedItems <ScriptBlock>] [-Text <String>] [-Open] [-IconSize <Int32>] [-IconColor <String>] [-IconSolid <String>] [<CommonParameters>]
```
```PowerShell
New-HTMLSummaryItem [-NestedItems <ScriptBlock>] [-Text <String>] [-Open] [-IconSize <Int32>] [-IconColor <String>] [-IconRegular <String>] [<CommonParameters>]
```
```PowerShell
New-HTMLSummaryItem [-NestedItems <ScriptBlock>] [-Text <String>] [-Open] [-IconSize <Int32>] [-IconColor <String>] [-IconBrands <String>] [<CommonParameters>]
```
