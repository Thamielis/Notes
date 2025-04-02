New-RDMLicense
--------------

### Synopsis
Create a new license instance.

---

### Description

Create a license instance. The instance has not yet been saved. Assign the result to a variable then call "Set-RDMLicense $s" to save the license.

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> New-RDMLicense -Serial "a-valid-serial-123" -AutoAssign -SetLicense
Create & save a new license that will be automatically assigned to new users.
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

#### **Serial**
New license serial.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **SetLicense**
Save the new license.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSLicenseInfo

---

### Notes
For more information, type "Get-Help New-RDMLicense -detailed". For technical information, type "Get-Help New-RDMLicense -full".

---

### Syntax
```PowerShell
New-RDMLicense [-AutoAssign] [-Serial] <String> [-SetLicense] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
