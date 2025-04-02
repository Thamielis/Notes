Set-CellComment
---------------

### Synopsis

Set-CellComment [-Range] <Object> -Text <string> [-Worksheet <ExcelWorksheet>] [<CommonParameters>]

Set-CellComment -Worksheet <ExcelWorksheet> -Row <int> -ColumnNumber <int> -Text <string> [<CommonParameters>]

Set-CellComment -Worksheet <ExcelWorksheet> -Row <int> -ColumnLetter <string> -Text <string> [<CommonParameters>]

---

### Description

---

### Parameters
#### **ColumnLetter**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|true    |Named   |false        |

#### **ColumnNumber**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|true    |Named   |false        |

#### **Range**

|Type      |Required|Position|PipelineInput |Aliases|
|----------|--------|--------|--------------|-------|
|`[Object]`|true    |0       |true (ByValue)|Address|

#### **Row**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|true    |Named   |false        |

#### **Text**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|true    |Named   |false        |

#### **Worksheet**

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[ExcelWorksheet]`|false   |Named   |false        |

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
{@{name=Set-CellComment; CommonParameters=True; parameter=System.Object[]}, @{name=Set-CellComment; CommonParameters=True; parameter=System.Object[]}, @{name=Set-C…
```
