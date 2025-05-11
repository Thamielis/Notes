New-TableHeader
---------------

### Synopsis
Creates a new table header with specified styling options.

---

### Description

The New-TableHeader function creates a new table header with customizable styling options such as font size, color, alignment, and more.

---

### Examples
> EXAMPLE 1

```PowerShell
New-TableHeader -Names "Name", "Age", "Email" -Title "Employee Information" -Color "black" -BackGroundColor "lightgray" -FontSize 14 -FontWeight "bold" -FontStyle "normal" -FontVariant "normal" -FontFamily "Arial" -Alignment "center" -TextDecoration "none" -TextTransform "uppercase" -Direction "ltr" -AddRow -ColumnCount 3 -Display "all"
Creates a table header with specified column names, title, and styling options.
```

---

### Parameters
#### **Names**
Specifies an array of column names for the table header.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **Title**
Specifies the title of the table header.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Color**
Specifies the text color of the table header.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **BackGroundColor**
Specifies the background color of the table header.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **FontSize**
Specifies the font size of the table header.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |5       |false        |

#### **FontWeight**
Specifies the font weight of the table header.
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
|`[String]`|false   |6       |false        |

#### **FontStyle**
Specifies the font style of the table header.
Valid Values:

* normal
* italic
* oblique

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **FontVariant**
Specifies the font variant of the table header.
Valid Values:

* normal
* small-caps

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |

#### **FontFamily**
Specifies the font family of the table header.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |9       |false        |

#### **Alignment**
Specifies the alignment of the table header.
Valid Values:

* left
* center
* right
* justify

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |10      |false        |

#### **TextDecoration**
Specifies the text decoration of the table header.
Valid Values:

* none
* line-through
* overline
* underline

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |11      |false        |

#### **TextTransform**
Specifies the text transformation of the table header.
Valid Values:

* uppercase
* lowercase
* capitalize

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |12      |false        |

#### **Direction**
Specifies the text direction of the table header.
Valid Values:

* rtl

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |13      |false        |

#### **AddRow**
Switch parameter to add an additional row to the table header.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ColumnCount**
Specifies the number of columns in the table header.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |14      |false        |

#### **ResponsiveOperations**

Valid Values:

* all
* none
* never
* desktop
* not-desktop
* tablet-l
* tablet-p
* mobile-l
* mobile-p
* min-desktop
* max-desktop
* tablet
* not-tablet
* min-tablet
* max-tablet
* not-tablet-l
* min-tablet-l
* max-tablet-l
* not-tablet-p
* min-tablet-p
* max-tablet-p
* mobile
* not-mobile
* min-mobile
* max-mobile
* not-mobile-l
* min-mobile-l
* max-mobile-l
* not-mobile-p
* min-mobile-p
* max-mobile-p

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |15      |false        |

---

### Syntax
```PowerShell
New-TableHeader [[-Names] <String[]>] [[-Title] <String>] [[-Color] <String>] [[-BackGroundColor] <String>] [[-FontSize] <Object>] [[-FontWeight] <String>] [[-FontStyle] <String>] [[-FontVariant] <String>] [[-FontFamily] <String>] [[-Alignment] <String>] [[-TextDecoration] <String>] [[-TextTransform] <String>] [[-Direction] <String>] [-AddRow] [[-ColumnCount] <Int32>] [[-ResponsiveOperations] <String>] [<CommonParameters>]
```
