New-TableHeader
---------------

### Synopsis

New-TableHeader [[-Names] <string[]>] [[-Title] <string>] [[-Color] <string>] [[-BackGroundColor] <string>] [[-FontSize] <Object>] [[-FontWeight] <string>] [[-FontStyle] <string>] [[-FontVariant] <string>] [[-FontFamily] <string>] [[-Alignment] <string>] [[-TextDecoration] <string>] [[-TextTransform] <string>] [[-Direction] <string>] [[-ColumnCount] <int>] [[-ResponsiveOperations] <string>] [-AddRow] [<CommonParameters>]

---

### Description

---

### Parameters
#### **AddRow**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

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
|`[string]`|false   |3       |false        |

#### **Color**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |2       |false        |

#### **ColumnCount**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |13      |false        |

#### **Direction**

Valid Values:

* rtl

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |12      |false        |

#### **FontFamily**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |8       |false        |

#### **FontSize**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

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

#### **Names**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |0       |false        |

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
|`[string]`|false   |14      |false        |

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

#### **Title**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |1       |false        |

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
{@{name=New-TableHeader; CommonParameters=True; parameter=System.Object[]}}
```
