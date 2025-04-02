New-DiagramOptionsNodes
-----------------------

### Synopsis

New-DiagramOptionsNodes [-BorderWidth <int>] [-BorderWidthSelected <int>] [-BrokenImage <string>] [-Chosen <bool>] [-ColorBorder <string>] [-ColorBackground <string>] [-ColorHighlightBorder <string>] [-ColorHighlightBackground <string>] [-ColorHoverBorder <string>] [-ColorHoverBackground <string>] [-FixedX <bool>] [-FixedY <bool>] [-FontColor <string>] [-FontSize <int>] [-FontName <string>] [-FontBackground <string>] [-FontStrokeWidth <int>] [-FontStrokeColor <string>] [-FontAlign <string>] [-FontMulti <string>] [-FontVAdjust <int>] [-Size <int>] [-Shape <string>] [-HeightConstraintMinimum <int>] [-HeightConstraintVAlign <string>] [-WidthConstraintMinimum <int>] [-WidthConstraintMaximum <int>] [-Margin <int>] [-MarginTop <int>] [-MarginRight <int>] [-MarginBottom <int>] [-MarginLeft <int>] [<CommonParameters>]

---

### Description

---

### Parameters
#### **BorderWidth**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |Named   |false        |

#### **BorderWidthSelected**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |Named   |false        |

#### **BrokenImage**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **Chosen**

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[bool]`|false   |Named   |false        |

#### **ColorBackground**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **ColorBorder**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **ColorHighlightBackground**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **ColorHighlightBorder**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **ColorHoverBackground**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **ColorHoverBorder**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **FixedX**

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[bool]`|false   |Named   |false        |

#### **FixedY**

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[bool]`|false   |Named   |false        |

#### **FontAlign**

Valid Values:

* center
* left

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **FontBackground**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **FontColor**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **FontMulti**

Valid Values:

* false
* true
* markdown
* html

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **FontName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **FontSize**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |Named   |false        |

#### **FontStrokeColor**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **FontStrokeWidth**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |Named   |false        |

#### **FontVAdjust**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |Named   |false        |

#### **HeightConstraintMinimum**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |Named   |false        |

#### **HeightConstraintVAlign**

Valid Values:

* top
* middle
* bottom

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **Margin**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |Named   |false        |

#### **MarginBottom**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |Named   |false        |

#### **MarginLeft**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |Named   |false        |

#### **MarginRight**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |Named   |false        |

#### **MarginTop**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |Named   |false        |

#### **Shape**

Valid Values:

* circle
* dot
* diamond
* ellipse
* database
* box
* square
* triangle
* triangleDown
* text
* star
* hexagon

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **Size**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |Named   |false        |

#### **WidthConstraintMaximum**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |Named   |false        |

#### **WidthConstraintMinimum**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |Named   |false        |

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
{@{name=New-DiagramOptionsNodes; CommonParameters=True; parameter=System.Object[]}}
```
