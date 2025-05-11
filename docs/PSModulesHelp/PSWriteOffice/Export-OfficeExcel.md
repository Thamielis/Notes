Export-OfficeExcel
------------------

### Synopsis

Export-OfficeExcel [[-FilePath] <string>] [[-WorksheetName] <string>] [[-DataTable] <array>] [[-Row] <int>] [[-Column] <int>] [[-Transpose] <XLTransposeOptions>] [[-Theme] <string>] [-Show] [-AllProperties] [-ShowRowStripes] [-ShowColumnStripes] [-DisableAutoFilter] [-HideHeaderRow] [-ShowTotalsRow] [-EmphasizeFirstColumn] [-EmphasizeLastColumn] [<CommonParameters>]

---

### Description

---

### Parameters
#### **AllProperties**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Column**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |4       |false        |

#### **DataTable**

|Type     |Required|Position|PipelineInput |Aliases   |
|---------|--------|--------|--------------|----------|
|`[array]`|false   |2       |true (ByValue)|TargetData|

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

#### **FilePath**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |0       |false        |

#### **HideHeaderRow**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Row**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |3       |false        |

#### **Show**

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

#### **Theme**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |6       |false        |

#### **Transpose**

Valid Values:

* MoveCells
* ReplaceCells

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[XLTransposeOptions]`|false   |5       |false        |

#### **WorksheetName**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[string]`|false   |1       |false        |Name   |

---

### Inputs
System.Array

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
{@{name=Export-OfficeExcel; CommonParameters=True; parameter=System.Object[]}}
```
