EmailListItem
-------------

### Synopsis

EmailListItem [[-Text] <string[]>] [[-Color] <string[]>] [[-BackGroundColor] <string[]>] [[-FontSize] <int[]>] [[-FontWeight] <string[]>] [[-FontStyle] <string[]>] [[-FontVariant] <string[]>] [[-FontFamily] <string[]>] [[-Alignment] <string[]>] [[-TextDecoration] <string[]>] [[-TextTransform] <string[]>] [[-Direction] <string[]>] [-LineBreak] [<CommonParameters>]

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

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |8       |false        |

#### **BackGroundColor**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |2       |false        |

#### **Color**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |1       |false        |

#### **Direction**

Valid Values:

* rtl

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |11      |false        |

#### **FontFamily**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |7       |false        |

#### **FontSize**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[int[]]`|false   |3       |false        |

#### **FontStyle**

Valid Values:

* normal
* italic
* oblique

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |5       |false        |

#### **FontVariant**

Valid Values:

* normal
* small-caps

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |6       |false        |

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

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |4       |false        |

#### **LineBreak**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Text**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |0       |false        |

#### **TextDecoration**

Valid Values:

* none
* line-through
* overline
* underline

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |9       |false        |

#### **TextTransform**

Valid Values:

* uppercase
* lowercase
* capitalize

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |10      |false        |

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
{@{name=EmailListItem; CommonParameters=True; parameter=System.Object[]}}
```
