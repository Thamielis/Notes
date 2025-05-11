Out-Zip
-------

### Synopsis
Outputs files into a zip

---

### Description

Stores files in a zip archive

---

### Related Links
* [Expand-Zip](Expand-Zip)

---

### Examples
> EXAMPLE 1

```PowerShell
dir -recurse | Out-Zip -ZipFile ".\a.zip"
```
> EXAMPLE 2

```PowerShell
dir $home\Documents\WindowsPowerShell\Modules\Pipeworks -Recurse | 
    Out-Zip -ZipFile $home\Pipeworks.zip        
Expand-Zip $home\Pipeworks.zip -OutputPath $psHome\Modules\Pipeworks
```

---

### Parameters
#### **FilePath**
The path to a file.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|true    |1       |true (ByPropertyName)|Fullname|

#### **ZipFile**
The output zip file

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **HideProgress**
If set, will not show progress.  This improves performance and is good to include when calling this within another command.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **CommonRoot**
The common root

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Outputs
* [IO.FileInfo](https://learn.microsoft.com/en-us/dotnet/api/System.IO.FileInfo)

---

### Syntax
```PowerShell
Out-Zip [-FilePath] <String[]> [-ZipFile] <String> [-HideProgress] [-CommonRoot <String>] [<CommonParameters>]
```
