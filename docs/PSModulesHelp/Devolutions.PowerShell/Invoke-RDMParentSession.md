Invoke-RDMParentSession
-----------------------

### Synopsis
Invoke a refactoring action to move a connection under a parent connection.

---

### Description

Move a session under a parent session.

---

### Related Links
* [Invoke-RDMUnparentSession](Invoke-RDMUnparentSession)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $list = Get-RDMSession; $parent = $list[0]; $child = $list[1]; Invoke-RDMParentSession -ParentSession $parent -Session $child -Refresh
Session in the variable $child becomes a subconnection of the session in the variable $parent and refresh the sessions.
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

#### **ParentSession**
PSConnection object, must be retrieved from Get-RDMSession or created via New-RDMSession that you will become the parent of the sessions.

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSConnection]`|true    |2       |true (ByValue)|

#### **Refresh**
Send refresh notification to Remote Desktop Manager application.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Session**
PSConnection object, must be retrieved from Get-RDMSession or created via New-RDMSession that will become a subconnection of the parent session.

|Type              |Required|Position|PipelineInput |
|------------------|--------|--------|--------------|
|`[PSConnection[]]`|true    |1       |true (ByValue)|

#### **UseInheritedVPN**
Use inherited VPN.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Switch]`|false   |named   |true (ByValue)|

#### **UseParentCredentials**
Use parent credentials.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Switch]`|false   |named   |true (ByValue)|

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Invoke-RDMParentSession -detailed". For technical information, type "Get-Help Invoke-RDMParentSession -full".

---

### Syntax
```PowerShell
Invoke-RDMParentSession [-ParentSession] <PSConnection> [-Refresh] [-Session] <PSConnection[]> [-UseInheritedVPN] [-UseParentCredentials] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
