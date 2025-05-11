Find-PSOneDuplicateFile
-----------------------

### Synopsis
Identifies files with duplicate content

---

### Description

Returns a hashtable with the hashes that have at least two files (duplicates)

---

### Related Links
* [https://powershell.one/tricks/filesystem/finding-duplicate-files](https://powershell.one/tricks/filesystem/finding-duplicate-files)

---

### Examples
> EXAMPLE 1

```PowerShell
$Path = [Environment]::GetFolderPath('MyDocuments')
Find-PSOneDuplicateFile -Path $Path
Find duplicate files in the user documents folder
```
> EXAMPLE 2

```PowerShell
Find-PSOneDuplicateFile -Path c:\windows -Filter *.log
find log files in the Windows folder with duplicate content
```

---

### Parameters
#### **Path**
Path of folder to recursively search

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Filter**
Filter to apply. Default is '*' (all Files)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

---

### Syntax
```PowerShell
Find-PSOneDuplicateFile [-Path] <String> [[-Filter] <String>] [<CommonParameters>]
```
