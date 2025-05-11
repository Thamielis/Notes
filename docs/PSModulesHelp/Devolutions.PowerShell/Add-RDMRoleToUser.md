Add-RDMRoleToUser
-----------------

### Synopsis
Add role to an user

---

### Description

Add role to an user

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Add-RDMRoleToUser -RoleObject $role -UserObject $user;Set-RDMUser $user
Add role to an user.
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

#### **RoleName**
Role name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **RoleObject**
Role object, must be retrieved from Get-RDMRole or created via New-RDMRole.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[PSRoleInfo]`|true    |1       |false        |

#### **UserName**
User name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **UserObject**
User object, must be retrieved from Get-RDMSecurityGroup or created via New-RDMUser.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[PSUserInfo]`|true    |2       |false        |

---

### Inputs
System.String

The name of the role and/or user

RemoteDesktopManager.PowerShellModule.PSOutputObject.PSRoleInfo

The Role to which the user will be assigned

RemoteDesktopManager.PowerShellModule.PSOutputObject.PSUserInfo

The user to which a role will be assigned

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Add-RDMRoleToUser -detailed". For technical information, type "Get-Help Add-RDMRoleToUser -full".

---

### Syntax
```PowerShell
Add-RDMRoleToUser [-RoleName] <String> [-UserName] <String> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Add-RDMRoleToUser [-RoleName] <String> [-UserObject] <PSUserInfo> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Add-RDMRoleToUser [-RoleObject] <PSRoleInfo> [-UserObject] <PSUserInfo> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Add-RDMRoleToUser [-RoleObject] <PSRoleInfo> [-UserName] <String> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
