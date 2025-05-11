Get-FileName
------------

### Synopsis
Generates a temporary file name with the specified extension.

---

### Description

This function generates a temporary file name based on the provided extension.
It can generate a temporary file name in the system's temporary folder or just the file name itself.

---

### Examples
> EXAMPLE 1

Get-FileName
Generates a temporary file name in the system's temporary folder.
Example output: C:\Users\przemyslaw.klys\AppData\Local\Temp\3ymsxvav.tmp
> EXAMPLE 2

Get-FileName -Temporary
Generates a temporary file name in the system's temporary folder.
Example output: C:\Users\przemyslaw.klys\AppData\Local\Temp\3ymsxvav.tmp
> EXAMPLE 3

Get-FileName -Temporary -Extension 'xlsx'
Generates a temporary file name with the specified extension in the system's temporary folder.
Example output: C:\Users\przemyslaw.klys\AppData\Local\Temp\3ymsxvav.xlsx
> EXAMPLE 4

Get-FileName -Name 'MyFile' -Temporary
Generates a temporary file name with the specified name in the system's temporary folder.
Example output: C:\Users\przemyslaw.klys\AppData\Local\Temp\MyFile_3ymsxvav.xlsx
> EXAMPLE 5

```PowerShell
Get-FileName -Extension 'xlsx' -TemporaryFileOnly
Generates a temporary file name with the specified extension without the path.
Example output: 3ymsxvav.xlsx
```
> EXAMPLE 6

```PowerShell
Get-FileName -Name 'MyFile' -TemporaryFileOnly
Generates a temporary file name with the specified name without the path.
Example output: MyFile_3ymsxvav.xlsx
```
> EXAMPLE 7

```PowerShell
Get-FileName -Name 'MyFile' -Extension 'xlsx'
Generates a temporary file name with the specified name and extension.
Example output: C:\Users\przemyslaw.klys\AppData\Local\Temp\MyFile.xlsx
```

---

### Parameters
#### **Name**
Specifies the name of the temporary file. If not specified, the function generates a random file name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Extension**
Specifies the extension for the temporary file name. Default is 'tmp'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Temporary**
Indicates whether to generate a temporary file name in the system's temporary folder.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **TemporaryFileOnly**
Indicates whether to generate only the temporary file name without the path.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-FileName [[-Name] <String>] [[-Extension] <String>] [-Temporary] [-TemporaryFileOnly] [<CommonParameters>]
```
