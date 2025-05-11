Remove-WhiteSpace
-----------------

### Synopsis
Removes leading, trailing, and extra white spaces from a given text string.

---

### Description

The Remove-WhiteSpace function removes any leading, trailing, and extra white spaces from the input text string. It ensures that only single spaces separate words within the text.

---

### Examples
> EXAMPLE 1

```PowerShell
$MyValue = Remove-WhiteSpace -Text '   My    Field  '
# $MyValue now contains 'My Field'
```

---

### Parameters
#### **Text**
The input text string from which white spaces are to be removed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Syntax
```PowerShell
Remove-WhiteSpace [[-Text] <String>] [<CommonParameters>]
```
