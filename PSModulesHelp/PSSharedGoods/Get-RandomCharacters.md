Get-RandomCharacters
--------------------

### Synopsis
Generates a random string of characters from a specified character set.

---

### Description

This function generates a random string of characters from a specified character set with the given length.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-RandomCharacters -length 8 -characters 'abcdef123'
Generates a random string of 8 characters from the character set 'abcdef123'.
```
> EXAMPLE 2

```PowerShell
Get-RandomCharacters -length 12 -characters 'ABC123!@#'
Generates a random string of 12 characters from the character set 'ABC123!@#'.
```

---

### Parameters
#### **length**
The length of the random string to generate.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |1       |false        |

#### **characters**
The set of characters from which to generate the random string.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

---

### Syntax
```PowerShell
Get-RandomCharacters [[-length] <Int32>] [[-characters] <String>] [<CommonParameters>]
```
