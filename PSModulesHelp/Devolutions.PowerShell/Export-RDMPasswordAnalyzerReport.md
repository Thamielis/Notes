Export-RDMPasswordAnalyzerReport
--------------------------------

### Synopsis
Export an entry security analyzer report of the current data source

---

### Description

Export an entry security analyzer report of the current data source to the specfied path. The user must have access to the reports to use the command.

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Export-RDMPasswordAnalyzerReport -ExportType Html -Path C:\mypath\filename.html -Status Expired -Verbose
Export the Password Analyzer report in a html format at the location C:\mypath\filename.html. Only the connections with expired password will be include in the report. If the report does not contain an entry, a verbose message will indicates that the report is empty. In that case, the report will not be generated.
```
> EXAMPLE 2

```PowerShell
PS C:\> Get-RDMDataSource -Name ADataSource | Set-RDMCurrentDataSource; Export-RDMPasswordAnalyzerReport -ExportType Html -Path C:\mypath\filename.html -ShowAllEntries -ShowVPNAnalysis -ShowPwnedPassword -Private
Change the current data source to ADataSource and export the Password Analyzer report in a html format at the location C:\mypath\filenmae.html. The report will contain all connections, even those without a password, the VPN analysis, and will identified the compromised passwords.
```
> EXAMPLE 3

PS C:\> $original = Get-RDMCurrentDataSource; $ds = Get-RDMDataSource; $ds.ForEach({Set-RDMCurrentDataSource -DataSource $_; Export-RDMPasswordAnalyzerReport -ExportType Html -Path C:\mypath\$($_.Name).html -ShowPwnedPassword -Private}); Set-RDMCurrentDataSource -DataSource $original
For all the data sources, export the Password Analyzer report of the private vault in a html format in the directory C:\mypath\ where the file name will be the same as the data source name. The initial current data source will be set again as the current one.

---

### Parameters
#### **ExportType**
Specify the file type of the export. CSV, HTML and XLM are supported.
Valid Values:

* Html
* Csv
* Xml

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **ForcePromptAnswer**
Switch to use with caution. It will automatically answer prompt asking yes/no, yes/no/cancel, or ok/cancel questions. In case of multiple prompts, multiple values can be passed to this parameter. Here are the accepted values:
* Yes: Accept the prompt. Cover the OK and Automatic value.
* No: Refuse the yes/no/cancel prompt. Cancel is the fallback option if there is not an option No.
* Cancel: Cancel the yes/no/cancel prompt. No is the fallback option if there is not an option Cancel.
Valid Values:

* Cancel
* No
* Yes

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[DialogResult[]]`|false   |named   |false        |

#### **Path**
Path where the file will be the saved. Must end with:
"CSV: .csv", "HTML: .html", "XML: .xml"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

#### **Private**
The report will cover the list of available sessions from the user private vault.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ReportType**
Specify the report type to export. Only PasswordAnalyzer (Entry Security Analyzer) is supported for now.
Valid Values:

* PasswordAnalyzer

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **ShowAllEntries**
Show also the entries without a password

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ShowPwnedPassword**
Show the compromised (pwned) passwords

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ShowVPNAnalysis**
Show the VPN analysis

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Status**
Filter the connections based on their status. The filter "Default" keeps the connections whose status is not specified.
Valid Values:

* ShowAll
* Default
* Locked
* Disabled
* Warning
* Expired

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[ConnectionStatusFilter]`|false   |4       |false        |

#### **Theme**
Specify the theme of the report. If not specified, the RDM theme will be used.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Theme]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Export-RDMPasswordAnalyzerReport -detailed". For technical information, type "Get-Help Export-RDMPasswordAnalyzerReport -full".

---

### Syntax
```PowerShell
Export-RDMPasswordAnalyzerReport [-ShowAllEntries] [-ShowPwnedPassword] [-ShowVPNAnalysis] [-Theme <Light | Dark>] [-Path] <String> [-ExportType] <Html | Csv | Xml> [-Private] [-ReportType] <PasswordAnalyzer> [[-Status] <ShowAll | Default | Locked | Disabled | Warning | Expired>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
