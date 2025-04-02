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
|`[Switch]`|false   |named   |true (ByValue)|

#### **Comment**
Comment for the credential viewed log.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ForcePromptAnswer**
Switch to use with caution. It will automatically answer prompt asking yes/no, yes/no/cancel, or ok/cancel questions. In case of multiple prompts, multiple values can be passed to this parameter. Here are the accepted values:
* Yes: Accept the prompt. Cover the OK and Automatic value.
* No: Refuse the yes/no/cancel prompt. Cancel is the fallback option if there is not an option No.
* Cancel: Cancel the yes/no/cancel prompt. No is the fallback option if there is not an option Cancel.
Valid Values:

* Cancel
* No
* Yes

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[DialogResult[]]`|false   |named   |false        |

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
|`[Switch]`|true    |named   |false        |

#### **MyPrivilegedAccount**
Obtain the password from 'My Privileged Account'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Session**
Specifies the session to get the password from.

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSConnection]`|true    |1       |true (ByValue)|

#### **TicketID**
Ticket number for the credential viewed log

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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
Get-RDMSessionPassword [-ID] <Guid> [-AsPlainText] [-Comment <String>] [-TicketID <String>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Get-RDMSessionPassword -MyPersonalCredentials [-AsPlainText] [-Comment <String>] [-TicketID <String>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Get-RDMSessionPassword -MyPrivilegedAccount [-AsPlainText] [-Comment <String>] [-TicketID <String>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Get-RDMSessionPassword [-Session] <PSConnection> [-AsPlainText] [-Comment <String>] [-TicketID <String>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
