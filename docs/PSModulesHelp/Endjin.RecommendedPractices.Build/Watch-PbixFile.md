Watch-PbixFile
--------------

### Synopsis
A helper for running the Power BI Tools extract command in 'watch' mode.

---

### Description

Looks up the Power BI Desktop process ID information before running the required 'pbi-tools.exe' command.

---

### Examples
> EXAMPLE 1

```PowerShell
Watch-PbixFile -PbixFilePath myReport.pbix -ExtractPath src/myReport
When run in the root of a git repository, generates the required pr-autoflow artefacts under the '.github' folder.
```

---

### Parameters
#### **PbixFilePath**
Path to the source PBIX file being edited in Power BI Desktop.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **ExtractPath**
Path to the folder where the PBIX file will be extracted to.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **PbiDesktopPid**
Allows the the Power BI Desktop process ID to be set manually.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |3       |false        |

#### **PbiToolsPath**
Path to the Power BI Tools Windows CLI tool (i.e 'pbi-tools.exe').  When not specified it is assumed to be in your PATH.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

---

### Syntax
```PowerShell
Watch-PbixFile [-PbixFilePath] <String> [-ExtractPath] <String> [[-PbiDesktopPid] <Int32>] [[-PbiToolsPath] <String>] [<CommonParameters>]
```
