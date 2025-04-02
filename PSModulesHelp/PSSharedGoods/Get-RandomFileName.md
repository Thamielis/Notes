Get-RandomFileName
------------------

### Synopsis
Generates a random file name with a specified length and extension.

---

### Description

This function generates a random file name with a specified length and extension. The file name is created using random letters only.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-RandomFileName -Length 8 -Extension "txt"
Generates a random file name with a length of 8 characters and appends the extension ".txt".
```
> EXAMPLE 2

```PowerShell
Get-RandomFileName -Extension "docx"
Generates a random file name with a default length of 16 characters and appends the extension ".docx".
```

---

### Parameters
#### **Length**
The length of the random file name to generate. Default is 16.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **Extension**
The extension to append to the random file name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

---

### Syntax
```PowerShell
Get-RandomFileName [[-Length] <Object>] [[-Extension] <Object>] [<CommonParameters>]
```
