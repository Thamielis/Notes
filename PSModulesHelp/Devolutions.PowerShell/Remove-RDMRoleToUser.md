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
Remove-RDMRoleToUser [-Role] <PSRoleInfo> [-User] <PSUserInfo> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
