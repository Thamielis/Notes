Get-PSOneDirectory
------------------

### Synopsis
Lists the content of a folder and supports long path names (>256 characters)

---

### Description

Uses the Microsoft.Experimental.IO assembly to list folder contents without
path name length limitations. You can use this function to search for and identify 
files and folders that use long path names.

---

### Related Links
* [https://powershell.one/tricks/assemblies/load-from-memory
https://github.com/TobiasPSP/Modules.PSOneTools/blob/master/PSOneTools/1.5/Get-PSOneDirectory.ps1
https://github.com/TobiasPSP/Modules.PSOneTools/blob/master/PSOneTools/1.5/Internal/Install-LongPathSupport.ps1](https://powershell.one/tricks/assemblies/load-from-memory
https://github.com/TobiasPSP/Modules.PSOneTools/blob/master/PSOneTools/1.5/Get-PSOneDirectory.ps1
https://github.com/TobiasPSP/Modules.PSOneTools/blob/master/PSOneTools/1.5/Internal/Install-LongPathSupport.ps1)

* [https://powershell.one/tricks/assemblies/load-from-memory
https://github.com/TobiasPSP/Modules.PSOneTools/blob/master/PSOneTools/1.5/Get-PSOneDirectory.ps1
https://github.com/TobiasPSP/Modules.PSOneTools/blob/master/PSOneTools/1.5/Internal/Install-LongPathSupport.ps1](https://powershell.one/tricks/assemblies/load-from-memory
https://github.com/TobiasPSP/Modules.PSOneTools/blob/master/PSOneTools/1.5/Get-PSOneDirectory.ps1
https://github.com/TobiasPSP/Modules.PSOneTools/blob/master/PSOneTools/1.5/Internal/Install-LongPathSupport.ps1)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-PSOneDirectory -Path C:\Windows -ErrorAction SilentlyContinue
Dumps the entire content of the windows folder and reports all files
and folders and their path length. Error messages due to folders
where you have no access permissions are suppressed.
```
> EXAMPLE 2

```PowerShell
Get-PSOneDirectory -Path C:\Windows -ErrorAction SilentlyContinue |
  Where-Object PathLength -gt 200
Lists files and folders with a path length of greater than 200 characters. 
Error messages due to folders where you have no access permissions are suppressed.
```

---

### Parameters
#### **Path**
Folder path to enumerate

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

---

### Syntax
```PowerShell
Get-PSOneDirectory [-Path] <String> [<CommonParameters>]
```
