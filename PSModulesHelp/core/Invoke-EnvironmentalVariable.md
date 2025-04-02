Invoke-EnvironmentalVariable
----------------------------

### Synopsis
Short description

---

### Description

Long description

---

### Examples
> EXAMPLE 1

```PowerShell
Example of how to use this cmdlet
```
> EXAMPLE 2

```PowerShell
Another example of how to use this cmdlet
```

---

### Parameters
#### **Name**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Value**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **Scope**

Valid Values:

* Machine
* User
* Process

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Action**

Valid Values:

* Get
* Set
* Remove
* New

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Syntax
```PowerShell
Invoke-EnvironmentalVariable [-Name] <String> [[-Value] <Object>] [[-Scope] <String>] [-Action <String>] [<CommonParameters>]
```
