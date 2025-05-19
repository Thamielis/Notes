Read-PSMDScript
---------------

### Synopsis
Parse the content of a script

---

### Description

Uses the powershell parser to parse the content of a script or scriptfile.

---

### Examples
> EXAMPLE 1

```PowerShell
Read-PSMDScript -ScriptCode $ScriptCode
Parses the code in $ScriptCode
```
> EXAMPLE 2

```PowerShell
Get-ChildItem | Read-PSMDScript
Parses all script files in the current directory
```

---

### Parameters
#### **ScriptCode**
The scriptblock to parse.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|true    |1       |false        |

#### **Path**
Path to the scriptfile to parse.
Silently ignores folder objects.

|Type        |Required|Position|PipelineInput                 |Aliases |
|------------|--------|--------|------------------------------|--------|
|`[String[]]`|true    |named   |true (ByValue, ByPropertyName)|FullName|

---

### Syntax
```PowerShell
Read-PSMDScript [-ScriptCode] <ScriptBlock> [<CommonParameters>]
```
```PowerShell
Read-PSMDScript -Path <String[]> [<CommonParameters>]
```
