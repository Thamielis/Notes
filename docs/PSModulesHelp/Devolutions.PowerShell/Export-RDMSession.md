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
PS C:\> $sessions = Get-RDMEntry;
        $password = Read-Host -AsSecureString "Password";
        Export-RDMSession -XML -Path C:\MyPath\MyFilename.rdm -Sessions $sessions -Password $password
Retrieves the list of available sessions and export them to a rdm file at C:\MyPath\Filename.rdm.
```

---

### Parameters
#### **CSV**
Export the sessions into a CSV file

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **ExcludeSessionPassword**
Don't export the password in the connections exported

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ExcludeShortcuts**
Exclude shortcuts in the export (Only available for the XML type).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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

#### **HTML**
Export the sessions into a HTML file

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **IncludeAttachements**
Include attachements in the export (Only available for the XML type).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IncludeCredentials**
Include credentials in the export (Only available for the XML type).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IncludeDocumentation**
Include entry documentation in the export (Only available for the XML type).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IncludeFavorite**
keep the favorite status.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Password**
Password.

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[SecureString]`|false   |named   |true (ByValue)|

#### **Path**
Path where the file will be the saved. Must end with:
"CSV: .zip", "HTML: .html", "XML: .xml", "RDM: .rdm"

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|true    |named   |true (ByValue)|

#### **RemoveAllFolders**
Remove all folders. All other entries will have their group set at the root level.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Sessions**
Sessions.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[PSConnection[]]`|true    |named   |false        |

#### **Version**
Export file version for '.xml' and '.rdm' files. The default value is v2.
Valid Values:

* Default
* v1
* v2

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[RDMExportVersion]`|false   |named   |false        |

#### **XML**
Export the sessions into a XML file

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|true    |named   |false        |RDM    |

---

### Inputs
System.String

File path

System.Security.SecureString

Password used to protect the file

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Export-RDMSession -detailed". For technical information, type "Get-Help Export-RDMSession -full".

---

### Syntax
```PowerShell
Export-RDMSession -CSV -Sessions <PSConnection[]> -Path <String> -Password <SecureString> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Export-RDMSession -HTML -Sessions <PSConnection[]> -Path <String> -Password <SecureString> [-ExcludeSessionPassword] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Export-RDMSession -XML -Sessions <PSConnection[]> -Path <String> [-Password <SecureString>] [-Version <v1 | v2>] [-ExcludeShortcuts] [-IncludeCredentials] [-IncludeAttachements] [-IncludeDocumentation] [-IncludeFavorite] [-RemoveAllFolders] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
