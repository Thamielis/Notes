Export-DSPamAccountAccessReport
-------------------------------

### Synopsis
Generate a report detailing PAM credential access

---

### Description

Generate a report detailing PAM credential access, available in CSV, HTML, and XML formats. By default, the system will overwrite any existing file. To prevent this, employ the NoClobber switch.
Specify the credentials to be included in the report using either the AccountID or FolderID parameters. Use AccountID for individual credentials, and FolderID to include all credentials within a specified folder.

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Export-DSPamAccountAccessReport -FolderID '12345678-1234-1234-1234-1234567890AB' -Path 'myName.html' -Type Html
Export an html report named 'myName' in the current directory
```

---

### Parameters
#### **AccountID**
Pam accounts' ID

|Type      |Required|Position|PipelineInput|Aliases        |
|----------|--------|--------|-------------|---------------|
|`[Guid[]]`|true    |named   |false        |PamCredentialID|

#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **FolderID**
Pam folders' ID

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|false   |named   |false        |

#### **NoClobber**
Prevents the cmdlet from overwriting existing files. If a file with the specified name already exists, the cmdlet will generate an error instead of overwriting the file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PassThru**
Enables the cmdlet to output objects it has processed, useful for further pipeline processing or inspection.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Path**
Specifies the path to the output file where the data will be exported. The path can be either absolute or relative. If only a file name is provided, the file will be created in the current directory. If the specified file already exists, it will be overwritten. To prevent overwriting an existing file, use the -NoClobber switch.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **ResolveUserGroups**
Replace user groups by its members

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Type**
Specifies the report type: HTML (default) and CSV
Valid Values:

* Default
* Html
* Csv
* Xlsx
* Xml
* Ics

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[ReportExportType]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* [Management.Automation.PSObject[]](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject[])

* RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[System.Management.Automation.PSObject, System.Management.Automation, Version=3.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35]]

---

### Notes
For more information, type "Get-Help Export-DSPamAccountAccessReport -detailed". For technical information, type "Get-Help Export-DSPamAccountAccessReport -full".

---

### Syntax
```PowerShell
Export-DSPamAccountAccessReport -AccountID <Guid[]> -Path <String> [-Type <Csv | Html | Xml>] [-NoClobber] [-PassThru] [-ResolveUserGroups] [-AsLegacyResponse] [<CommonParameters>]
```
```PowerShell
Export-DSPamAccountAccessReport [-FolderID <Guid[]>] -Path <String> [-Type <Csv | Html | Xml>] [-NoClobber] [-PassThru] [-ResolveUserGroups] [-AsLegacyResponse] [<CommonParameters>]
```
