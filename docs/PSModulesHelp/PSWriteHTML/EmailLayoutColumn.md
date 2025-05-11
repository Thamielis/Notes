EmailLayoutColumn
-----------------

### Synopsis
Defines the layout structure for a column in an email content.

---

### Description

This function defines the layout structure for a column in an email content using specified parameters. It allows customization of column layout properties such as width, alignment, padding, and borders.

---

### Parameters
#### **ColumnLayout**
Specifies the ScriptBlock containing the content of the column.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Width**
Specifies the width of the column.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Alignment**
Specifies the alignment of the content within the column. Valid values are 'left', 'center', 'right', or 'justify'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Padding**
Specifies the padding for all sides of the column.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **PaddingTop**
Specifies the padding for the top side of the column.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **PaddingRight**
Specifies the padding for the right side of the column.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **PaddingBottom**
Specifies the padding for the bottom side of the column.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **PaddingLeft**
Specifies the padding for the left side of the column.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |

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
|`[Object]`|false   |9       |false        |

#### **BorderTopColor**
Specifies the color of the top border.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |10      |false        |

#### **BorderTopWidthSize**
Specifies the width of the top border.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |11      |false        |

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
|`[Object]`|false   |12      |false        |

#### **BorderBottomColor**
Specifies the color of the bottom border.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |13      |false        |

#### **BorderBottomWidthSize**
Specifies the width of the bottom border.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |14      |false        |

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
|`[Object]`|false   |15      |false        |

#### **BorderLeftColor**
Specifies the color of the left border.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |16      |false        |

#### **BorderLeftWidthSize**
Specifies the width of the left border.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |17      |false        |

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
|`[Object]`|false   |18      |false        |

#### **BorderRightColor**
Specifies the color of the right border.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |19      |false        |

#### **BorderRightWidthSize**
Specifies the width of the right border.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |20      |false        |

---

### Syntax
```PowerShell
EmailLayoutColumn [[-ColumnLayout] <ScriptBlock>] [[-Width] <String>] [[-Alignment] <String>] [[-Padding] <String>] [[-PaddingTop] <String>] [[-PaddingRight] <String>] [[-PaddingBottom] <String>] [[-PaddingLeft] <String>] [[-BorderTopStyle] <Object>] [[-BorderTopColor] <String>] [[-BorderTopWidthSize] <String>] [[-BorderBottomStyle] <Object>] [[-BorderBottomColor] <String>] [[-BorderBottomWidthSize] <String>] [[-BorderLeftStyle] <Object>] [[-BorderLeftColor] <String>] [[-BorderLeftWidthSize] <String>] [[-BorderRightStyle] <Object>] [[-BorderRightColor] <String>] [[-BorderRightWidthSize] <String>] [<CommonParameters>]
```
