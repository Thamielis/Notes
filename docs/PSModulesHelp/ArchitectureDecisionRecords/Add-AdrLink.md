Add-AdrLink
-----------

### Synopsis
Adds an link between two ADRs.

---

### Description

Adds a link between two ADRs, optionally with a reverse link.

---

### Examples
> EXAMPLE 1

```PowerShell
Add-AdrLink -FromNumber 1 -ToNumber 2 -FromLink "Linked" -ToLink "Linked"
```
> EXAMPLE 2

```PowerShell
Add-AdrLink -FromNumber 1 -ToNumber 2 -FromLink "Superseded by" -ToLink "Supersedes"
```

---

### Parameters
#### **FromNumber**
The number of the ADR to link from.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |1       |false        |

#### **FromLink**
The text to prefix the forward link with.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **ToNumber**
The number of the ADR to link to.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |3       |false        |

#### **ToLink**
The text to prefix the reverse link with. If not specified the To ADR will not be modified.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

---

### Syntax
```PowerShell
Add-AdrLink [-FromNumber] <Int32> [-FromLink] <String> [-ToNumber] <Int32> [[-ToLink] <String>] [<CommonParameters>]
```
