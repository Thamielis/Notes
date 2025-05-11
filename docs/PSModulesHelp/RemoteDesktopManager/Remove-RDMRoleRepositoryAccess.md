Remove-RDMRoleRepositoryAccess
------------------------------

### Synopsis
Remove repository access to a role

---

### Description

Remove repository access to a role

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Remove-RDMRoleRepositoryAccess -Role $role -Repository $repo;Set-RDMRole $role
Remove repository access to a role.
```

---

### Parameters
#### **Repository**
Repository the role will be denied access

|Type                |Required|Position|PipelineInput |
|--------------------|--------|--------|--------------|
|`[PSRepositoryInfo]`|true    |2       |true (ByValue)|

#### **Role**
Role that will be denied access to a repository

|Type          |Required|Position|PipelineInput |
|--------------|--------|--------|--------------|
|`[PSRoleInfo]`|true    |1       |true (ByValue)|

---

### Inputs
RemoteDesktopManager.PowerShellModule.PSOutputObject.PSRoleInfo

Role that will be denied access to a repository

RemoteDesktopManager.PowerShellModule.PSOutputObject.PSRepositoryInfo

Repository the role will be denied access

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Remove-RDMRoleRepositoryAccess -detailed". For technical information, type "Get-Help Remove-RDMRoleRepositoryAccess -full".

---

### Syntax
```PowerShell
Remove-RDMRoleRepositoryAccess [-Repository] <PSRepositoryInfo> [-Role] <PSRoleInfo> [<CommonParameters>]
```
