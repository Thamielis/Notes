Convert-PSMDMessage
-------------------

### Synopsis
Converts a file's use of PSFramework messages to strings.

---

### Description

Converts a file's use of PSFramework messages to strings.

---

### Examples
> EXAMPLE 1

```PowerShell
Convert-PSMDMessage -Path 'C:\Scripts\logrotate.ps1' -OutPath 'C:\output'
Converts all instances of writing messages in logrotate.ps1 to use strings instead.
```

---

### Parameters
#### **Path**
Path to the file to convert.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **OutPath**
Folder in which to generate the output ps1 and psd1 file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **EnableException**
Replaces user friendly yellow warnings with bloody red exceptions of doom!
Use this if you want the function to throw terminating errors you want to catch.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Convert-PSMDMessage [-Path] <String> [-OutPath] <String> [-EnableException] [<CommonParameters>]
```
