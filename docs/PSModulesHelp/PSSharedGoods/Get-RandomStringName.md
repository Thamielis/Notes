Get-RandomStringName
--------------------

### Synopsis
Generates a random string of specified length with various options.

---

### Description

This function generates a random string of specified length with options to convert the case and include only letters.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-RandomStringName -Size 10
Generates a random string of length 10.
```
> EXAMPLE 2

```PowerShell
Get-RandomStringName -Size 8 -ToLower
Generates a random string of length 8 and converts it to lowercase.
```
> EXAMPLE 3

```PowerShell
Get-RandomStringName -Size 12 -ToUpper
Generates a random string of length 12 and converts it to uppercase.
```
> EXAMPLE 4

```PowerShell
Get-RandomStringName -Size 15 -LettersOnly
Generates a random string of length 15 with only letters.
```

---

### Parameters
#### **Size**
The length of the random string to generate. Default is 31.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |1       |false        |

#### **ToLower**
Convert the generated string to lowercase.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ToUpper**
Convert the generated string to uppercase.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **LettersOnly**
Generate a random string with only letters.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-RandomStringName [[-Size] <Int32>] [-ToLower] [-ToUpper] [-LettersOnly] [<CommonParameters>]
```
