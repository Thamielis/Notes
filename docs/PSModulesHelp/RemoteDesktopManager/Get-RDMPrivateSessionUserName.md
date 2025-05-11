Get-RDMPrivateSessionUserName
-----------------------------

### Synopsis
Get the username from the specified session.

---

### Description

Get the username from the specified session.

---

### Related Links
* [Get-RDMPrivateSession](Get-RDMPrivateSession)

* [Get-RDMPrivateSessionDomain](Get-RDMPrivateSessionDomain)

* [Set-RDMPrivateSessionDomain](Set-RDMPrivateSessionDomain)

* [Set-RDMPrivateSessionUsername](Set-RDMPrivateSessionUsername)

* [Get-RDMPrivateSessionPassword](Get-RDMPrivateSessionPassword)

* [Set-RDMPrivateSessionPassword](Set-RDMPrivateSessionPassword)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-RDMUserVaultSessionUserName "{00000000-0000-0000-0000-000000000000}"
Get the username from the session with ID = "{00000000-0000-0000-0000-000000000000}".
```
> EXAMPLE 2

```PowerShell
PS C:\> $list = Get-RDMUserVaultSession; Get-RDMUserVaultSessionUserName $list[1].ID
Retrieves the list of available sessions and gets the password from the the second element in the list.
```

---

### Parameters
#### **ID**
Specifies the ID of the session to get the username from.
Must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}.

|Type    |Required|Position|PipelineInput |
|--------|--------|--------|--------------|
|`[Guid]`|true    |1       |true (ByValue)|

#### **Session**
Specifies the session to set the username to.

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
For more information, type "Get-Help Get-RDMPrivateSessionUserName -detailed". For technical information, type "Get-Help Get-RDMPrivateSessionUserName -full".

---

### Syntax
```PowerShell
Get-RDMPrivateSessionUserName [-ID] <Guid> [<CommonParameters>]
```
```PowerShell
Get-RDMPrivateSessionUserName [-Session] <PSConnection> [<CommonParameters>]
```
