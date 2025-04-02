ConvertFrom-LanguageCode
------------------------

### Synopsis
Converts a language code to its corresponding language name.

---

### Description

This function takes a language code as input and returns the corresponding language name.

---

### Examples
> EXAMPLE 1

```PowerShell
ConvertFrom-LanguageCode -LanguageCode 1033
Returns: "English (United States)"
```
> EXAMPLE 2

```PowerShell
ConvertFrom-LanguageCode -LanguageCode 1041
Returns: "Japanese"
```

---

### Parameters
#### **LanguageCode**
The language code to convert to a language name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Syntax
```PowerShell
ConvertFrom-LanguageCode [[-LanguageCode] <String>] [<CommonParameters>]
```
