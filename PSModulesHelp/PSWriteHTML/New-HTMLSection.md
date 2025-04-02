New-HTMLSection
---------------

### Synopsis

New-HTMLSection [[-Content] <scriptblock>] [-HeaderText <string>] [-HeaderTextColor <string>] [-HeaderTextSize <string>] [-HeaderTextAlignment <string>] [-HeaderBackGroundColor <string>] [-BackgroundColor <string>] [-CanCollapse] [-IsHidden] [-Collapsed] [-Height <Object>] [-Width <Object>] [-Invisible] [-Margin <Object>] [-Wrap <string>] [-Direction <string>] [-AlignContent <string>] [-AlignItems <string>] [-JustifyContent <string>] [-BorderRadius <string>] [-AnchorName <string>] [-StyleSheetsConfiguration <IDictionary>] [<CommonParameters>]

---

### Description

---

### Parameters
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

#### **AnchorName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **BackgroundColor**

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

#### **CanCollapse**

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[switch]`|false   |Named   |false        |Collapsable|

#### **Collapsed**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Content**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[scriptblock]`|false   |0       |false        |

#### **Direction**

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

#### **HeaderText**

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[string]`|false   |Named   |false        |Name<br/>Title|

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

#### **HeaderTextSize**

|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[string]`|false   |Named   |false        |TextSize|

#### **Height**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |Named   |false        |

#### **Invisible**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **IsHidden**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **JustifyContent**

Valid Values:

* flex-start
* flex-end
* center

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **Margin**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |Named   |false        |

#### **StyleSheetsConfiguration**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |Named   |false        |

#### **Width**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |Named   |false        |

#### **Wrap**

Valid Values:

* wrap
* nowrap
* wrap-reverse

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
{@{name=New-HTMLSection; CommonParameters=True; parameter=System.Object[]}}
```
