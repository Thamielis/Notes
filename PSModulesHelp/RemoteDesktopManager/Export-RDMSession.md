Export-RDMSession
-----------------

### Synopsis
Export a list of sessions to a file

---

### Description

Export a list of sessions to a file. The user must have the right to export. The sessions must come from the current data source or they will be ignored. If user vault export is disabled, the sessions from the private vault will be ignored.

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $sessions = get-rdmsession; $password = read-host -assecurestring "Password"; Export-RDMSession -XML -Path C:\MyPath\MyFilename.xml -Sessions $sessions -Password $password
Retrieves the list of available sessions and export them to a xml file at C:\MyPath\Filename.xml.
```

---

### Parameters
#### **CSV**
Export the sessions into a CSV file

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |1       |false        |

#### **ExcludeSessionPassword**
Don't export the password in the connections exported

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

#### **HTML**
Export the sessions into a HTML file

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |1       |false        |

#### **IncludeAttachements**
Include attachements in the export (Only available for the XML type).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

#### **IncludeCredentials**
Include credentials in the export (Only available for the XML type).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

#### **IncludeSecurityGroups**
Include Security Groups in the export (Only available for the XML type).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

#### **Password**
Password.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[SecureString]`|false   |1       |false        |

#### **Path**
Path where the file will be the saved. Must end with:
"CSV: .zip", "HTML: .html", "XML: .xml", "RDM: .rdm"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Sessions**
Sessions.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[PSConnection[]]`|true    |1       |false        |

#### **XML**
Export the sessions into a XML file

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|true    |1       |false        |RDM    |

---

### Inputs
System.String

File path

System.Security.SecureString

Password used to protect the file

RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection[]

Sessions to export into the file

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Export-RDMSession -detailed". For technical information, type "Get-Help Export-RDMSession -full".

---

### Syntax
```PowerShell
Export-RDMSession [-CSV] [-Sessions] <PSConnection[]> [-Path] <String> [-Password] <SecureString> [<CommonParameters>]
```
```PowerShell
Export-RDMSession [-HTML] [-Sessions] <PSConnection[]> [-Path] <String> [-Password] <SecureString> [[-ExcludeSessionPassword]] [<CommonParameters>]
```
```PowerShell
Export-RDMSession [-XML] [-Sessions] <PSConnection[]> [-Path] <String> [[-Password] <SecureString>] [[-IncludeCredentials]] [[-IncludeAttachements]] [[-IncludeSecurityGroups]] [<CommonParameters>]
```
