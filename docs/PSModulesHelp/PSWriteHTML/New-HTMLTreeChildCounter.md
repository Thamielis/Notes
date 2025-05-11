New-HTMLTreeChildCounter
------------------------

### Synopsis
Creates a new HTML tree child counter object with specified options.

---

### Description

This function creates a new HTML tree child counter object with the ability to customize its behavior using the provided parameters.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLTreeChildCounter -Deep
Creates a new HTML tree child counter object that counts child elements recursively.
```
> EXAMPLE 2

```PowerShell
New-HTMLTreeChildCounter -HideZero -HideExpanded
Creates a new HTML tree child counter object that hides counters for child elements with a count of zero and expanded child elements.
```

---

### Parameters
#### **Deep**
Indicates whether to count child elements recursively.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **HideZero**
Indicates whether to hide counters for child elements with a count of zero.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **HideExpanded**
Indicates whether to hide counters for expanded child elements.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
New-HTMLTreeChildCounter [-Deep] [-HideZero] [-HideExpanded] [<CommonParameters>]
```
