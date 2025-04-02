ConvertTo-Hex
-------------

### Synopsis
Helper cmdlet that converts binary input to a hexadecimal string.

---

### Description

Converts a byte array to its hexadecimal representation.

---

### Related Links
* [Online Version:](https://github.com/MichaelGrafnetter/DSInternals/blob/master/Documentation/PowerShell/ConvertTo-Hex.md)

---

### Examples
> Example 1

```PowerShell
PS C:\> ConvertTo-Hex -Input 0,255,32
00ff20
Converts the byte array to its hexadecimal representation, using lowercase characters.
```
> Example 2

```PowerShell
PS C:\> ConvertTo-Hex -Input 0,255,32 -UpperCase
00FF20
Converts the byte array to its hexadecimal representation, using uppercase characters.
```

---

### Parameters
#### **Input**
Specifies the binary input in the form of an array of bytes.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Byte[]]`|true    |0       |True (ByValue)|

#### **UpperCase**
Indicates that the output should be encoded using uppercase characters instead of lowercase ones.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
System.Byte[]

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes

---

### Syntax
```PowerShell
ConvertTo-Hex [-Input] <Byte[]> [-UpperCase] [<CommonParameters>]
```
