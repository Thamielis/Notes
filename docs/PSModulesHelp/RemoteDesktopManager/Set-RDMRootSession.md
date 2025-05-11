Set-RDMRootSession
------------------

### Synopsis
Save the root session.

---

### Description

Save the root session. Root session must be first fetch via  the Get-RDMRootSession cmdlet.

---

### Related Links
* [Get-RDMRootSession](Get-RDMRootSession)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $rootSession = Get-RDMRootSession; $rootSession.Name = "New Name";Set-RDMRootSession -RootSession $rootSession
Retrieves the root session, modify the root session name, save the root session.
```

---

### Parameters
#### **Refresh**
Send refresh notification to Remote Desktop Manager application.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |2       |false        |

#### **RootSession**
PSConnection object, must be retrieved from Get-RDMRootSession.

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
For more information, type "Get-Help Set-RDMRootSession -detailed". For technical information, type "Get-Help Set-RDMRootSession -full".

---

### Syntax
```PowerShell
Set-RDMRootSession [-RootSession] <PSConnection> [[-Refresh]] [<CommonParameters>]
```
