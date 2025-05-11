New-HTMLTabStyle
----------------

### Synopsis
Creates a new HTML tab style with customizable options.

---

### Description

This function allows you to define various styling options for HTML tabs, such as font size, color, weight, style, background color, border properties, and more.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLTabStyle -FontSize "14px" -FontSizeActive "16px" -TextColor "black" -TextColorActive "blue" -FontWeight "normal" -FontWeightActive "bold" -FontStyle "normal" -FontStyleActive "italic" -FontVariant "normal" -FontVariantActive "small-caps" -FontFamily "Arial" -FontFamilyActive "Verdana" -TextDecoration "none" -TextDecorationActive "underline" -BackgroundColor "#f0f0f0" -BackgroundColorActive "#e0e0e0" -BackgroundColorActiveTarget "#d0d0d0" -BorderRadius "5px" -TextTransform "uppercase" -TextTransformActive "lowercase" -SlimTabs -Transition -LinearGradient -RemoveShadow -BorderStyle "solid" -BorderColor "gray" -BorderBottomWidth "1px" -BorderBottomStyle "solid" -BorderBottomColor "gray" -BorderBottomWidthActive "2px" -BorderBottomStyleActive "dashed" -BorderBottomColorActive "blue" -Style "custom" -Align "center" -Wrap "wrap" -Direction "row"
Creates a new HTML tab style with specified options.
```
> EXAMPLE 2

```PowerShell
New-HTMLTabStyle -FontSize "12px" -FontSizeActive "14px" -TextColor "gray" -TextColorActive "black" -FontWeight "bold" -FontWeightActive "bolder" -FontStyle "italic" -FontStyleActive "oblique" -FontVariant "small-caps" -FontVariantActive "normal" -FontFamily "Verdana" -FontFamilyActive "Arial" -TextDecoration "underline" -TextDecorationActive "none" -BackgroundColor "#e0e0e0" -BackgroundColorActive "#f0f0f0" -BackgroundColorActiveTarget "#d0d0d0" -BorderRadius "10px" -TextTransform "capitalize" -TextTransformActive "uppercase" -SlimTabs -Transition -LinearGradient -RemoveShadow -BorderStyle "dotted" -BorderColor "black" -BorderBottomWidth "2px" -BorderBottomStyle "dashed" -BorderBottomColor "blue" -BorderBottomWidthActive "1px" -BorderBottomStyleActive "solid" -BorderBottomColorActive "gray" -Style "default" -Align "left" -Wrap "nowrap" -Direction "column"
Creates another HTML tab style with different options.
```

---

### Parameters
#### **FontSize**
Specifies the font size for the tabs.

|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[String]`|false   |named   |false        |TextSize|

#### **FontSizeActive**
Specifies the font size for the active tab.

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[String]`|false   |named   |false        |TextSizeActive|

#### **TextColor**
Specifies the text color for the tabs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TextColorActive**
Specifies the text color for the active tab.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FontWeight**
Specifies the font weight for the tabs.
Valid Values:

* normal
* bold
* bolder
* lighter
* 100
* 200
* 300
* 400
* 500
* 600
* 700
* 800
* 900

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FontWeightActive**
Specifies the font weight for the active tab.
Valid Values:

* normal
* bold
* bolder
* lighter
* 100
* 200
* 300
* 400
* 500
* 600
* 700
* 800
* 900

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FontStyle**
Specifies the font style for the tabs.
Valid Values:

* normal
* italic
* oblique

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FontStyleActive**
Specifies the font style for the active tab.
Valid Values:

* normal
* italic
* oblique

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FontVariant**
Specifies the font variant for the tabs.
Valid Values:

* normal
* small-caps

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FontVariantActive**
Specifies the font variant for the active tab.
Valid Values:

* normal
* small-caps

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FontFamily**
Specifies the font family for the tabs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FontFamilyActive**
Specifies the font family for the active tab.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TextDecoration**
Specifies the text decoration for the tabs.
Valid Values:

* none
* line-through
* overline
* underline

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TextDecorationActive**
Specifies the text decoration for the active tab.
Valid Values:

* none
* line-through
* overline
* underline

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **BackgroundColor**
Specifies the background color for the tabs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **BackgroundColorActive**
Specifies the background color for the active tab.

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[String]`|false   |named   |false        |SelectorColor|

