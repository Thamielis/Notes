Get-RDMSessionUserName
----------------------

### Synopsis
Get the username from the specified session.

---

### Description

Get the username from the specified session.

---

### Related Links
* [Get-RDMSession](Get-RDMSession)

* [Get-RDMSessionDomain](Get-RDMSessionDomain)

* [Set-RDMSessionDomain](Set-RDMSessionDomain)

* [Set-RDMSessionUsername](Set-RDMSessionUsername)

* [Get-RDMSessionPassword](Get-RDMSessionPassword)

* [Set-RDMSessionPassword](Set-RDMSessionPassword)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-RDMSessionUserName "{00000000-0000-0000-0000-000000000000}"
Get the username from the session with ID = "{00000000-0000-0000-0000-000000000000}".
```
> EXAMPLE 2

```PowerShell
PS C:\> $list = Get-RDMSession; Get-RDMSessionUserName $list[1].ID
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
For more information, type "Get-Help Get-RDMSessionUserName -detailed". For technical information, type "Get-Help Get-RDMSessionUserName -full".

---

### Syntax
```PowerShell
Get-RDMSessionUserName [-ID] <Guid> [<CommonParameters>]
```
```PowerShell
Get-RDMSessionUserName [-Session] <PSConnection> [<CommonParameters>]
```
