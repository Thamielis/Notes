Get-FileOwner
-------------

### Synopsis
Retrieves the owner of the specified file or folder.

---

### Description

This function retrieves the owner of the specified file or folder. It provides options to resolve the owner's identity and output the results as a hashtable or custom object.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-FileOwner -Path "C:\Example\File.txt"
Retrieves the owner of the specified file "File.txt".
```
> EXAMPLE 2

```PowerShell
Get-FileOwner -Path "C:\Example" -Recursive
Retrieves the owners of all files in the "Example" directory and its subdirectories.
```
> EXAMPLE 3

Get-FileOwner -Path "C:\Example\File.txt" -Resolve
Retrieves the owner of the specified file "File.txt" and resolves the owner's identity.
> EXAMPLE 4

```PowerShell
Get-FileOwner -Path "C:\Example\File.txt" -AsHashTable
Retrieves the owner of the specified file "File.txt" and outputs the result as a hashtable.
```

---

### Parameters
#### **Path**
Specifies the path to the file or folder.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Array]`|false   |1       |false        |

#### **Recursive**
Indicates whether to search for files recursively in subdirectories.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **JustPath**
Specifies if only the path information should be returned.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Resolve**
Indicates whether to resolve the owner's identity.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsHashTable**
Specifies if the output should be in hashtable format.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-FileOwner [[-Path] <Array>] [-Recursive] [-JustPath] [-Resolve] [-AsHashTable] [<CommonParameters>]
```
