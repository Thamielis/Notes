Set-RDMSession
--------------

### Synopsis
Save/set the session.

---

### Description

Save/set the session. Session must be first fetch via Session property of the Get-RDM-Session cmdlet or via the New-RDMSession result.

---

### Related Links
* [Get-RDMDataSource](Get-RDMDataSource)

* [Set-RDMDataSource](Set-RDMDataSource)

* [Get-RDMSession](Get-RDMSession)

* [New-RDMSession](New-RDMSession)

* [Remove-RDMSession](Remove-RDMSession)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $list = Get-RDMSession; $list[1].Name = "New Name";Set-RDMSession $list[1]
Retrieves the list of available sessions, modify the name of the second session, update the session.
```
> EXAMPLE 2

```PowerShell
PS C:\> $session = New-RDMSession -Name "New Session" -Host "myServer" -Kind "RDPConfigured";Set-RDMSession $session
Create & save new session.
```
> EXAMPLE 3

PS C:\> [Devolutions.Generated.Models.Connection].DeclaredFields | Where-Object -Property Name -like "*ConnectionID" | Select-Object -Property Name; $session = Get-RDMSession -Name ARDP"; $session.CredentialConnectionID = [Devolutions.Generated.Models.Connection]::MyDefaultCredentialConnectionID; Set-RDMSession $session
The user looks at the options for the type of credentials for entries. After finding the desired one, he gets the session ARDP. He sets the credentials to 'My Personal Credentials' and save the modification.

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

#### **Refresh**
Send refresh notification to Remote Desktop Manager application.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Session**
PSSession object, must be retrieved from Get-RDMSession or created via New-RDMSession.

|Type              |Required|Position|PipelineInput |
|------------------|--------|--------|--------------|
|`[PSConnection[]]`|true    |1       |true (ByValue)|

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-RDMSession -detailed". For technical information, type "Get-Help Set-RDMSession -full".

---

### Syntax
```PowerShell
Set-RDMSession [-Refresh] [-Session] <PSConnection[]> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
