EmailLayoutRow
--------------

### Synopsis
Defines the layout structure for a row in an email content.

---

### Description

This function defines the layout structure for a row in an email content using a ScriptBlock. It generates an HTML table row layout for the email content.

---

### Examples
> EXAMPLE 1

```PowerShell
$RowLayout = {
    'Column 1 content'
    'Column 2 content'
}
$Row = EmailLayoutRow -RowLayout $RowLayout -Height '50px' -BorderTopStyle 'solid' -BorderTopColor 'black' -BorderTopWidthSize '1px' -BorderBottomStyle 'dotted' -BorderBottomColor 'gray' -BorderBottomWidthSize '2px' -BorderLeftStyle 'dashed' -BorderLeftColor 'blue' -BorderLeftWidthSize '1px' -BorderRightStyle 'dotted' -BorderRightColor 'green' -BorderRightWidthSize '1px'
Generates an HTML table row layout with specified content and border styles.
```

---

### Parameters
#### **RowLayout**
Specifies the ScriptBlock containing the content of the row.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Height**
Specifies the height of the row.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **BorderTopStyle**
Specifies the style of the top border. Valid values are 'none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset'.
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
|`[Object]`|false   |3       |false        |

#### **BorderTopColor**
Specifies the color of the top border.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **BorderTopWidthSize**
Specifies the width of the top border.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **BorderBottomStyle**
Specifies the style of the bottom border. Valid values are 'none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset'.
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
|`[Object]`|false   |6       |false        |

#### **BorderBottomColor**
Specifies the color of the bottom border.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **BorderBottomWidthSize**
Specifies the width of the bottom border.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |

#### **BorderLeftStyle**
Specifies the style of the left border. Valid values are 'none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset'.
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
|`[Object]`|false   |9       |false        |

#### **BorderLeftColor**
Specifies the color of the left border.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |10      |false        |

#### **BorderLeftWidthSize**
Specifies the width of the left border.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |11      |false        |

#### **BorderRightStyle**
Specifies the style of the right border. Valid values are 'none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset'.
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
|`[Object]`|false   |12      |false        |

#### **BorderRightColor**
Specifies the color of the right border.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |13      |false        |

#### **BorderRightWidthSize**
Specifies the width of the right border.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |14      |false        |

---

### Syntax
```PowerShell
EmailLayoutRow [[-RowLayout] <ScriptBlock>] [[-Height] <String>] [[-BorderTopStyle] <Object>] [[-BorderTopColor] <String>] [[-BorderTopWidthSize] <String>] [[-BorderBottomStyle] <Object>] [[-BorderBottomColor] <String>] [[-BorderBottomWidthSize] <String>] [[-BorderLeftStyle] <Object>] [[-BorderLeftColor] <String>] [[-BorderLeftWidthSize] <String>] [[-BorderRightStyle] <Object>] [[-BorderRightColor] <String>] [[-BorderRightWidthSize] <String>] [<CommonParameters>]
```
