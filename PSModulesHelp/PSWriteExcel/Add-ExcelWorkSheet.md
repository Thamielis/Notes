Add-ExcelWorkSheet
------------------

### Synopsis

Add-ExcelWorkSheet [[-ExcelDocument] <ExcelPackage>] [[-WorksheetName] <string>] [[-Option] <string>] [[-Suppress] <bool>] [<CommonParameters>]

---

### Description

---

### Parameters
#### **ExcelDocument**

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[ExcelPackage]`|false   |0       |false        |

#### **Option**

Valid Values:

* Replace
* Skip
* Rename

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |2       |false        |

#### **Suppress**

|Type    |Required|Position|PipelineInput|Aliases|
|--------|--------|--------|-------------|-------|
|`[bool]`|false   |3       |false        |Supress|

#### **WorksheetName**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[string]`|false   |1       |false        |Name   |

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
{@{name=Add-ExcelWorkSheet; CommonParameters=True; parameter=System.Object[]}}
```
