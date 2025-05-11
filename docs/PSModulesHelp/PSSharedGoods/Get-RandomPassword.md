Get-RandomPassword
------------------

### Synopsis
Generates a random password with a specified number of lowercase letters, uppercase letters, numbers, and special characters.

---

### Description

This function generates a random password with a customizable combination of lowercase letters, uppercase letters, numbers, and special characters.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-RandomPassword -LettersLowerCase 4 -LettersHigherCase 2 -Numbers 1 -SpecialChars 0 -SpecialCharsLimited 1
Generates a random password with 4 lowercase letters, 2 uppercase letters, 1 number, and 1 limited special character.
```
> EXAMPLE 2

```PowerShell
Get-RandomPassword -LettersLowerCase 3 -LettersHigherCase 3 -Numbers 2 -SpecialChars 2 -SpecialCharsLimited 1
Generates a random password with 3 lowercase letters, 3 uppercase letters, 2 numbers, 2 special characters, and 1 limited special character.
```

---

### Parameters
#### **LettersLowerCase**
Specifies the number of lowercase letters to include in the password.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |1       |false        |

#### **LettersHigherCase**
Specifies the number of uppercase letters to include in the password.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |false        |

#### **Numbers**
Specifies the number of numbers to include in the password.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |3       |false        |

#### **SpecialChars**
Specifies the number of special characters to include in the password.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |4       |false        |

#### **SpecialCharsLimited**
Specifies the number of limited special characters to include in the password.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |5       |false        |

---

### Syntax
```PowerShell
Get-RandomPassword [[-LettersLowerCase] <Int32>] [[-LettersHigherCase] <Int32>] [[-Numbers] <Int32>] [[-SpecialChars] <Int32>] [[-SpecialCharsLimited] <Int32>] [<CommonParameters>]
```
