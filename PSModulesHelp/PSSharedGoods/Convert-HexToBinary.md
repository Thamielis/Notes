Convert-HexToBinary
-------------------

### Synopsis
Converts a hexadecimal string to a binary representation.

---

### Description

This function takes a hexadecimal string as input and converts it to a binary representation.

---

### Examples
> EXAMPLE 1

```PowerShell
Convert-HexToBinary -Hex "1A"
# Outputs: 00011010
```
> EXAMPLE 2

```PowerShell
"1A" | Convert-HexToBinary
# Outputs: 00011010
```

---

### Parameters
#### **Hex**
Specifies the hexadecimal string to convert to binary.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|true    |1       |true (ByValue)|

---

### Syntax
```PowerShell
Convert-HexToBinary [-Hex] <String> [<CommonParameters>]
```
