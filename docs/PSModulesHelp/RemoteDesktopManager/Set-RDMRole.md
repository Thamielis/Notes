Set-RDMRole
-----------

### Synopsis
Save/set the role.

---

### Description

Save/set the role. Role must be first fetch via role property of the Get-RDMRole cmdlet or via the New-RDMRole result.

---

### Related Links
* [Get-RDMRole](Get-RDMRole)

* [New-RDMRole](New-RDMRole)

* [Set-RDMRoleProperty](Set-RDMRoleProperty)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $role = New-RDMRole -Name "New Role" ;Set-RDMRole $role
Create & save new role.
```

---

### Parameters
#### **Role**
Role object, must be retrieved from Get-RDMRoleSecurityGroup or created via New-RDMRole.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[PSRoleInfo]`|true    |1       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-RDMRole -detailed". For technical information, type "Get-Help Set-RDMRole -full".

---

### Syntax
```PowerShell
Set-RDMRole [-Role] <PSRoleInfo> [<CommonParameters>]
```
