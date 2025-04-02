ConvertFrom-ScriptBlock
-----------------------

### Synopsis
Converts a ScriptBlock into an array of strings, each representing a line of the script block.

---

### Description

This function takes a ScriptBlock as input and converts it into an array of strings, where each string represents a line of the script block.

---

### Examples
> EXAMPLE 1

```PowerShell
ConvertFrom-ScriptBlock -ScriptBlock {
    $Variable1 = "Value1"
    $Variable2 = "Value2"
    Write-Host "Hello, World!"
}
This example will output an array containing the following strings:
$Variable1 = "Value1"
$Variable2 = "Value2"
Write-Host "Hello, World!"
```

---

### Parameters
#### **ScriptBlock**
The ScriptBlock to be converted into an array of strings.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
ConvertFrom-ScriptBlock [[-ScriptBlock] <ScriptBlock>] [<CommonParameters>]
```
