New-RDMRole
-----------

### Synopsis
Create a new role instance.

---

### Description

Create a role instance. The instance has not yet been saved. Assign the result to a variable then call "Set-RDMRole $s" to save the role.

---

### Related Links
* [Get-RDMRole](Get-RDMRole)

* [Set-RDMRole](Set-RDMRole)

* [Set-RDMRoleProperty](Set-RDMRoleProperty)

* [Remove-RDMRole](Remove-RDMRole)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $role = New-RDMRole -Name "New Role" ;Set-RDMRole $role
Create & save new role.
```

---

### Parameters
#### **Description**
Role description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

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

#### **Name**
New role name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **SetRole**
Save the new role.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |3       |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSRoleInfo

---

### Notes
For more information, type "Get-Help New-RDMRole -detailed". For technical information, type "Get-Help New-RDMRole -full".

---

### Syntax
```PowerShell
New-RDMRole [[-SetRole]] [[-Description] <String>] [-Name] <String> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
