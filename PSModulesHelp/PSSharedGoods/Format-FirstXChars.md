Format-FirstXChars
------------------

### Synopsis
This function returns the first X characters of a given text string.

---

### Description

The Format-FirstXChars function takes a text string and a number of characters as input and returns the first X characters of the text string.

---

### Examples
> EXAMPLE 1

```PowerShell
Format-FirstXChars -Text "VERBOSE: Loading module from path 'C:\Users\pklys\.vscode\extensions\ms-vs" -NumberChars 15
# Returns: VERBOSE: Loading
```

---

### Parameters
#### **Text**
The input text string from which the first X characters will be extracted.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **NumberChars**
The number of characters to extract from the beginning of the input text string.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |false        |

---

### Notes
This function is useful for truncating long text strings to a specific length.

---

### Syntax
```PowerShell
Format-FirstXChars [[-Text] <String>] [[-NumberChars] <Int32>] [<CommonParameters>]
```
