Get-RDMPrivateSessionOTP
------------------------

### Synopsis
Get the One Time Password from the specified session.

---

### Description

Get the One Time Password from the specified session.

---

### Related Links
* [Get-RDMPrivateSession](Get-RDMPrivateSession)

* [Set-RDMPrivateSessionDomain](Set-RDMPrivateSessionDomain)

* [Get-RDMPrivateSessionUserName](Get-RDMPrivateSessionUserName)

* [Set-RDMPrivateSessionUsername](Set-RDMPrivateSessionUsername)

* [Get-RDMPrivateSessionPassword](Get-RDMPrivateSessionPassword)

* [Set-RDMPrivateSessionPassword](Set-RDMPrivateSessionPassword)

* [Get-RDMSessionOTP](Get-RDMSessionOTP)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-RDMUserVaultSessionOTP "{00000000-0000-0000-0000-000000000000}"
Get the OTP from the session with ID = "{00000000-0000-0000-0000-000000000000}".
```
> EXAMPLE 2

```PowerShell
PS C:\> $list = Get-RDMUserVaultSession; Get-RDMUserVaultSessionOTP $list[1]
Retrieves the list of available sessions and gets the OTP from the the second element in the list.
```
> EXAMPLE 3

```PowerShell
PS C:\> Get-RDMPrivateSession -Name AnOTPCred | Get-RDMPrivateSessionOTP -TicketID 123 -Comment "It is a comment."
Get the OTP from the session AnOTPCred while filling the credential viewed log, avoiding the prompt.
```

---

### Parameters
#### **Comment**
Comment for the credential viewed log.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **ID**
Specifies the ID of the session to get the OTP from.
Must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}.

|Type    |Required|Position|PipelineInput |
|--------|--------|--------|--------------|
|`[Guid]`|true    |1       |true (ByValue)|

#### **Session**
Specifies the session to get the OTP from

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
System.Guid

ID of the OTP entry

RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection

OTP entry obtained from Get-RDMPrivateSession

---

### Outputs
* [Management.Automation.PSCustomObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSCustomObject)

---

### Notes
For more information, type "Get-Help Get-RDMPrivateSessionOTP -detailed". For technical information, type "Get-Help Get-RDMPrivateSessionOTP -full".

---

### Syntax
```PowerShell
Get-RDMPrivateSessionOTP [-ID] <Guid> [[-Comment] <String>] [[-TicketID] <String>] [<CommonParameters>]
```
```PowerShell
Get-RDMPrivateSessionOTP [-Session] <PSConnection> [[-Comment] <String>] [[-TicketID] <String>] [<CommonParameters>]
```
