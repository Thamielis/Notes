Get-RDMRole
-----------

### Synopsis
Retrieve the list of available roles.

---

### Description

Retrieve the list of available roles for the current selected data source..

---

### Related Links
* [Set-RDMRole](Set-RDMRole)

* [New-RDMRole](New-RDMRole)

* [Set-RDMRoleProperty](Set-RDMRoleProperty)

* [Remove-RDMRole](Remove-RDMRole)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-RDMRole
Retrieves the list of available role.
```
> EXAMPLE 2

```PowerShell
PS C:\> $list = Get-RDMRole; $list[0]
Retrieves the list of available roles and displays the first item.
```
> EXAMPLE 3

```PowerShell
PS C:\> $list = Get-RDMRole; $list[1].Name = "New Name";Set-RDMRole $list[1]
Retrieves the list of available roles, modify the name of the second role, update the role.
```

---

### Parameters
#### **CaseSensitive**
Case sensitive

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
Role name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Inputs
System.String

Role name

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSRoleInfo[]

---

### Notes
For more information, type "Get-Help Get-RDMRole -detailed". For technical information, type "Get-Help Get-RDMRole -full".

---

### Syntax
```PowerShell
Get-RDMRole [-CaseSensitive] [[-Name] <String>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
