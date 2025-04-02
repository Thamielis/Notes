Find-PSOneDuplicateFileFast
---------------------------

### Synopsis
Identifies files with duplicate content and uses a partial hash for large files to speed calculation up

---

### Description

Returns a hashtable with the hashes that have at least two files (duplicates). Large files with partial hashes are suffixed with a "P".
Large files with a partial hash can be falsely positive: they may in fact be different even though the partial hash is the same
You either need to calculate the full hash for these files to be absolutely sure, or add -TestPartialHash.
Calculating a full hash for large files may take a very long time though. So you may be better off using other
strategies to identify duplicate file content, i.e. look at identical creation times, etc.

---

### Related Links
* [https://powershell.one](https://powershell.one)

---

### Examples
> EXAMPLE 1

```PowerShell
$Path = [Environment]::GetFolderPath('MyDocuments')
Find-PSOneDuplicateFileFast -Path $Path
Find duplicate files in the user documents folder
```
> EXAMPLE 2

```PowerShell
Find-PSOneDuplicateFileFast -Path c:\windows -Filter *.log
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

#### **TestPartialHash**
when there are multiple files with same partial hash
they may still be different. When setting this switch,
full hashes are calculated which may take a very long time
for large files and/or slow networks

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **MaxFileSize**
use partial hashes for files larger than this:

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int64]`|false   |3       |false        |

---

### Syntax
```PowerShell
Find-PSOneDuplicateFileFast [-Path] <String> [[-Filter] <String>] [-TestPartialHash] [[-MaxFileSize] <Int64>] [<CommonParameters>]
```
