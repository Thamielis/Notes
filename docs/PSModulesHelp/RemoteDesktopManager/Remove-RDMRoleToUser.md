Remove-RDMRoleToUser
--------------------

### Synopsis
Remove a role to an user.

---

### Description

Remove a role to an user.

---

### Related Links
* [Add-RDMRoleToUser](Add-RDMRoleToUser)

* [Get-RDMUser](Get-RDMUser)

* [Set-RDMUser](Set-RDMUser)

* [New-RDMUser](New-RDMUser)

* [Get-RDMRole](Get-RDMRole)

* [New-RDMRole](New-RDMRole)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Remove-RDMRoleToUser -Role $role -User $user
Remove role to an user.
```

---

### Parameters
#### **Role**
Role object, must be retrieved from Get-RDMRole or created via New-RDMRole.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[PSRoleInfo]`|true    |1       |false        |

#### **User**
User object, must be retrieved from Get-RDMUser or created via New-RDMUser.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[PSUserInfo]`|true    |2       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Remove-RDMRoleToUser -detailed". For technical information, type "Get-Help Remove-RDMRoleToUser -full".

---

### Syntax
```PowerShell
Remove-RDMRoleToUser [-Role] <PSRoleInfo> [-User] <PSUserInfo> [<CommonParameters>]
```
