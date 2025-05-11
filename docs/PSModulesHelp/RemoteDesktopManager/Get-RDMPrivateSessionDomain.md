Get-RDMPrivateSessionDomain
---------------------------

### Synopsis
Get the domain from the specified session.

---

### Description

Get the domain from the specified session.

---

### Related Links
* [Get-RDMPrivateSession](Get-RDMPrivateSession)

* [Set-RDMPrivateSessionDomain](Set-RDMPrivateSessionDomain)

* [Get-RDMPrivateSessionUserName](Get-RDMPrivateSessionUserName)

* [Set-RDMPrivateSessionUsername](Set-RDMPrivateSessionUsername)

* [Get-RDMPrivateSessionPassword](Get-RDMPrivateSessionPassword)

* [Set-RDMPrivateSessionPassword](Set-RDMPrivateSessionPassword)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-RDMUserVaultSessionDomain "{00000000-0000-0000-0000-000000000000}"
Get the domain from the session with ID = "{00000000-0000-0000-0000-000000000000}".
```
> EXAMPLE 2

```PowerShell
PS C:\> $list = Get-RDMUserVaultSession; Get-RDMUserVaultSessionDomain $list[1].ID
Retrieves the list of available sessions and gets the domain from the the second element in the list.
```

---

### Parameters
#### **ID**
Specifies the ID of the session to get the domain from.
Must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}.

|Type    |Required|Position|PipelineInput |
|--------|--------|--------|--------------|
|`[Guid]`|true    |1       |true (ByValue)|

#### **Session**
Specifies the session to set the domain to

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
For more information, type "Get-Help Get-RDMPrivateSessionDomain -detailed". For technical information, type "Get-Help Get-RDMPrivateSessionDomain -full".

---

### Syntax
```PowerShell
Get-RDMPrivateSessionDomain [-ID] <Guid> [<CommonParameters>]
```
```PowerShell
Get-RDMPrivateSessionDomain [-Session] <PSConnection> [<CommonParameters>]
```
