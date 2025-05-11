Get-VEAst
---------

### Synopsis

Get-VEAst -Path <FileInfo> [-AstType <Object>] [-NoRecursion] [<CommonParameters>]

Get-VEAst -ScriptBlock <scriptblock> [-AstType <Object>] [-NoRecursion] [<CommonParameters>]

Get-VEAst -Code <string> [-AstType <Object>] [-NoRecursion] [<CommonParameters>]

---

### Description

---

### Parameters
#### **AstType**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |Named   |false        |

#### **Code**

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[string]`|true    |Named   |true (ByValue)|

#### **NoRecursion**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Path**

|Type        |Required|Position|PipelineInput                 |Aliases |
|------------|--------|--------|------------------------------|--------|
|`[FileInfo]`|true    |Named   |true (ByValue, ByPropertyName)|FullName|

#### **ScriptBlock**

|Type           |Required|Position|PipelineInput |
|---------------|--------|--------|--------------|
|`[scriptblock]`|true    |Named   |true (ByValue)|

---

### Inputs
System.IO.FileInfo
System.Management.Automation.ScriptBlock
System.String

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
{@{name=Get-VEAst; CommonParameters=True; parameter=System.Object[]}, @{name=Get-VEAst; CommonParameters=True; parameter=System.Object[]}, @{name=Get-VEAst; CommonPar…
```
