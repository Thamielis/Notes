Export-RDMActivityLogsReport
----------------------------

### Synopsis
Export the activity logs for the current data source.

---

### Description

Export the activity logs for the current data source. The content can be filtered with parameters. If a file exists at the specified path, it will be overwritten. To use this cmdlet, the user must have the rights to access reports.

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Export-RDMActivityLogsReport Html C:\my\path\name.html -DateFilter Last30Days
Generate an html report at the location C:\my\path\name.html for all activities that occured in the last 30 days.
```
> EXAMPLE 2

```PowerShell
PS C:\> Export-RDMActivityLogsReport Csv C:\my\path\name.csv -EntryName VIPEntry -Theme Dark
Generate an csv report at the location C:\my\path\name.csv for all activities that occured on the entry VIPEntry. The report will have a dark background.
```

---

### Parameters
#### **After**
Set the inclusive custom lower limit date for the logs included in the report.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |false        |

#### **Before**
Set the inclusive custom upper limit date for the logs included in the report.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |false        |

#### **DateFilter**
Filter the logs based on predefined value for the date, such as Today. If not specified, it will be custom, allowing the use of the parameters Before and After.
Valid Values:

* LastWeek
* Today
* Yesterday
* Custom
* LastMonth
* CurrentMonth
* Last7Days
* Last30Days
* Last31Days
* Last60Days
* Last90Days

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[DateFilter]`|false   |named   |false        |

#### **Descending**
Sort in the descending order.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EntryName**
Filter the logs for a specific entry.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Folder**
Filter the logs for a specific folder.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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

#### **MachineName**
Filter the logs by the machine name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Message**
Filter the logs by the message.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **OnCloseComment**
Filter the logs by the close prompt comment.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **OnOpenComment**
Filter the logs by the open prompt comment.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Path**
Path where the file will be the saved. Must end with:
"CSV: .csv", "HTML: .html", "XML: .xml"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **SortField**
Field on which the sort will be applied
Valid Values:

* Connection
* User
* Vault

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Theme**
Specify the theme of the report. If not specified, the RDM theme will be used.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Theme]`|false   |named   |false        |

#### **TicketID**
Filter the logs by the ticket number.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Type**
Specify the file type of the export. CSV, HTML and XLM are supported.
Valid Values:

* Html
* Csv
* Xml

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **UserName**
Filter the logs by the user name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **UTC**
Use UTC time for the parameters 'After' and 'Before'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **VaultID**
Filter the logs by the vault ID.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Export-RDMActivityLogsReport -detailed". For technical information, type "Get-Help Export-RDMActivityLogsReport -full".

---

### Syntax
```PowerShell
Export-RDMActivityLogsReport [-Theme <Light | Dark>] [-Path] <String> [-After <DateTime>] [-Before <DateTime>] [-DateFilter <LastWeek | Today | Yesterday | Custom | LastMonth | CurrentMonth | Last7Days | Last30Days | Last31Days | Last60Days | Last90Days>] [-Descending] [-EntryName <String>] [-Folder <String>] [-MachineName <String>] [-Message <String>] [-OnCloseComment <String>] [-OnOpenComment <String>] [-SortField <Connection | User | Vault>] [-TicketID <String>] [-Type] <Html | Csv | Xml> [-UserName <String>] [-UTC] [-VaultID <String>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
