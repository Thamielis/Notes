ConvertTo-Excel
---------------

### Synopsis

ConvertTo-Excel [[-FilePath] <string>] [[-Excel] <ExcelPackage>] [[-ExcelWorkSheetName] <string>] [[-DataTable] <array>] [[-Option] <string>] [[-FreezePane] <int[]>] [[-TransposeSort] <string>] [[-TableStyle] <TableStyles>] [[-TableName] <string>] [-AutoFilter] [-AutoFit] [-FreezeTopRow] [-FreezeFirstColumn] [-FreezeTopRowFirstColumn] [-Transpose] [-OpenWorkBook] [-AllProperties] [<CommonParameters>]

---

### Description

---

### Parameters
#### **AllProperties**

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[switch]`|false   |Named   |false        |PreScanHeaders|

#### **AutoFilter**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **AutoFit**

|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[switch]`|false   |Named   |false        |Autosize|

#### **DataTable**

|Type     |Required|Position|PipelineInput |Aliases   |
|---------|--------|--------|--------------|----------|
|`[array]`|false   |3       |true (ByValue)|TargetData|

#### **Excel**

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[ExcelPackage]`|false   |1       |false        |

#### **ExcelWorkSheetName**

|Type      |Required|Position|PipelineInput|Aliases               |
|----------|--------|--------|-------------|----------------------|
|`[string]`|false   |2       |false        |Name<br/>WorksheetName|

#### **FilePath**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[string]`|false   |0       |false        |path   |

#### **FreezeFirstColumn**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **FreezePane**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[int[]]`|false   |5       |false        |

#### **FreezeTopRow**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **FreezeTopRowFirstColumn**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **OpenWorkBook**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Option**

Valid Values:

* Replace
* Skip
* Rename

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |4       |false        |

#### **TableName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |8       |false        |

#### **TableStyle**

|Type           |Required|Position|PipelineInput|Aliases    |
|---------------|--------|--------|-------------|-----------|
|`[TableStyles]`|false   |7       |false        |TableStyles|

#### **Transpose**

|Type      |Required|Position|PipelineInput|Aliases                                                         |
|----------|--------|--------|-------------|----------------------------------------------------------------|
|`[switch]`|false   |Named   |false        |Rotate<br/>RotateData<br/>TransposeColumnsRows<br/>TransposeData|

#### **TransposeSort**

Valid Values:

* ASC
* DESC
* NONE

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |6       |false        |

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
{@{name=ConvertTo-Excel; CommonParameters=True; parameter=System.Object[]}}
```
