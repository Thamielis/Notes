New-HTMLListItem
----------------

### Synopsis

New-HTMLListItem [[-NestedListItems] <scriptblock>] [[-Text] <string[]>] [[-Color] <string[]>] [[-BackGroundColor] <string[]>] [-FontSize <Object[]>] [-FontWeight <string[]>] [-FontStyle <string[]>] [-FontVariant <string[]>] [-FontFamily <string[]>] [-Alignment <string[]>] [-TextDecoration <string[]>] [-TextTransform <string[]>] [-Direction <string[]>] [-LineBreak] [<CommonParameters>]

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
|`[string[]]`|false   |Named   |false        |

#### **BackGroundColor**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |3       |false        |

#### **Color**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |2       |false        |

#### **Direction**

Valid Values:

* rtl

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |Named   |false        |

#### **FontFamily**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |Named   |false        |

#### **FontSize**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Object[]]`|false   |Named   |false        |

#### **FontStyle**

Valid Values:

* normal
* italic
* oblique

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |Named   |false        |

#### **FontVariant**

Valid Values:

* normal
* small-caps

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |Named   |false        |

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
|`[string[]]`|false   |Named   |false        |

#### **LineBreak**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **NestedListItems**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[scriptblock]`|false   |0       |false        |

#### **Text**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |1       |false        |

#### **TextDecoration**

Valid Values:

* none
* line-through
* overline
* underline

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |Named   |false        |

#### **TextTransform**

Valid Values:

* uppercase
* lowercase
* capitalize

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |Named   |false        |

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
{@{name=New-HTMLListItem; CommonParameters=True; parameter=System.Object[]}}
```
