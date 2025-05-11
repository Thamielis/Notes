Set-RDMPrivateSessionUsername
-----------------------------

### Synopsis
Set the username on the specified session.

---

### Description

Set the username on the specified session. To persist the new domain, the switch SetSession must be used.

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
PS C:\> Set-RDMUserVaultSessionUsername "{00000000-0000-0000-0000-000000000000}" "localadmin" -SetSession
Set the username from the user vault session with ID = "{00000000-0000-0000-0000-000000000000}".
```
> EXAMPLE 2

```PowerShell
PS C:\> $list = Get-RDMUserVaultSession; Get-RDMUserVaultSessionPassword -ID $list[1].ID -Username -SetSession
Retrieves the list of available sessions and gets the password from the the second element in the list.
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
Specifies the ID of the session to set the password from.
Must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}.

|Type    |Required|Position|PipelineInput |
|--------|--------|--------|--------------|
|`[Guid]`|true    |1       |true (ByValue)|

#### **PassThru**
Return the modified entry.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Refresh**
Send refresh notification to Remote Desktop Manager application.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Session**
Specifies the session to set the username to

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSConnection]`|true    |1       |true (ByValue)|

#### **SetSession**
Save the session in the current data source.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **UserName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection

---

### Notes
For more information, type "Get-Help Set-RDMPrivateSessionUsername -detailed". For technical information, type "Get-Help Set-RDMPrivateSessionUsername -full".

---

### Syntax
```PowerShell
Set-RDMPrivateSessionUsername [-ID] <Guid> [-UserName] <String> [-PassThru] [-Refresh] [-SetSession] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Set-RDMPrivateSessionUsername [-Session] <PSConnection> [-UserName] <String> [-PassThru] [-Refresh] [-SetSession] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
