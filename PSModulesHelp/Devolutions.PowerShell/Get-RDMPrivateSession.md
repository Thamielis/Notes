Get-RDMPrivateSession
---------------------

### Synopsis
Retrieve the list of available sessions from the user private vault.

---

### Description

Retrieve the list of available sessions from the user private vault for the current selected data source.

---

### Related Links
* [Get-RDMDataSource](Get-RDMDataSource)

* [Set-RDMDataSource](Set-RDMDataSource)

* [Set-RDMPrivateSession](Set-RDMPrivateSession)

---

### Parameters
#### **CaseSensitive**
Case sensitive

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

#### **GroupName**
GroupName

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ID**
ID of the desired session

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|false   |named   |false        |

#### **IncludeDocumentsStoredInDatabase**
Include attachment from documents

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IncludeLocalPlaylists**
Include dependable connections and local playlists from playlist connection

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IncludeSubFolders**
Include subfolders from the group name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IncludeUserSpecificSettings**
Include user specific settings

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **LiteralName**
Session name. No characters are interpreted as wildcards.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Name**
Session name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection

---

### Notes
For more information, type "Get-Help Get-RDMPrivateSession -detailed". For technical information, type "Get-Help Get-RDMPrivateSession -full".

---

### Syntax
```PowerShell
Get-RDMPrivateSession [-GroupName <String>] [-LiteralName <String>] [-Name <String>] [-IncludeSubFolders] [-IncludeDocumentsStoredInDatabase] [-IncludeLocalPlaylists] [-IncludeUserSpecificSettings] [-CaseSensitive] [-ID <Guid>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
