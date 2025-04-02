Set-RDMPrivateSessionUsername
-----------------------------

### Synopsis
Set the username on the specified session.

---

### Description

Set the username on the specified session.

---

### Related Links
* [Get-RDMPrivateSession](Get-RDMPrivateSession)

* [Get-RDMPrivateSessionDomain](Get-RDMPrivateSessionDomain)

* [Set-RDMPrivateSessionDomain](Set-RDMPrivateSessionDomain)

* [Get-RDMPrivateSessionUserName](Get-RDMPrivateSessionUserName)

* [Get-RDMPrivateSessionPassword](Get-RDMPrivateSessionPassword)

* [Set-RDMPrivateSessionPassword](Set-RDMPrivateSessionPassword)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Set-RDMUserVaultSessionUsername "{00000000-0000-0000-0000-000000000000}" "localadmin"
Set the username from the user vault session with ID = "{00000000-0000-0000-0000-000000000000}".
```
> EXAMPLE 2

```PowerShell
PS C:\> $list = Get-RDMUserVaultSession; Get-RDMUserVaultSessionPassword -ID $list[1].ID -Username
Retrieves the list of available sessions and gets the password from the the second element in the list.
```

---

### Parameters
#### **ID**
Specifies the ID of the session to set the password from.
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
Specifies the session to set the username to

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSConnection]`|true    |1       |true (ByValue)|

#### **UserName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-RDMPrivateSessionUsername -detailed". For technical information, type "Get-Help Set-RDMPrivateSessionUsername -full".

---

### Syntax
```PowerShell
Set-RDMPrivateSessionUsername [-ID] <Guid> [[-Refresh]] [-UserName] <String> [<CommonParameters>]
```
```PowerShell
Set-RDMPrivateSessionUsername [-Session] <PSConnection> [-UserName] <String> [<CommonParameters>]
```
