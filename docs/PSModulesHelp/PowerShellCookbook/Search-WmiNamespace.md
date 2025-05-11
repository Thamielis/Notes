Search-WmiNamespace
-------------------

### Synopsis
Search the WMI classes installed on the system for the provided match text.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
Search-WmiNamespace Registry
Searches WMI for any classes or descriptions that mention "Registry"
```
> EXAMPLE 2

```PowerShell
Search-WmiNamespace Process ClassName,PropertyName
Searchs WMI for any classes or properties that mention "Process"
```
> EXAMPLE 3

```PowerShell
Search-WmiNamespace CPU -Detailed
Searches WMI for any class names, descriptions, or properties that mention
"CPU"
```

---

### Parameters
#### **Pattern**
The pattern to search for

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Detailed**
Switch parameter to look for class names, descriptions, or properties

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Full**
Switch parameter to look for class names, descriptions, properties, and
property description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **MatchOptions**
Custom match options.
Supports any or all of the following match options:
ClassName, ClassDescription, PropertyName, PropertyDescription

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

---

### Syntax
```PowerShell
Search-WmiNamespace [-Pattern] <String> [-Detailed] [-Full] [[-MatchOptions] <String[]>] [<CommonParameters>]
```
