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
PS C:\> Set-RDMUserSecurity -user $user -AllowRevealPassword $false -OfflineMode "Read/Write"
Disallow the user to reveal password and set offline mode to read/write
```

---

### Parameters
#### **AllowDragAndDrop**
Allows the user to move the sessions using drag-and-drop from other applications.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |3       |false        |

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
|`[String]`|false   |2       |false        |

#### **SetUser**
Set user

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
Set-RDMUserSecurity [-User] <PSUserInfo> [[-AllowDragAndDrop] <Boolean>] [[-OfflineMode] <Disabled | Cache | ReadOnly | ReadWrite>] [-SetUser] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
