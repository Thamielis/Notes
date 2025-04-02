New-HTMLPanel
-------------

### Synopsis

New-HTMLPanel [[-Content] <scriptblock>] [-BackgroundColor <string>] [-Invisible] [-Width <string>] [-Margin <string>] [-AlignContentText <string>] [-BorderRadius <string>] [-AnchorName <string>] [-StyleSheetsConfiguration <IDictionary>] [<CommonParameters>]

---

### Description

---

### Parameters
#### **AlignContentText**

Valid Values:

* center
* left
* right
* justify

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

#### **Content**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[scriptblock]`|false   |0       |false        |

#### **Invisible**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Margin**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **StyleSheetsConfiguration**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |Named   |false        |

#### **Width**

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[string]`|false   |Named   |false        |flex-basis|

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
{@{name=New-HTMLPanel; CommonParameters=True; parameter=System.Object[]}}
```
