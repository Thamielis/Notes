Set-RDMPrivateSessionPassword
-----------------------------

### Synopsis
Set the password from the specified session.

---

### Description

Set the password from the specified session. Session must be marked as "Allow show credentials" if not null is returned.  To persist the new password, the switch SetSession must be used.

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Set-RDMUserVaultSessionPassword -ID "{00000000-0000-0000-0000-000000000000}" -Password (Read-Host -AsSecureString "Password") -SetSession
Set the password from the session with ID = "{00000000-0000-0000-0000-000000000000}".
```
> EXAMPLE 2

```PowerShell
PS C:\> $list = Get-RDMUserVaultSession; Set-RDMUserVaultSessionPassword -ID $list[1].ID -Password (Read-Host -AsSecureString "Password") -SetSession
Retrieves the list of available sessions and sets the password from the the second element in the list.
```
> EXAMPLE 3

```PowerShell
PS C:\> Get-RDMUserVaultSession -Name 'UniqueName' |
                    Set-RDMUserVaultSessionDomain -Domain "MyOtherDomain.com" -PassThru |
                    Set-RDMUserVaultSessionPassword -Password $securePassword -PassThru |
                    Set-RDMUserVaultSessionUsername -UserName 'NewUserName' -PassThru |
                    Set-RDMUserVaultSession
Modify the domain, password and username of the entry named 'UniqueName'. The variable $securePassword is a secure string previously set. Persist the modification with the Set-RDMUserVaultSession call.
```

---

### Parameters
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

#### **PassThru**
Return the modified entry.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
|`[Int32]`|false   |3       |false        |

#### **PasswordSinceDate**
Specifies date/time (UTC) at which the password was first created. PasswordAge takes presedence over PasswordSinceDate.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |4       |false        |

#### **Refresh**
Send refresh notification to Remote Desktop Manager application.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Session**
Specifies the session to set the password to.

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSConnection]`|true    |1       |true (ByValue)|

#### **SetSession**
Save the session in the current data source.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection

---

### Notes
For more information, type "Get-Help Set-RDMPrivateSessionPassword -detailed". For technical information, type "Get-Help Set-RDMPrivateSessionPassword -full".

---

### Syntax
```PowerShell
Set-RDMPrivateSessionPassword [-ID] <Guid> [-Password] <SecureString> [[-PasswordAge] <Int32>] [-PassThru] [[-PasswordSinceDate] <DateTime>] [-Refresh] [-SetSession] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Set-RDMPrivateSessionPassword [-Session] <PSConnection> [-Password] <SecureString> [[-PasswordAge] <Int32>] [-PassThru] [[-PasswordSinceDate] <DateTime>] [-Refresh] [-SetSession] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
