Convert-ToDateTime
------------------

### Synopsis
Converts a file time string to a DateTime object.

---

### Description

This function converts a file time string to a DateTime object. It handles the conversion and provides flexibility to ignore specific file time strings.

---

### Examples
> EXAMPLE 1

```PowerShell
Convert-ToDateTime -Timestring '132479040000000000'
# Converts the file time string '132479040000000000' to a DateTime object.
```
> EXAMPLE 2

```PowerShell
Convert-ToDateTime -Timestring '132479040000000000' -Ignore '*1601*'
# Converts the file time string '132479040000000000' to a DateTime object, ignoring any file time strings containing '1601'.
```

---

### Parameters
#### **Timestring**
Specifies the file time string to convert to a DateTime object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Ignore**
Specifies a pattern to ignore specific file time strings. Default is '*1601*'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

---

### Syntax
```PowerShell
Convert-ToDateTime [[-Timestring] <String>] [[-Ignore] <String>] [<CommonParameters>]
```
