New-TableButtonColumnVisibility
-------------------------------

### Synopsis

New-TableButtonColumnVisibility [[-ButtonName] <string>] [[-CollectionTitle] <string>] [[-CollectionPosition] <string>] [[-CollectionLayout] <string>] [[-Fade] <int>] [-DropUp] [<CommonParameters>]

---

### Description

---

### Parameters
#### **ButtonName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |0       |false        |

#### **CollectionLayout**

Valid Values:

* columns
* two-column
* three-column
* four-column

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |3       |false        |

#### **CollectionPosition**

Valid Values:

* fixed
* dropdown

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |2       |false        |

#### **CollectionTitle**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |1       |false        |

#### **DropUp**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Fade**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |4       |false        |

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
{@{name=New-TableButtonColumnVisibility; CommonParameters=True; parameter=System.Object[]}}
```
