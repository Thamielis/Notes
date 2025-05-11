Find-MyProgramData
------------------

### Synopsis
Finds specific data within a given array of strings.

---

### Description

This function searches for a specific text within an array of strings and returns the second element of the string that matches the search criteria.

---

### Examples
> EXAMPLE 1

```PowerShell
Find-MyProgramData -Data @("Program A 123", "Program B 456", "Program C 789") -FindText "B"
This example will return "456" as it finds the string containing "B" and returns the second element of that string.
```

---

### Parameters
#### **Data**
The array of strings to search through.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **FindText**
The text to search for within the array of strings.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

---

### Syntax
```PowerShell
Find-MyProgramData [[-Data] <Object>] [[-FindText] <Object>] [<CommonParameters>]
```
