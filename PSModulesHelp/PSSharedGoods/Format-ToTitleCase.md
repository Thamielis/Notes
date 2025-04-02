Format-ToTitleCase
------------------

### Synopsis
Formats string or number of strings to Title Case

---

### Description

Formats string or number of strings to Title Case allowing for prettty display

---

### Examples
> EXAMPLE 1

```PowerShell
Format-ToTitleCase 'me'
Output:
Me
```
> EXAMPLE 2

```PowerShell
'me i feel good' | Format-ToTitleCase
Output:
Me I Feel Good
Not Feel
```
> EXAMPLE 3

```PowerShell
'me i feel', 'not feel' | Format-ToTitleCase
Output:
Me I Feel Good
Not Feel
```
> EXAMPLE 4

```PowerShell
Format-ToTitleCase -Text 'This is my thing' -RemoveWhiteSpace
Output:
ThisIsMyThing
```
> EXAMPLE 5

```PowerShell
Format-ToTitleCase -Text "This is my thing: That - No I don't want all chars" -RemoveWhiteSpace -RemoveChar ',', '-', "'", '\(', '\)', ':'
```

---

### Parameters
#### **Text**
Sentence or multiple sentences to format

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[String[]]`|true    |1       |true (ByValue)|

#### **RemoveWhiteSpace**
Removes spaces after formatting string to Title Case.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RemoveChar**
Array of characters to remove

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Format-ToTitleCase [-Text] <String[]> [-RemoveWhiteSpace] [-RemoveChar <String[]>] [<CommonParameters>]
```
