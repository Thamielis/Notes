Add-ExcelWorksheetData
----------------------

### Synopsis

Add-ExcelWorksheetData [[-ExcelDocument] <ExcelPackage>] [[-ExcelWorksheet] <ExcelWorksheet>] [[-DataTable] <array>] [[-Option] <string>] [[-StartRow] <int>] [[-StartColumn] <int>] [[-FreezePane] <int[]>] [[-ExcelWorksheetName] <string>] [[-TransposeSort] <string>] [[-TableStyle] <TableStyles>] [[-TableName] <string>] [[-TabColor] <string>] [[-Suppress] <bool>] [-AutoFit] [-AutoFilter] [-FreezeTopRow] [-FreezeFirstColumn] [-FreezeTopRowFirstColumn] [-Transpose] [-AllProperties] [<CommonParameters>]

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

|Type     |Required|Position|PipelineInput |
|---------|--------|--------|--------------|
|`[array]`|false   |2       |true (ByValue)|

#### **ExcelDocument**

|Type            |Required|Position|PipelineInput|Aliases      |
|----------------|--------|--------|-------------|-------------|
|`[ExcelPackage]`|false   |0       |false        |ExcelWorkbook|

#### **ExcelWorksheet**

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[ExcelWorksheet]`|false   |1       |false        |

#### **ExcelWorksheetName**

|Type      |Required|Position|PipelineInput|Aliases               |
|----------|--------|--------|-------------|----------------------|
|`[string]`|false   |7       |false        |Name<br/>WorksheetName|

#### **FreezeFirstColumn**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **FreezePane**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[int[]]`|false   |6       |false        |

#### **FreezeTopRow**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **FreezeTopRowFirstColumn**

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
|`[string]`|false   |3       |false        |

#### **StartColumn**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |5       |false        |

#### **StartRow**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |4       |false        |

#### **Suppress**

|Type    |Required|Position|PipelineInput|Aliases|
|--------|--------|--------|-------------|-------|
|`[bool]`|false   |12      |false        |Supress|

#### **TabColor**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |11      |false        |

#### **TableName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |10      |false        |

#### **TableStyle**

|Type           |Required|Position|PipelineInput|Aliases    |
|---------------|--------|--------|-------------|-----------|
|`[TableStyles]`|false   |9       |false        |TableStyles|

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
|`[string]`|false   |8       |false        |

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
{@{name=Add-ExcelWorksheetData; CommonParameters=True; parameter=System.Object[]}}
```
