Set-RDMUserGroupRights
----------------------

### Synopsis
Assign/set user permissions.

---

### Description

Assign/set user permissions.

---

### Related Links
* [Get-RDMUser](Get-RDMUser)

* [New-RDMUser](New-RDMUser)

* [New-RDMUser](New-RDMUser)

* [Remove-RDMUser](Remove-RDMUser)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $users = Get-RDMUser; $groups = Get-RDMGroup; Set-RDMUserGroupRights -user $users[1] -SecurityGroup $groups[0] -Add -Delete
Retrieves the list of available users and groups. Set permission add and delete to the second user of the list on the first group of the list
```

---

### Parameters
#### **Add**
Allows the user to add entries in groups/folders for that security group.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |4       |false        |

#### **Delete**
Allows the user to Delete the entries for that security group.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |6       |false        |

#### **Edit**
Allows the user to Edit the entries for that security group.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |5       |false        |

#### **SecurityGroup**
Security group object, must be retrieved from Get-RDMSecurityGroup or created via New-RDMSecurityGroup.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[PSSecurityGroupInfo]`|true    |2       |false        |

#### **SetUser**
Set the user in the data source

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

#### **User**
User object, must be retrieved from Get-RDMUser or created via New-RDMUser.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[PSUserInfo]`|true    |1       |false        |

#### **View**
Allows the user to View AND USE the entries for that security group.

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
For more information, type "Get-Help Set-RDMUserGroupRights -detailed". For technical information, type "Get-Help Set-RDMUserGroupRights -full".

---

### Syntax
```PowerShell
Set-RDMUserGroupRights [-User] <PSUserInfo> [-SecurityGroup] <PSSecurityGroupInfo> [[-Add] <Boolean>] [[-Delete] <Boolean>] [[-Edit] <Boolean>] [[-View] <Boolean>] [[-SetUser]] [<CommonParameters>]
```
