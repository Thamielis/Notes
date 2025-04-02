Convert-UserAccountControl
--------------------------

### Synopsis
Converts the UserAccountControl flags to their corresponding names.

---

### Description

This function takes a UserAccountControl value and converts it into a human-readable format by matching the flags to their corresponding names.

---

### Examples
> EXAMPLE 1

```PowerShell
Convert-UserAccountControl -UserAccountControl 66048
Outputs: "DONT_EXPIRE_PASSWORD, PASSWORD_EXPIRED"
```
> EXAMPLE 2

```PowerShell
Convert-UserAccountControl -UserAccountControl 512 -Separator ', '
Outputs: "NORMAL_ACCOUNT"
```

---

### Parameters
#### **UserAccountControl**
Specifies the UserAccountControl value to be converted.

|Type     |Required|Position|PipelineInput|Aliases|
|---------|--------|--------|-------------|-------|
|`[Int32]`|false   |1       |false        |UAC    |

#### **Separator**
Specifies the separator to use when joining the converted flags. If not provided, the flags will be returned as a list.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

---

### Syntax
```PowerShell
Convert-UserAccountControl [[-UserAccountControl] <Int32>] [[-Separator] <String>] [<CommonParameters>]
```
