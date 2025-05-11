Get-RDMSessionOTP
-----------------

### Synopsis
Get the One Time Password from the specified session.

---

### Description

Get the One Time Password from the specified session. If a required log field is not provided (ticket number or comment) with the corresponding parameter, a prompt will occur to obtain both fields.

---

### Related Links
* [Get-RDMSession](Get-RDMSession)

* [Set-RDMSessionDomain](Set-RDMSessionDomain)

* [Get-RDMSessionUserName](Get-RDMSessionUserName)

* [Set-RDMSessionUsername](Set-RDMSessionUsername)

* [Get-RDMSessionPassword](Get-RDMSessionPassword)

* [Set-RDMSessionPassword](Set-RDMSessionPassword)

* [Get-RDMPrivateSessionOTP](Get-RDMPrivateSessionOTP)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-RDMSessionOTP "{00000000-0000-0000-0000-000000000000}"
Get the OTP from the session with ID = "{00000000-0000-0000-0000-000000000000}".
```
> EXAMPLE 2

```PowerShell
PS C:\> $list = Get-RDMSession; Get-RDMSessionOTP $list[1]
Retrieves the list of available sessions and gets the OTP from the the second element in the list.
```
> EXAMPLE 3

```PowerShell
PS C:\> Get-RDMSession -Name AnOTPCred | Get-RDMSessionOTP -TicketID 123 -Comment "It is a comment."
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

OTP entry obtained from Get-RDMSession

---

### Outputs
* [Management.Automation.PSCustomObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSCustomObject)

---

### Notes
For more information, type "Get-Help Get-RDMSessionOTP -detailed". For technical information, type "Get-Help Get-RDMSessionOTP -full".

---

### Syntax
```PowerShell
Get-RDMSessionOTP [-ID] <Guid> [[-Comment] <String>] [[-TicketID] <String>] [<CommonParameters>]
```
```PowerShell
Get-RDMSessionOTP [-Session] <PSConnection> [[-Comment] <String>] [[-TicketID] <String>] [<CommonParameters>]
```
