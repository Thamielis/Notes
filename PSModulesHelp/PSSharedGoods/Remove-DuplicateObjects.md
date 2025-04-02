Remove-DuplicateObjects
-----------------------

### Synopsis
Removes duplicate objects from a list based on specified properties.

---

### Description

This function removes duplicate objects from the input list based on the specified properties. It retains only unique objects in the list.

---

### Examples
> EXAMPLE 1

```PowerShell
$Array = @()
$Array += [PSCustomObject] @{ 'Name' = 'Test'; 'Val1' = 'Testor2'; 'Val2' = 'Testor2'}
$Array += [PSCustomObject] @{ 'Name' = 'Test'; 'Val1' = 'Testor2'; 'Val2' = 'Testor2'}
$Array += [PSCustomObject] @{ 'Name' = 'Test1'; 'Val1' = 'Testor2'; 'Val2' = 'Testor2'}
$Array += [PSCustomObject] @{ 'Name' = 'Test1'; 'Val1' = 'Testor2'; 'Val2' = 'Testor2'}
Write-Color 'Before' -Color Red
$Array | Format-Table -A

Write-Color 'After' -Color Green
$Array = $Array | Sort-Object -Unique -Property 'Name', 'Val1','Val2'
$Array | Format-Table -AutoSize
```

---

### Parameters
#### **Object**
The list of objects to remove duplicates from.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[IList]`|false   |1       |false        |

#### **Property**
The properties to consider when identifying duplicates.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

---

### Notes
This function removes duplicate objects from a list based on specified properties.

---

### Syntax
```PowerShell
Remove-DuplicateObjects [[-Object] <IList>] [[-Property] <String[]>] [<CommonParameters>]
```
