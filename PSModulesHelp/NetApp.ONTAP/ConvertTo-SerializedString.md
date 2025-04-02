ConvertTo-SerializedString
--------------------------

### Synopsis
Convert any .NET object that is marked as Serializable to a Base64-encoded string.

---

### Description

Convert any .NET object that is marked as Serializable to a Base64-encoded string.

This cmdlet is the companion of ConvertFrom-SerializedString.

---

### Related Links
* [ConvertFrom-SerializedString](ConvertFrom-SerializedString)

---

### Examples
> Example 1

```PowerShell
$str = Connect-NaController dunn | ConvertTo-SerializedString
Save a controller connection context for use later.
```

---

### Parameters
#### **Input**
The serializable object.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Object]`|true    |1       |true (ByValue)|

---

### Inputs

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes
Category: toolkit

---

### Syntax
```PowerShell
ConvertTo-SerializedString [-Input] <Object> [<CommonParameters>]
```
