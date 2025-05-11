Set-RDMRoleProperty
-------------------

### Synopsis
Set the value of property given to a role.

---

### Description

Set the value of property given to a role.

---

### Related Links
* [Get-RDMRole](Get-RDMRole)

* [New-RDMRole](New-RDMRole)

* [New-RDMRole](New-RDMRole)

* [Remove-RDMRole](Remove-RDMRole)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Set-RDMRoleProperty -Role "$role"-Property "Description" -Value "My New Description"
Set the description value for the role given.
```
> EXAMPLE 2

```PowerShell
PS C:\> $list = Get-RDMRole; Set-RDMRoleProperty -Role $list[1] -Property "Description" -Value "My description"
Retrieves the list of available role and then sets the description value of the the second element in the list.
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

#### **Property**
Property to set.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **Role**
Specifies the ID of the session to get the password from.
Must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}.

|Type          |Required|Position|PipelineInput |
|--------------|--------|--------|--------------|
|`[PSRoleInfo]`|true    |1       |true (ByValue)|

#### **Value**
New value.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |3       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-RDMRoleProperty -detailed". For technical information, type "Get-Help Set-RDMRoleProperty -full".

---

### Syntax
```PowerShell
Set-RDMRoleProperty [-Property] <String> [-Role] <PSRoleInfo> [-Value] <Object> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
