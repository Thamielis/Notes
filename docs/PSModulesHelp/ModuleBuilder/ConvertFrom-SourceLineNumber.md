ConvertFrom-SourceLineNumber
----------------------------

### Synopsis
Convert a source file path and line number to the line number in the built output

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
ConvertFrom-SourceLineNumber -Module ~\2.0.0\ModuleBuilder.psm1 -SourceFile ~\Source\Public\Build-Module.ps1 -Line 27
```

---

### Parameters
#### **SourceFile**
The SourceFile is the source script file that was built into the module

|Type      |Required|Position|PipelineInput        |Aliases                                         |
|----------|--------|--------|---------------------|------------------------------------------------|
|`[String]`|true    |1       |true (ByPropertyName)|PSCommandPath<br/>File<br/>ScriptName<br/>Script|

#### **SourceLineNumber**
The SourceLineNumber (from an InvocationInfo) is the line number in the source file

|Type     |Required|Position|PipelineInput        |Aliases                                 |
|---------|--------|--------|---------------------|----------------------------------------|
|`[Int32]`|true    |2       |true (ByPropertyName)|LineNumber<br/>Line<br/>ScriptLineNumber|

#### **Module**
The name of the module in memory, or the full path to the module psm1

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Syntax
```PowerShell
ConvertFrom-SourceLineNumber [-SourceFile] <String> [-SourceLineNumber] <Int32> [-Module <String>] [<CommonParameters>]
```
