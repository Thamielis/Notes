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
Remove-RDMRoleRepositoryAccess [-Repository] <PSRepositoryInfo> [-Role] <PSRoleInfo> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
