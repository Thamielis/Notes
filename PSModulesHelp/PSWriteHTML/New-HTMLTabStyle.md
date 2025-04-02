New-HTMLTabStyle
----------------

### Synopsis

New-HTMLTabStyle [-FontSize <string>] [-FontSizeActive <string>] [-TextColor <string>] [-TextColorActive <string>] [-FontWeight <string>] [-FontWeightActive <string>] [-FontStyle <string>] [-FontStyleActive <string>] [-FontVariant <string>] [-FontVariantActive <string>] [-FontFamily <string>] [-FontFamilyActive <string>] [-TextDecoration <string>] [-TextDecorationActive <string>] [-BackgroundColor <string>] [-BackgroundColorActive <string>] [-BackgroundColorActiveTarget <string>] [-BorderRadius <string>] [-TextTransform <string>] [-TextTransformActive <string>] [-SlimTabs] [-Transition] [-LinearGradient] [-RemoveShadow] [-BorderStyle <string>] [-BorderColor <string>] [-BorderBottomWidth <string>] [-BorderBottomStyle <string>] [-BorderBottomColor <string>] [-BorderBottomWidthActive <string>] [-BorderBottomStyleActive <string>] [-BorderBottomColorActive <string>] [-Align <string>] [-Wrap <string>] [-Direction <string>] [-AlignContent <string>] [-AlignItems <string>] [-JustifyContent <string>] [-RowElements <int>] [<CommonParameters>]

New-HTMLTabStyle [-Style <string>] [-Align <string>] [-Wrap <string>] [-Direction <string>] [-AlignContent <string>] [-AlignItems <string>] [-JustifyContent <string>] [-RowElements <int>] [<CommonParameters>]

---

### Description

---

### Parameters
#### **Align**

Valid Values:

* left
* right
* center
* justify

|Type      |Required|Position|PipelineInput|Aliases  |
|----------|--------|--------|-------------|---------|
|`[string]`|false   |Named   |false        |AlignTabs|

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
|`[string]`|false   |Named   |false        |

#### **AlignItems**

Valid Values:

* stretch
* flex-start
* flex-end
* center
* baseline

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **BackgroundColor**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **BackgroundColorActive**

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[string]`|false   |Named   |false        |SelectorColor|

#### **BackgroundColorActiveTarget**

|Type      |Required|Position|PipelineInput|Aliases            |
|----------|--------|--------|-------------|-------------------|
|`[string]`|false   |Named   |false        |SelectorColorTarget|

#### **BorderBottomColor**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **BorderBottomColorActive**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **BorderBottomStyle**

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
|`[string]`|false   |Named   |false        |

#### **BorderBottomStyleActive**

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
|`[string]`|false   |Named   |false        |

#### **BorderBottomWidth**

Valid Values:

* medium
* thin
* thick

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **BorderBottomWidthActive**

Valid Values:

* medium
* thin
* thick

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **BorderColor**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **BorderRadius**

Valid Values:

* 0px
* 5px
* 10px
* 15px
* 20px
* 25px

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **BorderStyle**

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
|`[string]`|false   |Named   |false        |

#### **Direction**

Valid Values:

* row
* row-reverse
* column
* column-reverse

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **FontFamily**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **FontFamilyActive**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **FontSize**

|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[string]`|false   |Named   |false        |TextSize|

#### **FontSizeActive**

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[string]`|false   |Named   |false        |TextSizeActive|

#### **FontStyle**

Valid Values:

* normal
* italic
* oblique

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **FontStyleActive**

Valid Values:

* normal
* italic
* oblique

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **FontVariant**

Valid Values:

* normal
* small-caps

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **FontVariantActive**

Valid Values:

* normal
* small-caps

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **FontWeight**

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
|`[string]`|false   |Named   |false        |

#### **FontWeightActive**

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
|`[string]`|false   |Named   |false        |

#### **JustifyContent**

Valid Values:

* flex-start
* flex-end
* center

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **LinearGradient**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **RemoveShadow**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **RowElements**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |Named   |false        |

#### **SlimTabs**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Style**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **TextColor**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **TextColorActive**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **TextDecoration**

Valid Values:

* none
* line-through
* overline
* underline

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **TextDecorationActive**

Valid Values:

* none
* line-through
* overline
* underline

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **TextTransform**

Valid Values:

* uppercase
* lowercase
* capitalize

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **TextTransformActive**

Valid Values:

* uppercase
* lowercase
* capitalize

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **Transition**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Wrap**

Valid Values:

* wrap
* nowrap
* wrap-reverse

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Syntax
```PowerShell
syntaxItem
```
```PowerShell
----------
```
```PowerShell
{@{name=New-HTMLTabStyle; CommonParameters=True; parameter=System.Object[]}, @{name=New-HTMLTabStyle; CommonParameters=True; parameter=System.Object[]}}
```
