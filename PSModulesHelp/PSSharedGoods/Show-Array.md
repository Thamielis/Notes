Show-Array
----------

### Synopsis
Displays the elements of an ArrayList with optional type information.

---

### Description

The Show-Array function displays each element of the provided ArrayList. Optionally, it can also show the type of each element.

---

### Examples
> EXAMPLE 1

```PowerShell
$myList = New-Object System.Collections.ArrayList
$myList.Add("Apple")
$myList.Add(42)
Show-Array -List $myList
# Output:
# Apple
# 42
```
> EXAMPLE 2

```PowerShell
$myList = New-Object System.Collections.ArrayList
$myList.Add("Banana")
$myList.Add(3.14)
Show-Array -List $myList -WithType
# Output:
# Banana (Type: String)
# 3.14 (Type: Double)
```

---

### Parameters
#### **List**
Specifies the ArrayList containing the elements to display.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[ArrayList]`|false   |1       |false        |

#### **WithType**
Switch parameter to include type information along with each element.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Show-Array [[-List] <ArrayList>] [-WithType] [<CommonParameters>]
```
