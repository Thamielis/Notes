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
|`[Boolean]`|false   |1       |false        |

#### **Email**
Email of organization user you want to invite

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **HubContext**
Hub context

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[HubContext]`|false   |1       |false        |

#### **PSInvitation**
Invite organization user by PSInvitation object

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSInvitation]`|true    |1       |false        |

#### **UserSendMessageConfiguration**
Configuration that allow/disallow to send messages with/without entries
Valid Values:

* MessagesWithEntries
* MessagesWithoutEntries
* NoMessages

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[UserSendMessagePermission]`|false   |1       |false        |

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
New-HubOrganizationUser [-Email] <String> [[-AllowOfflineInRDM] <Boolean>] [[-UserSendMessageConfiguration] <MessagesWithEntries | MessagesWithoutEntries | NoMessages>] [[-HubContext] <HubContext>] [<CommonParameters>]
```
```PowerShell
New-HubOrganizationUser [-PSInvitation] <PSInvitation> [[-HubContext] <HubContext>] [<CommonParameters>]
```
