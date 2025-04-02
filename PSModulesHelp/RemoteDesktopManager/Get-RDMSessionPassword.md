Get-RDMSessionPassword
----------------------

### Synopsis
Get the password from the specified session.

---

### Description

Get the password from the specified session. Session must be marked as "Allow show credentials" if not null is returned.

---

### Related Links
* [Get-RDMSession](Get-RDMSession)

* [Get-RDMSessionDomain](Get-RDMSessionDomain)

* [Set-RDMSessionDomain](Set-RDMSessionDomain)

* [Get-RDMSessionUserName](Get-RDMSessionUserName)

* [Set-RDMSessionUsername](Set-RDMSessionUsername)

* [Set-RDMSessionPassword](Set-RDMSessionPassword)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-RDMSessionPassword "{00000000-0000-0000-0000-000000000000}"
Get the password from the session with ID = "{00000000-0000-0000-0000-000000000000}".
```
> EXAMPLE 2

```PowerShell
PS C:\> $list = Get-RDMSession; Get-RDMSessionPassword $list[1].ID
Retrieves the list of available sessions and gets the password from the the second element in the list.
```
> EXAMPLE 3

```PowerShell
PS C:\> $pwd = Get-RDMSessionPassword -MyPersonalCredentials -AsPlainText
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

#### **MyPersonalCredentials**
Obtain the password from 'My Personal Credentials'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |1       |false        |

#### **MyPrivilegedAccount**
Obtain the password from 'My Privileged Account'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |1       |false        |

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
For more information, type "Get-Help Get-RDMSessionPassword -detailed". For technical information, type "Get-Help Get-RDMSessionPassword -full".

---

### Syntax
```PowerShell
Get-RDMSessionPassword [-ID] <Guid> [[-AsPlainText]] [[-Comment] <String>] [[-TicketID] <String>] [<CommonParameters>]
```
```PowerShell
Get-RDMSessionPassword [-MyPersonalCredentials] [[-AsPlainText]] [[-Comment] <String>] [[-TicketID] <String>] [<CommonParameters>]
```
```PowerShell
Get-RDMSessionPassword [-MyPrivilegedAccount] [[-AsPlainText]] [[-Comment] <String>] [[-TicketID] <String>] [<CommonParameters>]
```
```PowerShell
Get-RDMSessionPassword [-Session] <PSConnection> [[-AsPlainText]] [[-Comment] <String>] [[-TicketID] <String>] [<CommonParameters>]
```
