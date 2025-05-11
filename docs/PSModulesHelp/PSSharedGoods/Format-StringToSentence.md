Format-StringToSentence
-----------------------

### Synopsis
Formats a given string by adding spaces before uppercase letters, digits, and non-word characters.

---

### Description

The Format-AddSpaceToSentence function takes a string or an array of strings
and adds a space before each uppercase letter, digit, and non-word character (excluding dots, spaces, and underscores).
It also provides options to convert the string to lowercase, remove certain characters before or after the formatting, and remove double spaces.

---

### Examples
> EXAMPLE 1

```PowerShell
$test = @(
    'OnceUponATime',
    'OnceUponATime1',
    'Money@Risk',
    'OnceUponATime123',
    'AHappyMan2014'
    'OnceUponATime_123'
    'Domain test.com'
)
Format-StringToSentence -Text $Test -RemoveCharsAfter '_' -RemoveDoubleSpaces

This example formats each string in the $test array, removes any underscores after the formatting, and removes any double spaces.
```
> EXAMPLE 2

```PowerShell
$test = @(
    'OnceUponATime',
    'OnceUponATime1',
    'Money@Risk',
    'OnceUponATime123',
    'AHappyMan2014'
    'OnceUponATime_123'
    'Domain test.com'
)
$Test | Format-StringToSentence -ToLowerCase -RemoveCharsAfter '_' -RemoveDoubleSpaces

This example does the same as the previous one, but also converts each string to lowercase.
```
> EXAMPLE 3

```PowerShell
$test = @(
    'OnceUponATime',
    'OnceUponATime1',
    'Money@Risk',
    'OnceUponATime123',
    'AHappyMan2014'
    'OnceUponATime_123'
    'Domain test.com'
)
Format-StringToSentence -Text $Test -RemoveCharsAfter '_' -RemoveDoubleSpaces -MakeWordsUpperCase 'test.com', 'money'
```

---

### Parameters
#### **Text**
The string or array of strings to be formatted.

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[String[]]`|false   |1       |true (ByValue)|

#### **RemoveCharsBefore**
An array of characters to be removed from the string before the formatting is applied.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **RemoveCharsAfter**
An array of characters to be removed from the string after the formatting is applied.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **ToLowerCase**
If this switch is present, the function will convert the string to lowercase.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RemoveDoubleSpaces**
If this switch is present, the function will remove any double spaces from the string.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **MakeWordsUpperCase**
An array of words that should be converted to uppercase after the formatting is applied.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **DisableAddingSpace**
If this switch is present, the function will not add spaces before uppercase letters, digits, and non-word characters.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
The function uses the -creplace operator to add spaces, which is case-insensitive. Therefore, it will add spaces before both uppercase and lowercase letters if they are specified in the RemoveCharsBefore or RemoveCharsAfter parameters.

---

### Syntax
```PowerShell
Format-StringToSentence [[-Text] <String[]>] [-RemoveCharsBefore <String[]>] [-RemoveCharsAfter <String[]>] [-ToLowerCase] [-RemoveDoubleSpaces] [-MakeWordsUpperCase <String[]>] [-DisableAddingSpace] [<CommonParameters>]
```