#### **BackgroundColorActiveTarget**
Specifies the background color for the active tab target.

|Type      |Required|Position|PipelineInput|Aliases            |
|----------|--------|--------|-------------|-------------------|
|`[String]`|false   |named   |false        |SelectorColorTarget|

#### **BorderRadius**
Specifies the border radius for the tabs.
Valid Values:

* 0px
* 5px
* 10px
* 15px
* 20px
* 25px

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TextTransform**
Specifies the text transformation for the tabs.
Valid Values:

* uppercase
* lowercase
* capitalize

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TextTransformActive**
Specifies the text transformation for the active tab.
Valid Values:

* uppercase
* lowercase
* capitalize

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **SlimTabs**
Indicates whether to use slim tabs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Transition**
Indicates whether to apply transitions.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **LinearGradient**
Indicates whether to use linear gradients.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RemoveShadow**
Indicates whether to remove shadows.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **BorderStyle**
Specifies the border style for the tabs.
Valid Values:

* none
* hidden
* dotted
* dashed
* solid
* double
* groove
* ridge
* inset
* outset

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **BorderColor**
Specifies the border color for the tabs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **BorderBottomWidth**
Specifies the bottom border width for the tabs.
Valid Values:

* medium
* thin
* thick

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **BorderBottomStyle**
Specifies the bottom border style for the tabs.
Valid Values:

* none
* hidden
* dotted
* dashed
* solid
* double
* groove
* ridge
* inset
* outset

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **BorderBottomColor**
Specifies the bottom border color for the tabs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **BorderBottomWidthActive**
Specifies the bottom border width for the active tab.
Valid Values:

* medium
* thin
* thick

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **BorderBottomStyleActive**
Specifies the bottom border style for the active tab.
Valid Values:

* none
* hidden
* dotted
* dashed
* solid
* double
* groove
* ridge
* inset
* outset

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **BorderBottomColorActive**
Specifies the bottom border color for the active tab.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Style**
Specifies a custom style for the tabs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Align**
Specifies the alignment of the tabs.
Valid Values:

* left
* right
* center
* justify

|Type      |Required|Position|PipelineInput|Aliases  |
|----------|--------|--------|-------------|---------|
|`[String]`|false   |named   |false        |AlignTabs|

#### **Wrap**
Specifies the wrapping behavior of the tabs.
Valid Values:

* wrap
* nowrap
* wrap-reverse

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Direction**
Specifies the direction of the tabs.
Valid Values:

* row
* row-reverse
* column
* column-reverse

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AlignContent**

Valid Values:

* flex-start
* flex-end
* center
* space-between
* space-around
* stretch

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AlignItems**

Valid Values:

* stretch
* flex-start
* flex-end
* center
* baseline

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **JustifyContent**

Valid Values:

* flex-start
* flex-end
* center

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **RowElements**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Syntax
```PowerShell
New-HTMLTabStyle [-FontSize <String>] [-FontSizeActive <String>] [-TextColor <String>] [-TextColorActive <String>] [-FontWeight <String>] [-FontWeightActive <String>] [-FontStyle <String>] [-FontStyleActive <String>] [-FontVariant <String>] [-FontVariantActive <String>] [-FontFamily <String>] [-FontFamilyActive <String>] [-TextDecoration <String>] [-TextDecorationActive <String>] [-BackgroundColor <String>] [-BackgroundColorActive <String>] [-BackgroundColorActiveTarget <String>] [-BorderRadius <String>] [-TextTransform <String>] [-TextTransformActive <String>] [-SlimTabs] [-Transition] [-LinearGradient] [-RemoveShadow] [-BorderStyle <String>] [-BorderColor <String>] [-BorderBottomWidth <String>] [-BorderBottomStyle <String>] [-BorderBottomColor <String>] [-BorderBottomWidthActive <String>] [-BorderBottomStyleActive <String>] [-BorderBottomColorActive <String>] [-Align <String>] [-Wrap <String>] [-Direction <String>] [-AlignContent <String>] [-AlignItems <String>] [-JustifyContent <String>] [-RowElements <Int32>] [<CommonParameters>]
```
```PowerShell
New-HTMLTabStyle [-Style <String>] [-Align <String>] [-Wrap <String>] [-Direction <String>] [-AlignContent <String>] [-AlignItems <String>] [-JustifyContent <String>] [-RowElements <Int32>] [<CommonParameters>]
```
