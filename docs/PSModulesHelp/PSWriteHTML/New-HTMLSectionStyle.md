New-HTMLSectionStyle
--------------------

### Synopsis
Creates a new HTML section style with customizable options.

---

### Description

This function creates a new HTML section style with various styling options such as border radius, text color, alignment, background color, and more.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLSectionStyle -BorderRadius '10px' -HeaderTextColor 'blue' -HeaderTextAlignment 'center' -HeaderBackGroundColor 'lightgray' -Wrap 'wrap' -Direction 'row' -Align 'center' -AlignItems 'flex-start' -Justify 'space-between' -Rotate '90deg' -BackgroundColorContent 'white' -WrapContent 'wrap' -DirectionContent 'column' -AlignContent 'flex-end' -AlignItemsContent 'center' -JustifyContent 'flex-start' -WritingMode 'horizontal-tb' -TextOrientation 'upright' -RequestConfiguration
Creates a new HTML section style with specified options.
```

---

### Parameters
#### **BorderRadius**
Specifies the border radius of the section.
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

#### **RemoveShadow**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **HeaderTextColor**
Specifies the text color of the section header.

|Type      |Required|Position|PipelineInput|Aliases  |
|----------|--------|--------|-------------|---------|
|`[String]`|false   |named   |false        |TextColor|

#### **HeaderTextAlignment**
Specifies the text alignment of the section header.
Valid Values:

* center
* left
* right
* justify

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[String]`|false   |named   |false        |TextAlignment|

#### **HeaderBackGroundColor**
Specifies the background color of the section header.

|Type      |Required|Position|PipelineInput|Aliases            |
|----------|--------|--------|-------------|-------------------|
|`[String]`|false   |named   |false        |TextBackGroundColor|

#### **HeaderRemovePadding**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Wrap**
Specifies the wrapping behavior of the section.
Valid Values:

* wrap
* nowrap
* wrap-reverse

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Direction**
Specifies the direction of the section layout.
Valid Values:

* row
* row-reverse
* column
* column-reverse

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Align**
Specifies the alignment of the section.
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
Specifies the alignment of the items within the section.
Valid Values:

* stretch
* flex-start
* flex-end
* center
* baseline

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Justify**
Specifies the justification of the section.
Valid Values:

* flex-start
* flex-end
* center

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Rotate**
Specifies the rotation angle of the section.
Valid Values:

* -180deg
* -90deg
* 90deg
* 180deg

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **BackgroundColorContent**
Specifies the background color of the section content.

|Type      |Required|Position|PipelineInput|Aliases        |
|----------|--------|--------|-------------|---------------|
|`[String]`|false   |named   |false        |BackgroundShade|

#### **WrapContent**
Specifies the wrapping behavior of the section content.
Valid Values:

* wrap
* nowrap
* wrap-reverse

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DirectionContent**
Specifies the direction of the section content layout.
Valid Values:

* row
* row-reverse
* column
* column-reverse

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AlignContent**
Specifies the alignment of the section content.
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

#### **AlignItemsContent**
Specifies the alignment of the items within the section content.
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
Specifies the justification of the section content.
Valid Values:

* flex-start
* flex-end
* center

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **WritingMode**
Specifies the writing mode of the section.
Valid Values:

* vertical-rl
* vertical-lr
* horizontal-tb

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TextOrientation**
Specifies the text orientation of the section.
Valid Values:

* mixed
* upright

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **RequestConfiguration**
Indicates whether to request configuration for the section styling.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
File Name      : New-HTMLSectionStyle.ps1
Prerequisite   : PowerShell V5

---

### Syntax
```PowerShell
New-HTMLSectionStyle [-BorderRadius <String>] [-RemoveShadow] [-HeaderTextColor <String>] [-HeaderTextAlignment <String>] [-HeaderBackGroundColor <String>] [-HeaderRemovePadding] [-Wrap <String>] [-Direction <String>] [-Align <String>] [-AlignItems <String>] [-Justify <String>] [-Rotate <String>] [-BackgroundColorContent <String>] [-WrapContent <String>] [-DirectionContent <String>] [-AlignContent <String>] [-AlignItemsContent <String>] [-JustifyContent <String>] [-WritingMode <String>] [-TextOrientation <String>] [-RequestConfiguration] [<CommonParameters>]
```
