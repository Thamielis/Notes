Format-String
-------------

### Synopsis
Replaces text in a string based on named replacement tags

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
Format-String "Hello {NAME}" @{ NAME = 'PowerShell' }
Hello PowerShell
```
> EXAMPLE 2

```PowerShell
Format-String "Your score is {SCORE:P}" @{ SCORE = 0.85 }
Your score is 85.00 %
```

---

### Parameters
#### **String**
The string to format. Any portions in the form of {NAME}
will be automatically replaced by the corresponding value
from  the supplied hashtable.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **Replacements**
The named replacements to use in the string

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |2       |false        |

---

### Syntax
```PowerShell
Format-String [[-String] <Object>] [[-Replacements] <Hashtable>] [<CommonParameters>]
```
