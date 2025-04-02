Set-RDMPrivateSessionDomain
---------------------------

### Synopsis
Set the domain from the specified session.

---

### Description

Set the domain from the specified session.

---

### Related Links
* [Get-RDMSession](Get-RDMSession)

* [Get-RDMSessionDomain](Get-RDMSessionDomain)

* [Get-RDMSessionUserName](Get-RDMSessionUserName)

* [Set-RDMSessionUsername](Set-RDMSessionUsername)

* [Get-RDMSessionPassword](Get-RDMSessionPassword)

* [Set-RDMSessionPassword](Set-RDMSessionPassword)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Set-RDMUserVaultSessionDomain "{00000000-0000-0000-0000-000000000000}" "MyOtherDomain.com"
Set the domain from the session with ID = "{00000000-0000-0000-0000-000000000000}".
```
> EXAMPLE 2

```PowerShell
PS C:\> $list = Get-RDMUserVaultSession; Set-RDMSessionDomain -ID $list[1].ID -Domain "MyOtherDomain.com" -Refresh
Retrieves the list of available sessions and sets the domain from the the second element in the list with UI refresh.
```

---

### Parameters
#### **Domain**
New domain name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **ID**
Specifies the ID of the session to get the domain from.
Must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}.

|Type    |Required|Position|PipelineInput |
|--------|--------|--------|--------------|
|`[Guid]`|true    |1       |true (ByValue)|

#### **Refresh**
Send refresh notification to Remote Desktop Manager application.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |3       |false        |

#### **Session**
Specifies the session to set the Domain to.

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
For more information, type "Get-Help Set-RDMPrivateSessionDomain -detailed". For technical information, type "Get-Help Set-RDMPrivateSessionDomain -full".

---

### Syntax
```PowerShell
Set-RDMPrivateSessionDomain [-ID] <Guid> [[-Refresh]] [-Domain] <String> [<CommonParameters>]
```
```PowerShell
Set-RDMPrivateSessionDomain [-Session] <PSConnection> [-Domain] <String> [<CommonParameters>]
```
