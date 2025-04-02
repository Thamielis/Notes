New-HTMLSectionStyle
--------------------

### Synopsis

New-HTMLSectionStyle [-BorderRadius <string>] [-RemoveShadow] [-HeaderTextColor <string>] [-HeaderTextAlignment <string>] [-HeaderBackGroundColor <string>] [-HeaderRemovePadding] [-Wrap <string>] [-Direction <string>] [-Align <string>] [-AlignItems <string>] [-Justify <string>] [-Rotate <string>] [-BackgroundColorContent <string>] [-WrapContent <string>] [-DirectionContent <string>] [-AlignContent <string>] [-AlignItemsContent <string>] [-JustifyContent <string>] [-WritingMode <string>] [-TextOrientation <string>] [-RequestConfiguration] [<CommonParameters>]

---

### Description

---

### Parameters
#### **Align**

Valid Values:

* flex-start
* flex-end
* center
* space-between
* space-around
* stretch

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **AlignContent**

Valid Values:

* flex-start
* flex-end
* center
* space-between
* space-around
* stretch

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **AlignItems**

Valid Values:

* stretch
* flex-start
* flex-end
* center
* baseline

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **AlignItemsContent**

Valid Values:

* stretch
* flex-start
* flex-end
* center
* baseline

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **BackgroundColorContent**

|Type      |Required|Position|PipelineInput|Aliases        |
|----------|--------|--------|-------------|---------------|
|`[string]`|false   |Named   |false        |BackgroundShade|

#### **BorderRadius**

Valid Values:

* 0px
* 5px
* 10px
* 15px
* 20px
* 25px

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **Direction**

Valid Values:

* row
* row-reverse
* column
* column-reverse

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **DirectionContent**

Valid Values:

* row
* row-reverse
* column
* column-reverse

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **HeaderBackGroundColor**

|Type      |Required|Position|PipelineInput|Aliases            |
|----------|--------|--------|-------------|-------------------|
|`[string]`|false   |Named   |false        |TextBackGroundColor|

#### **HeaderRemovePadding**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **HeaderTextAlignment**

Valid Values:

* center
* left
* right
* justify

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[string]`|false   |Named   |false        |TextAlignment|

#### **HeaderTextColor**

|Type      |Required|Position|PipelineInput|Aliases  |
|----------|--------|--------|-------------|---------|
|`[string]`|false   |Named   |false        |TextColor|

#### **Justify**

Valid Values:

* flex-start
* flex-end
* center

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **JustifyContent**

Valid Values:

* flex-start
* flex-end
* center

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **RemoveShadow**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **RequestConfiguration**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Rotate**

Valid Values:

* -180deg
* -90deg
* 90deg
* 180deg

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **TextOrientation**

Valid Values:

* mixed
* upright

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **Wrap**

Valid Values:

* wrap
* nowrap
* wrap-reverse

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **WrapContent**

Valid Values:

* wrap
* nowrap
* wrap-reverse

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **WritingMode**

Valid Values:

* vertical-rl
* vertical-lr
* horizontal-tb

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

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
{@{name=New-HTMLSectionStyle; CommonParameters=True; parameter=System.Object[]}}
```
