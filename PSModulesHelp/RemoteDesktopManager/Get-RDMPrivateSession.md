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
|`[Switch]`|false   |1       |false        |

#### **GroupName**
GroupName

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **ID**
ID of the desired session

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|false   |1       |false        |

#### **IncludeDocumentsStoredInDatabase**
Include attachment from documents

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

#### **IncludeLocalPlaylists**
Include dependable connections and local playlists from playlist connection

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

#### **IncludeSubFolders**
Include subfolders from the group name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

#### **IncludeUserSpecificSettings**
Include user specific settings

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

#### **Name**
Session name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

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
Get-RDMPrivateSession [[-GroupName] <String>] [[-Name] <String>] [[-IncludeSubFolders]] [[-IncludeDocumentsStoredInDatabase]] [[-IncludeLocalPlaylists]] [[-IncludeUserSpecificSettings]] [[-CaseSensitive]] [[-ID] <Guid>] [<CommonParameters>]
```
