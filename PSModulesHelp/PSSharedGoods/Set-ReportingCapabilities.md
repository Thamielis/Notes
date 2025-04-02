Set-ReportingCapabilities
-------------------------

### Synopsis
Sets up reporting capabilities by managing report files.

---

### Description

This function sets up reporting capabilities by creating the necessary directories and managing the number of report files based on the specified maximum.

---

### Examples
> EXAMPLE 1

```PowerShell
Set-ReportingCapabilities -ReportPath "C:\Reports\report.log" -ScriptPath "C:\Scripts\script.ps1" -ReportMaximum 10
```

---

### Parameters
#### **ReportPath**
The path where the report files will be stored.

|Type      |Required|Position|PipelineInput|Aliases                          |
|----------|--------|--------|-------------|---------------------------------|
|`[String]`|false   |1       |false        |Path<br/>LiteralPath<br/>FilePath|

#### **ScriptPath**
The path of the script that generates the reports.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **ReportMaximum**
The maximum number of report files to keep. Older files will be deleted if this limit is exceeded.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |3       |false        |

---

### Notes
This function is used in:
- CleanupMonster
- PasswordSolution
- SharePointEssentials

And many other scripts.

---

### Syntax
```PowerShell
Set-ReportingCapabilities [[-ReportPath] <String>] [[-ScriptPath] <String>] [[-ReportMaximum] <Int32>] [<CommonParameters>]
```
