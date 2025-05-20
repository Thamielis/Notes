Get-PSMDFileCommand
-------------------

### Synopsis
Parses a scriptfile and returns the contained/used commands.

---

### Description

Parses a scriptfile and returns the contained/used commands.
Use this to determine, what command resources are being used.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-PSMDFileCommand -Path './task_usersync.ps1'
Parses the scriptfile task_usersync.ps1 for commands used.
```

---

### Parameters
#### **Path**
The path to the scriptfile to parse.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|true    |1       |true (ByValue, ByPropertyName)|

#### **EnableException**
Replaces user friendly yellow warnings with bloody red exceptions of doom!
Use this if you want the function to throw terminating errors you want to catch.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-PSMDFileCommand [-Path] <String[]> [-EnableException] [<CommonParameters>]
```
