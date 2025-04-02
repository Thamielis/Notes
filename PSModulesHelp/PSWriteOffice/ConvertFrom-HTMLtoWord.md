ConvertFrom-HTMLtoWord
----------------------

### Synopsis
Converts HTML input to Microsoft Word Document

---

### Description

Converts HTML input to Microsoft Word Document

---

### Examples
> EXAMPLE 1

```PowerShell
$Objects = @(
    [PSCustomObject] @{ Test = 1; Test2 = 'Test'; Test3 = 'Ok' }
    [PSCustomObject] @{ Test = 1; Test2 = 'Test'; Test3 = 'Ok' }
)
New-HTML {
    New-HTMLText -Text 'This is a test', ' another test' -FontSize 30pt
    New-HTMLTable -DataTable $Objects -Simplify
} -Online -FilePath $PSScriptRoot\Documents\Test.html

ConvertFrom-HTMLToWord -OutputFile $PSScriptRoot\Documents\TestHTML.docx -FileHTML $PSScriptRoot\Documents\Test.html -Show
```
> EXAMPLE 2

```PowerShell
$Objects = @(
[PSCustomObject] @{ Test = 1; Test2 = 'Test'; Test3 = 'Ok' }
[PSCustomObject] @{ Test = 1; Test2 = 'Test'; Test3 = 'Ok' }
)
$Test = New-HTML {
    New-HTMLText -Text 'This is a test', ' another test' -FontSize 30pt
    New-HTMLTable -DataTable $Objects -simplify
} -Online

ConvertFrom-HTMLToWord -OutputFile $PSScriptRoot\Documents\TestHTML.docx -HTML $Test -Show
```

---

### Parameters
#### **OutputFile**
Path to the file to save converted HTML

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **FileHTML**
Input HTML loaded straight from file

|Type      |Required|Position|PipelineInput|Aliases  |
|----------|--------|--------|-------------|---------|
|`[String]`|true    |named   |false        |InputFile|

#### **SourceHTML**
Input HTML loaded from string

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |named   |false        |HTML   |

#### **Show**
Once conversion ends show the resulting document

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
ConvertFrom-HTMLtoWord -OutputFile <String> -SourceHTML <String> -Show [<CommonParameters>]
```
```PowerShell
ConvertFrom-HTMLtoWord -OutputFile <String> -FileHTML <String> -Show [<CommonParameters>]
```
