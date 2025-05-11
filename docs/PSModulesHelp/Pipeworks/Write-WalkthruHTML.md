Write-WalkthruHTML
------------------

### Synopsis
Writes a walkthru HTML file

---

### Description

Writes a section of HTML to walk thru a set of code.

---

### Related Links
* [Get-Walkthru
Write-ScriptHTML](Get-Walkthru
Write-ScriptHTML)

---

### Examples
> EXAMPLE 1

```PowerShell
Write-WalkthruHTML -Text @"
#a simple demo
Get-Help about_walkthruFiles
"@
```

---

### Parameters
#### **ScriptBlock**
The text used to generate walkthrus

|Type           |Required|Position|PipelineInput |
|---------------|--------|--------|--------------|
|`[ScriptBlock]`|true    |1       |true (ByValue)|

#### **WalkThru**
A walkthru object, containing a source file and a property named
walkthru with several walkthru steps

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[PSObject]`|true    |1       |true (ByValue)|

#### **StepByStep**
with a different step on each layer

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |2       |false        |

#### **RunDemo**
If set, will run each demo step

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |3       |false        |

#### **OutputAsHtml**
If set, output will be treated as HTML.  Otherwise, output will be piped to Out-String and embedded in <pre> tags.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |4       |false        |

#### **WalkthruName**
If set, will start with walkthru with a <h3></h3> tag, or include the walkthru name on each step

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **DirectlyEmbedExplanation**
If set, will embed the explanation as text, instead of converting it to markdown.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |6       |false        |

#### **OnlyStep**
If provided, will only include certain steps

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[UInt32[]]`|false   |7       |false        |

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Syntax
```PowerShell
Write-WalkthruHTML [-ScriptBlock] <ScriptBlock> [[-StepByStep]] [[-RunDemo]] [[-OutputAsHtml]] [[-WalkthruName] <String>] [[-DirectlyEmbedExplanation]] [[-OnlyStep] <UInt32[]>] [<CommonParameters>]
```
```PowerShell
Write-WalkthruHTML [-WalkThru] <PSObject> [[-StepByStep]] [[-RunDemo]] [[-OutputAsHtml]] [[-WalkthruName] <String>] [[-DirectlyEmbedExplanation]] [[-OnlyStep] <UInt32[]>] [<CommonParameters>]
```
