Add-RDMRoleRepositoryAccess
---------------------------

### Synopsis
Add repository access to a role

---

### Description

Add repository access to a role

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Add-RDMRoleRepositoryAccess -Role $role -Repository $repo;Set-RDMRole $role
Add a repository access to a role.
```

---

### Parameters
#### **Repository**
Repository the role will be granted access

|Type                |Required|Position|PipelineInput |Aliases|
|--------------------|--------|--------|--------------|-------|
|`[PSRepositoryInfo]`|true    |2       |true (ByValue)|Vault  |

#### **Role**
Role that will be granted access to a repository

|Type          |Required|Position|PipelineInput |
|--------------|--------|--------|--------------|
|`[PSRoleInfo]`|true    |1       |true (ByValue)|

---

### Inputs
RemoteDesktopManager.PowerShellModule.PSOutputObject.PSRoleInfo

Role that will be granted access to a repository

RemoteDesktopManager.PowerShellModule.PSOutputObject.PSRepositoryInfo

Repository the role will be granted access

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Add-RDMRoleRepositoryAccess -detailed". For technical information, type "Get-Help Add-RDMRoleRepositoryAccess -full".

---

### Syntax
```PowerShell
Add-RDMRoleRepositoryAccess [-Repository] <PSRepositoryInfo> [-Role] <PSRoleInfo> [<CommonParameters>]
```
