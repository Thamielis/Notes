Convert-SamplerHashtableToString
--------------------------------

### Synopsis
Converts an Hashtable to its string representation, recursively.

---

### Description

Convert an Hashtable to a string representation.
For instance, this hashtable:
@{a=1;b=2; c=3; d=@{dd='abcd'}}
Becomes:
a=1; b=2; c=3; d={dd=abcd}

---

### Examples
> EXAMPLE 1

```PowerShell
Convert-SamplerhashtableToString -Hashtable @{a=1;b=2; c=3; d=@{dd='abcd'}}
```

---

### Parameters
#### **Hashtable**
Hashtable to convert to string.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |1       |false        |

---

### Notes
This command is not specific to Sampler projects, but is named that way
to avoid conflict with other modules.

---

### Syntax
```PowerShell
Convert-SamplerHashtableToString [[-Hashtable] <Hashtable>] [<CommonParameters>]
```
