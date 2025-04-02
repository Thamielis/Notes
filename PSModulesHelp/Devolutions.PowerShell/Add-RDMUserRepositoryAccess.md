Add-RDMUserRepositoryAccess
---------------------------

### Synopsis
Add repository access to an user

---

### Description

Add repository access to an user

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Add-RDMUserRepositoryAccess -User $user -Repository $repo;Set-RDMUser $user
Add repository access to an user.
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

#### **Repository**
Repository the user will be granted access

|Type                |Required|Position|PipelineInput |Aliases|
|--------------------|--------|--------|--------------|-------|
|`[PSRepositoryInfo]`|true    |2       |true (ByValue)|Vault  |

#### **User**
User that will be granted access to a repository

|Type          |Required|Position|PipelineInput |
|--------------|--------|--------|--------------|
|`[PSUserInfo]`|true    |1       |true (ByValue)|

---

### Inputs
RemoteDesktopManager.PowerShellModule.PSOutputObject.PSUserInfo

User that will be granted access to a repository

RemoteDesktopManager.PowerShellModule.PSOutputObject.PSRepositoryInfo

Repository the user will be granted access

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Add-RDMUserRepositoryAccess -detailed". For technical information, type "Get-Help Add-RDMUserRepositoryAccess -full".

---

### Syntax
```PowerShell
Add-RDMUserRepositoryAccess [-Repository] <PSRepositoryInfo> [-User] <PSUserInfo> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
