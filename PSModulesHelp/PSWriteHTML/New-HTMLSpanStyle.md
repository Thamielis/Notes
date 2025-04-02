New-HTMLSpanStyle
-----------------

### Synopsis

New-HTMLSpanStyle [[-Content] <scriptblock>] [[-Color] <string>] [[-BackGroundColor] <string>] [[-FontSize] <Object>] [[-LineHeight] <string>] [[-FontWeight] <string>] [[-FontStyle] <string>] [[-FontVariant] <string>] [[-FontFamily] <string>] [[-Alignment] <string>] [[-TextDecoration] <string>] [[-TextTransform] <string>] [[-Direction] <string>] [[-Display] <string>] [[-Opacity] <double>] [-LineBreak] [<CommonParameters>]

---

### Description

---

### Parameters
#### **Alignment**

Valid Values:

* left
* center
* right
* justify

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |9       |false        |

#### **BackGroundColor**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |2       |false        |

#### **Color**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |1       |false        |

#### **Content**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[scriptblock]`|false   |0       |false        |

#### **Direction**

Valid Values:

* rtl

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |12      |false        |

#### **Display**

Valid Values:

* none
* inline
* block
* inline-block
* contents
* flex
* grid
* inline-flex
* inline-grid
* inline-table
* list-item
* run-in
* table
* table-caption
* table-column-group
* table-header-group
* table-footer-group
* table-row-group
* table-cell
* table-column
* table-row

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |13      |false        |

#### **FontFamily**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |8       |false        |

#### **FontSize**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

#### **FontStyle**

Valid Values:

* normal
* italic
* oblique

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |6       |false        |

#### **FontVariant**

Valid Values:

* normal
* small-caps

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |7       |false        |

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
|`[string]`|false   |5       |false        |

#### **LineBreak**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **LineHeight**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |4       |false        |

#### **Opacity**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[double]`|false   |14      |false        |

#### **TextDecoration**

Valid Values:

* none
* line-through
* overline
* underline

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |10      |false        |

#### **TextTransform**

Valid Values:

* uppercase
* lowercase
* capitalize

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |11      |false        |

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
{@{name=New-HTMLSpanStyle; CommonParameters=True; parameter=System.Object[]}}
```
