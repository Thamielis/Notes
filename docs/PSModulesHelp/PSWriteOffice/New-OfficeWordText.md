New-OfficeWordText
------------------

### Synopsis

New-OfficeWordText -Document <WordDocument> [-Text <string[]>] [-Bold <Nullable[bool][]>] [-Italic <Nullable[bool][]>] [-Underline <Nullable[UnderlineValues][]>] [-Color <string[]>] [-Alignment <JustificationValues>] [-Style <WordParagraphStyles>] [-ReturnObject] [<CommonParameters>]

New-OfficeWordText -Paragraph <WordParagraph> [-Document <WordDocument>] [-Text <string[]>] [-Bold <Nullable[bool][]>] [-Italic <Nullable[bool][]>] [-Underline <Nullable[UnderlineValues][]>] [-Color <string[]>] [-Alignment <JustificationValues>] [-Style <WordParagraphStyles>] [-ReturnObject] [<CommonParameters>]

---

### Description

---

### Parameters
#### **Alignment**

Valid Values:

* Left
* Start
* Center
* Right
* End
* Both
* MediumKashida
* Distribute
* NumTab
* HighKashida
* LowKashida
* ThaiDistribute

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[JustificationValues]`|false   |Named   |false        |

#### **Bold**

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[Nullable[bool][]]`|false   |Named   |false        |

#### **Color**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |Named   |false        |

#### **Document**

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[WordDocument]`|true    |Named   |false        |

#### **Italic**

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[Nullable[bool][]]`|false   |Named   |false        |

#### **Paragraph**

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[WordParagraph]`|true    |Named   |false        |

#### **ReturnObject**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Style**

Valid Values:

* Normal
* Heading1
* Heading2
* Heading3
* Heading4
* Heading5
* Heading6
* Heading7
* Heading8
* Heading9
* ListParagraph

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[WordParagraphStyles]`|false   |Named   |false        |

#### **Text**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |Named   |false        |

#### **Underline**

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[Nullable[UnderlineValues][]]`|false   |Named   |false        |

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
{@{name=New-OfficeWordText; CommonParameters=True; parameter=System.Object[]}, @{name=New-OfficeWordText; CommonParameters=True; paramet…
```
