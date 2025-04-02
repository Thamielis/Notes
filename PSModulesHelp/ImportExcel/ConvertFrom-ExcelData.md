ConvertFrom-ExcelData
---------------------

### Synopsis

ConvertFrom-ExcelData [-Path] <Object> [[-ScriptBlock] <scriptblock>] [[-WorksheetName] <Object>] [[-StartRow] <int>] [[-Header] <string[]>] [-NoHeader] [-DataOnly] [<CommonParameters>]

---

### Description

---

### Parameters
#### **DataOnly**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Header**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |4       |false        |

#### **NoHeader**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Path**

|Type      |Required|Position|PipelineInput                 |Aliases |
|----------|--------|--------|------------------------------|--------|
|`[Object]`|true    |0       |true (ByValue, ByPropertyName)|FullName|

#### **ScriptBlock**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[scriptblock]`|false   |1       |false        |

#### **StartRow**

|Type   |Required|Position|PipelineInput|Aliases             |
|-------|--------|--------|-------------|--------------------|
|`[int]`|false   |3       |false        |HeaderRow<br/>TopRow|

#### **WorksheetName**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Object]`|false   |2       |false        |Sheet  |

---

### Inputs
System.Object

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
{@{name=ConvertFrom-ExcelData; CommonParameters=True; parameter=System.Object[]}}
```
