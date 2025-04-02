Get-RDMPrivateSessionPassword
-----------------------------

### Synopsis
Get the password from the specified session.

---

### Description

Get the password from the specified session. Session must be marked as "Allow show credentials" if not null is returned.

---

### Related Links
* [Get-RDMPrivateSession](Get-RDMPrivateSession)

* [Get-RDMPrivateSessionDomain](Get-RDMPrivateSessionDomain)

* [Set-RDMPrivateSessionDomain](Set-RDMPrivateSessionDomain)

* [Get-RDMPrivateSessionUserName](Get-RDMPrivateSessionUserName)

* [Set-RDMPrivateSessionUsername](Set-RDMPrivateSessionUsername)

* [Set-RDMPrivateSessionPassword](Set-RDMPrivateSessionPassword)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-RDMUserVaultSessionPassword "{00000000-0000-0000-0000-000000000000}"
Get the password from the session with ID = "{00000000-0000-0000-0000-000000000000}".
```
> EXAMPLE 2

```PowerShell
PS C:\> $list = Get-RDMUserVaultSession; Get-RDMUserVaultSessionPassword $list[1].ID
Retrieves the list of available sessions and gets the password from the the second element in the list.
```

---

### Parameters
#### **AsPlainText**
Returns the password as plain text.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Switch]`|false   |2       |true (ByValue)|

#### **Comment**
Comment for the credential viewed log.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **ID**
Specifies the ID of the session to get the password from.
Must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}.

|Type    |Required|Position|PipelineInput |
|--------|--------|--------|--------------|
|`[Guid]`|true    |1       |true (ByValue)|

#### **Session**
Specifies the session to get the password from.

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSConnection]`|true    |1       |true (ByValue)|

#### **TicketID**
Ticket number for the credential viewed log

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
For more information, type "Get-Help Get-RDMPrivateSessionPassword -detailed". For technical information, type "Get-Help Get-RDMPrivateSessionPassword -full".

---

### Syntax
```PowerShell
Get-RDMPrivateSessionPassword [-ID] <Guid> [[-AsPlainText]] [[-Comment] <String>] [[-TicketID] <String>] [<CommonParameters>]
```
```PowerShell
Get-RDMPrivateSessionPassword [-Session] <PSConnection> [[-AsPlainText]] [[-Comment] <String>] [[-TicketID] <String>] [<CommonParameters>]
```
