New-OfficeWordListItem
----------------------

### Synopsis

New-OfficeWordListItem [[-List] <WordList>] [[-Level] <int>] [[-Text] <string[]>] [[-Bold] <Nullable[bool][]>] [[-Italic] <Nullable[bool][]>] [[-Underline] <Nullable[UnderlineValues][]>] [[-Color] <string[]>] [[-Alignment] <JustificationValues>] [-Suppress] [<CommonParameters>]

---

### Description

---

### Parameters
#### **Alignment**

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[JustificationValues]`|false   |7       |false        |

#### **Bold**

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[Nullable[bool][]]`|false   |3       |false        |

#### **Color**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |6       |false        |

#### **Italic**

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[Nullable[bool][]]`|false   |4       |false        |

#### **Level**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |1       |false        |

#### **List**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[WordList]`|false   |0       |false        |

#### **Suppress**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Text**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |2       |false        |

#### **Underline**

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[Nullable[UnderlineValues][]]`|false   |5       |false        |

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
{@{name=New-OfficeWordListItem; CommonParameters=True; parameter=System.Object[]}}
```
