Set-RDMPrivateSessionStatus
---------------------------

### Synopsis
Set a status to a given session.

---

### Description

Set a status to a given session.

---

### Related Links
* [Get-RDMPrivateSession](Get-RDMPrivateSession)

* [Set-RDMPrivateSessionDomain](Set-RDMPrivateSessionDomain)

* [Get-RDMPrivateSessionUserName](Get-RDMPrivateSessionUserName)

* [Set-RDMPrivateSessionUsername](Set-RDMPrivateSessionUsername)

* [Get-RDMPrivateSessionPassword](Get-RDMPrivateSessionPassword)

* [Set-RDMPrivateSessionPassword](Set-RDMPrivateSessionPassword)

* [Get-RDMPrivateSessionStatus](Get-RDMPrivateSessionStatus)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $list = Get-RDMUserVaultSession; Set-RDMUserVaultSessionStatus -Session $list[1] -Status Locked -Message 'Locked Message'
Set the status locked to the the second element in the list.
```

---

### Parameters
#### **ID**
Specifies the ID of the session to set the status to.
Must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}.

|Type    |Required|Position|PipelineInput |
|--------|--------|--------|--------------|
|`[Guid]`|true    |1       |true (ByValue)|

#### **Message**
Status message

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|false   |1       |true (ByValue)|

#### **Session**
Specifies the session to set the status to

|Type              |Required|Position|PipelineInput |
|------------------|--------|--------|--------------|
|`[PSConnection[]]`|true    |1       |true (ByValue)|

#### **Status**
Status type
Valid Values:

* Default
* Disabled
* Expired
* Locked
* Warning

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|true    |1       |true (ByValue)|

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-RDMPrivateSessionStatus -detailed". For technical information, type "Get-Help Set-RDMPrivateSessionStatus -full".

---

### Syntax
```PowerShell
Set-RDMPrivateSessionStatus [-ID] <Guid> [[-Message] <String>] [-Status] <String> [<CommonParameters>]
```
```PowerShell
Set-RDMPrivateSessionStatus [-Session] <PSConnection[]> [[-Message] <String>] [-Status] <String> [<CommonParameters>]
```
