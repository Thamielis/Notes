Add-RDMPrivateSessionAttachment
-------------------------------

### Synopsis
Add a new attachment to a session

---

### Description

Add a new attachment to a session

---

### Parameters
#### **Description**
Attachment description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **Filename**
Attachment filename.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|true    |2       |true (ByValue)|

#### **Password**
Attachment password.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[SecureString]`|false   |6       |false        |

#### **Refresh**
Send refresh notification to Remote Desktop Manager application.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |2       |false        |

#### **SecurityGroup**
Attachment security group.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[PSSecurityGroupInfo]`|false   |5       |false        |

#### **Session**
Session to add the attachment to.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSConnection]`|true    |2       |false        |

#### **Title**
Attachment title.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Add-RDMPrivateSessionAttachment -detailed". For technical information, type "Get-Help Add-RDMPrivateSessionAttachment -full".

---

### Syntax
```PowerShell
Add-RDMPrivateSessionAttachment [[-Title] <String>] [-Filename] <String> [[-Refresh]] [-Session] <PSConnection> [[-Description] <String>] [[-SecurityGroup] <PSSecurityGroupInfo>] [[-Password] <SecureString>] [<CommonParameters>]
```
