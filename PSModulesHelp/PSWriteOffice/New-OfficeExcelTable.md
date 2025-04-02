New-OfficeExcelTable
--------------------

### Synopsis

New-OfficeExcelTable [[-DataTable] <array>] [[-Worksheet] <Object>] [[-StartRow] <int>] [[-StartCell] <int>] [[-Transpose] <XLTransposeOptions>] [[-Theme] <string>] [-ReturnObject] [-AllProperties] [-SkipHeader] [-ShowRowStripes] [-ShowColumnStripes] [-DisableAutoFilter] [-HideHeaderRow] [-ShowTotalsRow] [-EmphasizeFirstColumn] [-EmphasizeLastColumn] [<CommonParameters>]

---

### Description

---

### Parameters
#### **AllProperties**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **DataTable**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[array]`|false   |0       |false        |

#### **DisableAutoFilter**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **EmphasizeFirstColumn**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **EmphasizeLastColumn**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **HideHeaderRow**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **ReturnObject**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **ShowColumnStripes**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **ShowRowStripes**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **ShowTotalsRow**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **SkipHeader**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **StartCell**

|Type   |Required|Position|PipelineInput|Aliases|
|-------|--------|--------|-------------|-------|
|`[int]`|false   |3       |false        |Column |

#### **StartRow**

|Type   |Required|Position|PipelineInput|Aliases|
|-------|--------|--------|-------------|-------|
|`[int]`|false   |2       |false        |Row    |

#### **Theme**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |5       |false        |

#### **Transpose**

Valid Values:

* MoveCells
* ReplaceCells

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[XLTransposeOptions]`|false   |4       |false        |

#### **Worksheet**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

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
{@{name=New-OfficeExcelTable; CommonParameters=True; parameter=System.Object[]}}
```
