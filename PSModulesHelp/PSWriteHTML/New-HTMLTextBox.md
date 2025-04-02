New-HTMLTextBox
---------------

### Synopsis
Adds text to HTML where each line in TextBlock is treated as next line (adds BR to each line)

---

### Description

Adds text to HTML where each line in TextBlock is treated as next line (adds BR to each line).
Automatic line breaks are main feature that differentiate New-HTMLTextBox from New-HTMLText
where TextBlock is treated as single line of text unless LineBreak switch is used.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLTextBox {
    "Hello $UserNotify,"
    ""
    "Your password is due to expire in $PasswordExpiryDays days."
    ""
    'To change your password: '
    '- press CTRL+ALT+DEL -> Change a password...'
    ''
    'If you have forgotten your password and need to reset it, you can do this by clicking here. '
    "In case of problems please contact the HelpDesk by visiting [Evotec Website](https://evotec.xyz) or by sending an email to Help Desk."
    ''
    'Alternatively you can always call Help Desk at +48 22 00 00 00'
    ''
    'Kind regards,'
    'Evotec IT'
}
```

---

### Parameters
#### **TextBlock**
ScriptBlock of one or more strings

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Color**
Color of Text to set. Choose one or more colors from up to 800 defined colors. Alternatively provide your own Hex value

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **BackGroundColor**
Color of Background for a Text to set. Choose one or more colors from up to 800 defined colors. Alternatively provide your own Hex value

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **FontSize**
Choose FontSize. You can provide just int value which will assume pixels or string value with any other size value.

|Type       |Required|Position|PipelineInput|Aliases|
|-----------|--------|--------|-------------|-------|
|`[Int32[]]`|false   |named   |false        |Size   |

#### **FontWeight**
Parameter description
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

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **FontStyle**
Parameter description
Valid Values:

* normal
* italic
* oblique

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **TextDecoration**
Parameter description
Valid Values:

* none
* line-through
* overline
* underline

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **FontVariant**
Parameter description
Valid Values:

* normal
* small-caps

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **FontFamily**
Parameter description

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Alignment**
Chhoose Alignment
Valid Values:

* left
* center
* right
* justify

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **TextTransform**
Parameter description
Valid Values:

* uppercase
* lowercase
* capitalize

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Direction**
Parameter description
Valid Values:

* rtl

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **LineBreak**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
New-HTMLTextBox [[-TextBlock] <ScriptBlock>] [-Color <String[]>] [-BackGroundColor <String[]>] [-FontSize <Int32[]>] [-FontWeight <String[]>] [-FontStyle <String[]>] [-TextDecoration <String[]>] [-FontVariant <String[]>] [-FontFamily <String[]>] [-Alignment <String[]>] [-TextTransform <String[]>] [-Direction <String[]>] [-LineBreak] [<CommonParameters>]
```
