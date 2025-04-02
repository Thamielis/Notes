Get-RDMPrivateSessionStatus
---------------------------

### Synopsis
Get the status from the specified session.

---

### Description

Get the status from the specified session.

---

### Related Links
* [Get-RDMPrivateSession](Get-RDMPrivateSession)

* [Set-RDMPrivateSessionDomain](Set-RDMPrivateSessionDomain)

* [Get-RDMPrivateSessionUserName](Get-RDMPrivateSessionUserName)

* [Set-RDMPrivateSessionUsername](Set-RDMPrivateSessionUsername)

* [Get-RDMPrivateSessionPassword](Get-RDMPrivateSessionPassword)

* [Set-RDMPrivateSessionPassword](Set-RDMPrivateSessionPassword)

* [Set-RDMSessionStatus](Set-RDMSessionStatus)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-RDMUserVaultSessionStatus "{00000000-0000-0000-0000-000000000000}"
Get the status from the session with ID = "{00000000-0000-0000-0000-000000000000}".
```
> EXAMPLE 2

```PowerShell
PS C:\> $list = Get-RDMUserVaultSession; Get-RDMUserVaultSessionStatus $list[1]
Retrieves the list of available sessions and gets the status from the the second element in the list.
```

---

### Parameters
#### **ID**
Specifies the ID of the session to get the status from.
Must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}.

|Type    |Required|Position|PipelineInput |
|--------|--------|--------|--------------|
|`[Guid]`|true    |1       |true (ByValue)|

#### **Session**
Specifies the session to set the status to

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSConnection]`|true    |1       |true (ByValue)|

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Get-RDMPrivateSessionStatus -detailed". For technical information, type "Get-Help Get-RDMPrivateSessionStatus -full".

---

### Syntax
```PowerShell
Get-RDMPrivateSessionStatus [-ID] <Guid> [<CommonParameters>]
```
```PowerShell
Get-RDMPrivateSessionStatus [-Session] <PSConnection> [<CommonParameters>]
```
