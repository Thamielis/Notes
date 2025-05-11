New-HubOrganizationUser
-----------------------

### Synopsis

---

### Description

---

### Parameters
#### **AllowOfflineInRDM**
Allow offline mode in RDM

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **Email**
Email of organization user you want to invite

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **HubContext**
Hub context

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[HubContext]`|false   |named   |false        |

#### **PSInvitation**
Invite organization user by PSInvitation object

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSInvitation]`|true    |named   |false        |

#### **UserSendMessageConfiguration**
Configuration that allow/disallow to send messages with/without entries
Valid Values:

* MessagesWithAttachments
* MessagesWithoutAttachments
* NoMessages

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[UserSendMessagePermission]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help New-HubOrganizationUser -detailed". For technical information, type "Get-Help New-HubOrganizationUser -full".

---

### Syntax
```PowerShell
New-HubOrganizationUser -Email <String> [-AllowOfflineInRDM <Boolean>] [-UserSendMessageConfiguration <MessagesWithAttachments | MessagesWithoutAttachments | NoMessages>] [-HubContext <HubContext>] [<CommonParameters>]
```
```PowerShell
New-HubOrganizationUser -PSInvitation <PSInvitation> [-HubContext <HubContext>] [<CommonParameters>]
```
