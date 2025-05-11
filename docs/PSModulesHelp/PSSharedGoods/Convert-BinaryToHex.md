Convert-BinaryToHex
-------------------

### Synopsis
Converts an array of binary numbers to hexadecimal format.

---

### Description

This function takes an array of binary numbers and converts them to hexadecimal format.

---

### Examples
> EXAMPLE 1

```PowerShell
Convert-BinaryToHex -Binary 1101 1010
Converts the binary numbers 1101 and 1010 to hexadecimal format.
```
> EXAMPLE 2

1101 1010 | Convert-BinaryToHex
Converts the binary numbers 1101 and 1010 piped into the function to hexadecimal format.

---

### Parameters
#### **Binary**
Specifies the array of binary numbers to be converted to hexadecimal.

|Type      |Required|Position|PipelineInput |Aliases|
|----------|--------|--------|--------------|-------|
|`[Byte[]]`|false   |1       |true (ByValue)|Bin    |

---

### Syntax
```PowerShell
Convert-BinaryToHex [[-Binary] <Byte[]>] [<CommonParameters>]
```
