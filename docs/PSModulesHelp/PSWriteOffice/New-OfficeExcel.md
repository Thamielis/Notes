New-OfficeExcel
---------------

### Synopsis

New-OfficeExcel [[-ExcelContent] <scriptblock>] [-FilePath] <string> [[-RecalculateAllFormulas] <bool>] [[-WhenExists] <string>] [-Template] [-Show] [-Save] [<CommonParameters>]

---

### Description

---

### Parameters
#### **ExcelContent**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[scriptblock]`|false   |0       |false        |

#### **FilePath**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|true    |1       |false        |

#### **RecalculateAllFormulas**

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[bool]`|false   |2       |false        |

#### **Save**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Show**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Template**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **WhenExists**

Valid Values:

* Reuse
* Overwrite
* Stop

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |3       |false        |

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
{@{name=New-OfficeExcel; CommonParameters=True; parameter=System.Object[]}}
```
