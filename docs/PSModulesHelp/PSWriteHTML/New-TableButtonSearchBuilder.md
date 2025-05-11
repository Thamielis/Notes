New-TableButtonSearchBuilder
----------------------------

### Synopsis
Creates a configuration object for a table button search builder.

---

### Description

This function creates a configuration object for a table button search builder with customizable options.

---

### Examples
> EXAMPLE 1

```PowerShell
New-TableButtonSearchBuilder -ButtonName "Search" -DepthLimit 3 -DefaultLogic "AND" -GreyScale
Creates a search builder button named "Search" with a depth limit of 3, default logic set to "AND", and displayed in greyscale.
```
> EXAMPLE 2

```PowerShell
New-TableButtonSearchBuilder -ButtonName "Filter" -DefaultLogic "OR"
Creates a search builder button named "Filter" with default logic set to "OR".
```

---

### Parameters
#### **ButtonName**
The name of the button to be displayed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **DepthLimit**
The depth limit for the search builder.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |false        |

#### **DefaultLogic**
The default logic to be applied.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **GreyScale**
Indicates if the search builder should be displayed in greyscale.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
New-TableButtonSearchBuilder [[-ButtonName] <String>] [[-DepthLimit] <Int32>] [[-DefaultLogic] <String>] [-GreyScale] [<CommonParameters>]
```
