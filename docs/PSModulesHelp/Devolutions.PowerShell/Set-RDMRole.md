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
Set-RDMRole [-Role] <PSRoleInfo> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
