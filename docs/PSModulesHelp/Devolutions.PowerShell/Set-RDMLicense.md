Set-RDMLicense
--------------

### Synopsis
Save/set the license.

---

### Description

Save/set the license. License must be first fetch via license property of the Get-RDMLicense cmdlet or via the New-RDMLicense result.

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $license = New-RDMLicense -Name "New License" ;Set-License $license
Create & save new license.
```

---

### Parameters
#### **AutoAssign**
Auto assign new users to automatically provide the Remote Desktop Manager serial to all newly created users. For others serials, it will be ignored.

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

#### **License**
License object, must be retrieved from Get-RDMLicense or created via New-RDMLicense.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[PSLicenseInfo]`|true    |1       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-RDMLicense -detailed". For technical information, type "Get-Help Set-RDMLicense -full".

---

### Syntax
```PowerShell
Set-RDMLicense [-AutoAssign] [-License] <PSLicenseInfo> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
