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
Add-RDMUserRepositoryAccess [-Repository] <PSRepositoryInfo> [-User] <PSUserInfo> [<CommonParameters>]
```
