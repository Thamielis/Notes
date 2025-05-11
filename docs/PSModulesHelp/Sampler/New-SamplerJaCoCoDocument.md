New-SamplerJaCoCoDocument
-------------------------

### Synopsis
Creates a new JaCoCo XML document based on the provided missed and hit
lines.

---

### Description

Creates a new JaCoCo XML document based on the provided missed and hit
lines. This command is usually used together with the output object from
Pester that also have been passed through ModuleBuilder's Convert-LineNumber.

---

### Examples
> EXAMPLE 1

```PowerShell
$pesterObject = Invoke-Pester ./tests/unit -CodeCoverage
$pesterObject.CodeCoverage.MissedCommands |
    Convert-LineNumber -ErrorAction 'Stop' -PassThru | Out-Null
$pesterObject.CodeCoverage.HitCommands |
    Convert-LineNumber -ErrorAction 'Stop' -PassThru | Out-Null
New-SamplerJaCoCoDocument `
    -MissedCommands $pesterObject.CodeCoverage.MissedCommands `
    -HitCommands $pesterObject.CodeCoverage.HitCommands `
    -PackageName 'source'
```
> EXAMPLE 2

```PowerShell
New-SamplerJaCoCoDocument `
    -MissedCommands @{
        Class            = 'ResourceBase'
        Function         = 'Compare'
        HitCount         = 0
        SourceFile       = '.\Classes\001.ResourceBase.ps1'
        SourceLineNumber = 4
    } `
    -HitCommands @{
        Class            = 'ResourceBase'
        Function         = 'Compare'
        HitCount         = 2
        SourceFile       = '.\Classes\001.ResourceBase.ps1'
        SourceLineNumber = 3
    } `
    -PackageName 'source'
```

---

### Parameters
#### **MissedCommands**
An array of PSCustomObject that contain all the missed code lines.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Object[]]`|true    |1       |false        |

#### **HitCommands**
An array of PSCustomObject that contain all the code lines that were hit.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Object[]]`|true    |2       |false        |

#### **PackageName**
The name of package of the test source files, e.g. 'source', 'MyFunction',
or '2.3.0'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

#### **PackageDisplayName**
The display name of the package if it should be shown to the user differently,
e.g. 'source' if the package name is '2.3.0'. Defaults to the same value as
PackageName.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

---

### Outputs
* [Xml.XmlDocument](https://learn.microsoft.com/en-us/dotnet/api/System.Xml.XmlDocument)

---

### Syntax
```PowerShell
New-SamplerJaCoCoDocument [-MissedCommands] <Object[]> [-HitCommands] <Object[]> [-PackageName] <String> [[-PackageDisplayName] <String>] [<CommonParameters>]
```
