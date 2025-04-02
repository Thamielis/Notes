New-OfficeExcelWorkSheet
------------------------

### Synopsis

New-OfficeExcelWorkSheet [[-ExcelContent] <scriptblock>] -WorksheetName <string> [-Excel <XLWorkbook>] [-Option <string>] [-Suppress] [-TabColor <string>] [<CommonParameters>]

---

### Description

---

### Parameters
#### **Excel**

|Type          |Required|Position|PipelineInput|Aliases      |
|--------------|--------|--------|-------------|-------------|
|`[XLWorkbook]`|false   |Named   |false        |ExcelDocument|

#### **ExcelContent**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[scriptblock]`|false   |0       |false        |

#### **Option**

Valid Values:

* Replace
* Skip
* Rename

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **Suppress**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **TabColor**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Named   |false        |

#### **WorksheetName**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[string]`|true    |Named   |false        |Name   |

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
{@{name=New-OfficeExcelWorkSheet; CommonParameters=True; parameter=System.Object[]}}
```
