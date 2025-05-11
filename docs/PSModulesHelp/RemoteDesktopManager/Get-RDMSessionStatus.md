Get-RDMSessionStatus
--------------------

### Synopsis
Get the status from the specified session.

---

### Description

Get the status from the specified session.

---

### Related Links
* [Get-RDMSession](Get-RDMSession)

* [Set-RDMSessionDomain](Set-RDMSessionDomain)

* [Get-RDMSessionUserName](Get-RDMSessionUserName)

* [Set-RDMSessionUsername](Set-RDMSessionUsername)

* [Get-RDMSessionPassword](Get-RDMSessionPassword)

* [Set-RDMSessionPassword](Set-RDMSessionPassword)

* [Set-RDMSessionStatus](Set-RDMSessionStatus)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-RDMSessionStatus "{00000000-0000-0000-0000-000000000000}"
Get the status from the session with ID = "{00000000-0000-0000-0000-000000000000}".
```
> EXAMPLE 2

```PowerShell
PS C:\> $list = Get-RDMSession; Get-RDMSessionStatus $list[1]
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
For more information, type "Get-Help Get-RDMSessionStatus -detailed". For technical information, type "Get-Help Get-RDMSessionStatus -full".

---

### Syntax
```PowerShell
Get-RDMSessionStatus [-ID] <Guid> [<CommonParameters>]
```
```PowerShell
Get-RDMSessionStatus [-Session] <PSConnection> [<CommonParameters>]
```
