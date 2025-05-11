ConvertTo-SourceLineNumber
--------------------------

### Synopsis
Convert the line number in a built module to a file and line number in source

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
ConvertTo-SourceLineNumber -SourceFile ~\ErrorMaker.psm1 -SourceLineNumber 27
```
> EXAMPLE 2

```PowerShell
ConvertTo-SourceLineNumber -PositionMessage "At C:\Users\Joel\OneDrive\Documents\PowerShell\Modules\ErrorMaker\ErrorMaker.psm1:27 char:4"
```

---

### Parameters
#### **PositionMessage**
A position message as found in PowerShell's error messages, ScriptStackTrace, or InvocationInfo

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |named   |true (ByValue, ByPropertyName)|

#### **SourceFile**
The SourceFile (from an InvocationInfo) is the module psm1 path

|Type      |Required|Position|PipelineInput        |Aliases                                         |
|----------|--------|--------|---------------------|------------------------------------------------|
|`[String]`|true    |1       |true (ByPropertyName)|PSCommandPath<br/>File<br/>ScriptName<br/>Script|

#### **SourceLineNumber**
The SourceLineNumber (from an InvocationInfo) is the module line number

|Type     |Required|Position|PipelineInput        |Aliases                                 |
|---------|--------|--------|---------------------|----------------------------------------|
|`[Int32]`|true    |2       |true (ByPropertyName)|LineNumber<br/>Line<br/>ScriptLineNumber|

#### **InputObject**
The actual InvocationInfo

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[PSObject]`|false   |named   |true (ByValue)|

#### **Passthru**
If set, passes through the InputObject, overwriting the SourceFile and SourceLineNumber.
Otherwise, creates a new SourceLocation object with just those properties.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
ConvertTo-SourceLineNumber -PositionMessage <String> [<CommonParameters>]
```
```PowerShell
ConvertTo-SourceLineNumber [-SourceFile] <String> [-SourceLineNumber] <Int32> [-InputObject <PSObject>] [-Passthru] [<CommonParameters>]
```
