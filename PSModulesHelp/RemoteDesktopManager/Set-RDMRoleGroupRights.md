Set-RDMRoleGroupRights
----------------------

### Synopsis
Assign/set role permissions.

---

### Description

Assign/set role permissions.

---

### Related Links
* [Get-RDMRole](Get-RDMRole)

* [New-RDMRole](New-RDMRole)

* [New-RDMRole](New-RDMRole)

* [Remove-RDMRole](Remove-RDMRole)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $roles = Get-RDMRole; $groups = Get-RDMSecurityGroup; Set-RDMRoleGroupRights -role $roles[1] -SecurityGroup $groups[0] -Add $true -Delete $true
Retrieves the list of available roles and groups. Set permission add and delete to the second role of the list on the first group of the list
```

---

### Parameters
#### **Add**
Allows the role to add entries in groups/folders for that security group.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |4       |false        |

#### **Delete**
Allows the role to Delete the entries for that security group.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |6       |false        |

#### **Edit**
Allows the role to Edit the entries for that security group.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |5       |false        |

#### **Role**
role object, must be retrieved from Get-RDMRole or created via New-RDMRole.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[PSRoleInfo]`|true    |1       |false        |

#### **SecurityGroup**
Security group object, must be retrieved from Get-RDMSecurityGroup or created via New-RDMSecurityGroup.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[PSSecurityGroupInfo]`|true    |2       |false        |

#### **View**
Allows the role to View AND USE the entries for that security group.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |3       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-RDMRoleGroupRights -detailed". For technical information, type "Get-Help Set-RDMRoleGroupRights -full".

---

### Syntax
```PowerShell
Set-RDMRoleGroupRights [-Role] <PSRoleInfo> [-SecurityGroup] <PSSecurityGroupInfo> [[-Add] <Boolean>] [[-Delete] <Boolean>] [[-Edit] <Boolean>] [[-View] <Boolean>] [<CommonParameters>]
```
