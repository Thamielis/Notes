Convert-BinaryToString
----------------------

### Synopsis
Converts an array of binary numbers to a string.

---

### Description

This function takes an array of binary numbers and converts them to a string using Unicode encoding.

---

### Examples
> EXAMPLE 1

```PowerShell
Convert-BinaryToString -Binary 01001000 01100101 01101100 01101100 01101111
Converts the binary numbers to the string "Hello".
```
> EXAMPLE 2

01001000 01100101 01101100 01101100 01101111 | Convert-BinaryToString
Converts the binary numbers piped into the function to the string "Hello".

---

### Parameters
#### **Binary**
Specifies the array of binary numbers to be converted to a string.

|Type      |Required|Position|PipelineInput |Aliases|
|----------|--------|--------|--------------|-------|
|`[Byte[]]`|false   |1       |true (ByValue)|Bin    |

---

### Syntax
```PowerShell
Convert-BinaryToString [[-Binary] <Byte[]>] [<CommonParameters>]
```
