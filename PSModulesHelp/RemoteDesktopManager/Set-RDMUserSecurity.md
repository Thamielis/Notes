Set-RDMUserSecurity
-------------------

### Synopsis
Assign/set user security settings.

---

### Description

Assign/set user security settings.

---

### Related Links
* [Get-RDMUser](Get-RDMUser)

* [New-RDMUser](New-RDMUser)

* [New-RDMUser](New-RDMUser)

* [Remove-RDMUser](Remove-RDMUser)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Set-RDMUserSecurity -user $user -CanImport $true -CanExport $true -AllowRevealPassword $false -OfflineMode "Read/Write"
Set user to allow it to import, export, not allow to reveal password and set offline mode to read/write and
```

---

### Parameters
#### **AllowDragAndDrop**
Allows the user to move the sessions using drag-and-drop from other applications.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |9       |false        |

#### **CanExport**
Allows the user to Export sessions.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |2       |false        |

#### **CanImport**
Allows the user to Import sessions.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |3       |false        |

#### **CanViewDetails**
Allows the user to see the content of the Details tab for all sessions.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |5       |false        |

#### **CanViewGlobalLogs**
Allows the user to see the content of the Logs that apply to a session.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |4       |false        |

#### **CanViewInformations**
Allows the user to see the content of the Information tab for all sessions.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |7       |false        |

#### **DenyAddInRoot**
Denies the user the rights to add in the root.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |10      |false        |

#### **OfflineMode**
Allows the user to enable the Offline Mode on the data sources. Choose between:
Disabled  : no offline cache allowed for that user
Cache : cache allowed for that user
ReadOnly  : a read-only cache is allowed for Advanced Data Sources.
ReadWrite : an advanced cache, with change synchronization, is allowed for Advanced Data Sources.
Valid Values:

* Disabled
* Cache
* ReadOnly
* ReadWrite

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |

#### **SetUser**
Set user

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

#### **User**
User object, must be retrieved from Get-RDMUser or created via New-RDMUser.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[PSUserInfo]`|true    |1       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-RDMUserSecurity -detailed". For technical information, type "Get-Help Set-RDMUserSecurity -full".

---

### Syntax
```PowerShell
Set-RDMUserSecurity [-User] <PSUserInfo> [[-AllowDragAndDrop] <Boolean>] [[-CanExport] <Boolean>] [[-CanImport] <Boolean>] [[-CanViewDetails] <Boolean>] [[-CanViewGlobalLogs] <Boolean>] [[-CanViewInformations] <Boolean>] [[-DenyAddInRoot] <Boolean>] [[-OfflineMode] <String>] [[-SetUser]] [<CommonParameters>]
```
