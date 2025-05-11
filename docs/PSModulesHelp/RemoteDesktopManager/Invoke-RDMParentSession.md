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
#### **ParentSession**
PSConnection object, must be retrieved from Get-RDMSession or created via New-RDMSession that you will become the parent of the sessions.

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSConnection]`|true    |1       |true (ByValue)|

#### **Refresh**
Send refresh notification to Remote Desktop Manager application.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |2       |false        |

#### **Session**
PSConnection object, must be retrieved from Get-RDMSession or created via New-RDMSession that will become a subconnection of the parent session.

|Type              |Required|Position|PipelineInput |
|------------------|--------|--------|--------------|
|`[PSConnection[]]`|true    |1       |true (ByValue)|

#### **UseInheritedVPN**
Use inherited VPN.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Switch]`|false   |1       |true (ByValue)|

#### **UseParentCredentials**
Use parent credentials.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Switch]`|false   |1       |true (ByValue)|

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
Invoke-RDMParentSession [-Session] <PSConnection[]> [-ParentSession] <PSConnection> [[-Refresh]] [[-UseParentCredentials]] [[-UseInheritedVPN]] [<CommonParameters>]
```
