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
Set-RDMRootSession [-Refresh] [-RootSession] <PSConnection> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
