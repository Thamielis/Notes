Get-SamplerAbsolutePath
-----------------------

### Synopsis
Gets the absolute value of a path, that can be relative to another folder
or the current Working Directory `$PWD` or Drive.

---

### Description

This function will resolve the Absolute value of a path, whether it's
potentially relative to another path, relative to the current working
directory, or it's provided with an absolute Path.

The Path does not need to exist, but the command will use the right
[System.Io.Path]::DirectorySeparatorChar for the OS, and adjust the
`..` and `.` of a path by removing parts of a path when needed.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-SamplerAbsolutePath -Path '/src' -RelativeTo 'C:\Windows'
# C:\src
```
> EXAMPLE 2

```PowerShell
Get-SamplerAbsolutePath -Path 'MySubFolder' -RelativeTo '/src'
# C:\src\MySubFolder
```

---

### Parameters
#### **Path**
Relative or Absolute Path to resolve, can also be $null/Empty and will
return the RelativeTo absolute path.
It can be Absolute but relative to the current drive: i.e. `/Windows`
would resolve to `C:\Windows` on most Windows systems.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **RelativeTo**
Path to prepend to $Path if $Path is not Absolute.
If $RelativeTo is not absolute either, it will first be resolved
using [System.Io.Path]::GetFullPath($RelativeTo) before
being pre-pended to $Path.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes
When the root drive is omitted on Windows, the path is not considered absolute.
`Split-Path -IsAbsolute -Path '/src/`
# $false

---

### Syntax
```PowerShell
Get-SamplerAbsolutePath [[-Path] <String>] [[-RelativeTo] <String>] [<CommonParameters>]
```
