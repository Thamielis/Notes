EmailBody
---------

### Synopsis
Defines styling properties for an email body content.

---

### Description

This function defines styling properties for an email body content such as color, background color, font size, font weight, font style, font family, alignment, text decoration, text transform, direction, and more.

---

### Parameters
#### **EmailBody**
Specifies the ScriptBlock containing the email body content.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Color**
Specifies the color of the text in the email body.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **BackGroundColor**
Specifies the background color of the email body.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **LineHeight**
Specifies the line height of the text in the email body.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FontSize**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Object]`|false   |named   |false        |Size   |

#### **FontWeight**
Specifies the weight of the font in the email body. Valid values are 'normal', 'bold', 'bolder', 'lighter', or numeric values from 100 to 900.
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
Specifies the style of the font in the email body. Valid values are 'normal', 'italic', or 'oblique'.
Valid Values:

* normal
* italic
* oblique

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FontVariant**
Specifies the variant of the font in the email body. Valid values are 'normal' or 'small-caps'.
Valid Values:

* normal
* small-caps

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FontFamily**
Specifies the font family of the text in the email body.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Alignment**
Specifies the alignment of the text in the email body. Valid values are 'left', 'center', 'right', or 'justify'.
Valid Values:

* left
* center
* right
* justify

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TextDecoration**
Specifies the decoration of the text in the email body. Valid values are 'none', 'line-through', 'overline', or 'underline'.
Valid Values:

* none
* line-through
* overline
* underline

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TextTransform**
Specifies the transformation of the text in the email body. Valid values are 'uppercase', 'lowercase', or 'capitalize'.
Valid Values:

* uppercase
* lowercase
* capitalize

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Direction**
Specifies the direction of the text in the email body. Valid value is 'rtl'.
Valid Values:

* rtl

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Online**
Switch parameter to indicate if the email body content is online.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Format**
Switch parameter to format the email body content.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Minify**
Switch parameter to minify the email body content.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Parameter**
Specifies additional parameters for styling the email body content.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |named   |false        |

---

### Syntax
```PowerShell
EmailBody [[-EmailBody] <ScriptBlock>] [-Color <String>] [-BackGroundColor <String>] [-LineHeight <String>] [-FontSize <Object>] [-FontWeight <String>] [-FontStyle <String>] [-FontVariant <String>] [-FontFamily <String>] [-Alignment <String>] [-TextDecoration <String>] [-TextTransform <String>] [-Direction <String>] [-Online] [-Format] [-Minify] [-Parameter <IDictionary>] [<CommonParameters>]
```
