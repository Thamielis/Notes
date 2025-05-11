Expand-Zip
----------

### Synopsis
Expands the contents of a Zip file

---

### Description

Expands the contents of a Zip file that was compressed with Out-Zip.

---

### Related Links
* [Out-Zip](Out-Zip)

---

### Examples
> EXAMPLE 1

```PowerShell
dir $home\Documents\WindowsPowerShell\Modules\Pipeworks -Recurse | 
    Out-Zip -ZipFile $home\Pipeworks.zip        
Expand-Zip $home\Pipeworks.zip -OutputPath $psHome\Modules\Pipeworks
```

---

### Parameters
#### **ZipPath**
The path of the zip file

|Type      |Required|Position|PipelineInput        |Aliases                          |
|----------|--------|--------|---------------------|---------------------------------|
|`[String]`|true    |1       |true (ByPropertyName)|Fullname<br/>Filename<br/>ZipFile|

#### **OutputPath**
The output directory.  By default, this will be the name of the zip file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

---

### Outputs
* [Nullable](https://learn.microsoft.com/en-us/dotnet/api/System.Nullable)

---

### Syntax
```PowerShell
Expand-Zip [-ZipPath] <String> [[-OutputPath] <String>] [<CommonParameters>]
```
