Get-ScriptAST
-------------

### Synopsis
Parses a PowerShell script or script file and returns its Abstract Syntax Tree (AST).

---

### Description

This function parses a PowerShell script from a file or a string input and returns its AST.
It can optionally provide token and error information.

---

### Related Links
* [https://psmodule.io/AST/Functions/Core/Get-ScriptAST/](https://psmodule.io/AST/Functions/Core/Get-ScriptAST/)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ScriptAST -Path "C:\Scripts\MyScript.ps1"
Parses the PowerShell script at "MyScript.ps1" and returns its AST.
```
> EXAMPLE 2

```PowerShell
Get-ScriptAST -Script "Get-Process | Select-Object Name"
Parses the provided PowerShell script string and returns its AST.
```
> EXAMPLE 3

```PowerShell
Get-ScriptAST -Path "C:\Scripts\MyScript.ps1" -Tokens ([ref]$tokens) -Errors ([ref]$errors)
Parses the script file while also capturing tokens and errors.
```

---

### Parameters
#### **Path**
The path to the PowerShell script file to be parsed.
Validate using Test-Path

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |named   |true (ByValue, ByPropertyName)|

#### **Script**
The PowerShell script to be parsed.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |named   |true (ByValue, ByPropertyName)|

#### **Tokens**
Reference variable to store parsed tokens.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[PSReference]`|false   |named   |false        |

#### **Errors**
Reference variable to store parsing errors.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[PSReference]`|false   |named   |false        |

---

### Outputs
* [Management.Automation.Language.ScriptBlockAst](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.Language.ScriptBlockAst)

---

### Syntax
```PowerShell
Get-ScriptAST -Path <String> [-Tokens <PSReference>] [-Errors <PSReference>] [<CommonParameters>]
```
```PowerShell
Get-ScriptAST -Script <String> [-Tokens <PSReference>] [-Errors <PSReference>] [<CommonParameters>]
```
