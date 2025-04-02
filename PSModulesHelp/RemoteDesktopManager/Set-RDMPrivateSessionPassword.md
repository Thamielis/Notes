Set-RDMPrivateSessionPassword
-----------------------------

### Synopsis
Set the password from the specified session.

---

### Description

Set the password from the specified session. Session must be marked as "Allow show credentials" if not null is returned.

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Set-RDMUserVaultSessionPassword -ID "{00000000-0000-0000-0000-000000000000}" -Password (Read-Host -AsSecureString "Password")
Set the password from the session with ID = "{00000000-0000-0000-0000-000000000000}".
```
> EXAMPLE 2

```PowerShell
PS C:\> $list = Get-RDMUserVaultSession; Set-RDMUserVaultSessionPassword -ID $list[1].ID -Password (Read-Host -AsSecureString "Password")
Retrieves the list of available sessions and sets the password from the the second element in the list.
```

---

### Parameters
#### **ID**
Specifies the ID of the session to get the password from.
Must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}.

|Type    |Required|Position|PipelineInput |
|--------|--------|--------|--------------|
|`[Guid]`|true    |1       |true (ByValue)|

#### **Password**
Password as SecureString.
Use either "Read-Host -AsSecureString" or "ConvertTo-SecureString"

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[SecureString]`|true    |2       |false        |

#### **PasswordAge**
Specifies password age in days. PasswordAge takes presedence over PasswordSinceDate.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |4       |false        |

#### **PasswordSinceDate**
Specifies date/time (UTC) at which the password was first created. PasswordAge takes presedence over PasswordSinceDate.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |5       |false        |

#### **Refresh**
Send refresh notification to Remote Desktop Manager application.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |3       |false        |

#### **Session**
Specifies the session to set the password to.

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
For more information, type "Get-Help Set-RDMPrivateSessionPassword -detailed". For technical information, type "Get-Help Set-RDMPrivateSessionPassword -full".

---

### Syntax
```PowerShell
Set-RDMPrivateSessionPassword [-ID] <Guid> [[-Refresh]] [-Password] <SecureString> [[-PasswordAge] <Int32>] [[-PasswordSinceDate] <DateTime>] [<CommonParameters>]
```
```PowerShell
Set-RDMPrivateSessionPassword [-Session] <PSConnection> [-Password] <SecureString> [[-PasswordAge] <Int32>] [[-PasswordSinceDate] <DateTime>] [<CommonParameters>]
```
